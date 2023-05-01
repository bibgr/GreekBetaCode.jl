#
# This is a greek language only --- hence, partial --- implementation of the TLG® Beta Code  [1]
# that aims to cover enough codepoints as to represent an entire Greek New Testament edition  in
# Beta Code and in corresponding Unicode, with the SBL Greek New Testament  in  mind,  including
# (i) the Greek Alphabet (subsection 1.1 of [1]); (ii) basic Greek punctuation  (subsection  1.1
# of [1]); (iii) combining Greek Diacritics (subsection 1.3 of [1]); as  well  as  partial  (iv)
# quotation marks (subsection 3.1 of [1]); (v) brackets (subsection 3.2 of [1]); (vi) additional
# punctuation and characters (subsections 3.3 and 3.4 of [1]). The code has been revised  as  to
# include  most  Greek  uses  and  mitigating  Beta  Code's  redundancies,  which  appear  quite
# frequently. Some rules from [2] are accounted for in convertion  algorithms,  such  as  prefer
# lower Unicode codepoints when Unicode is redundant, and prefer characters with diacritics over
# sequences of plain characters plus combining  diacritics  (so  that  converting  from  and  to
# Unicode actually normalizes characters).
#
# # !j 95 -i3 -H-2
#
# REFERENCES:
#
#   [1] Pantelia, M. (Ed.), The TLG® Beta Code Manual, Thesaurus Linguae Graecae, 2016.
#       http://www.tlg.uci.edu/encoding/BCM.pdf.
#
#   [2] Yannis Haralambous. Guidelines and Suggested Amendments to the Greek Unicode Tables.
#       21st International Unicode Conference, Unicode Consortium, May 2002, Dublin, Ireland.
#       Paper hal-02112005. https://hal.archives-ouvertes.fr/hal-02112005.
# 

#----------------------------------------------------------------------------------------------#
#                                      Auxiliar Functions                                      #
#----------------------------------------------------------------------------------------------#

"""
`sp(t::AbstractString)`\n
An auxiliar "string permutation" function
"""
function sp(t::AbstractString)
    return String[ join(i) for i in permutations([t...]) ]
end


#----------------------------------------------------------------------------------------------#
#                                       Greek Beta Codes                                       #
#----------------------------------------------------------------------------------------------#

# fwdB - the forwards Beta Code (to unicode) dictionary
fwdB = Dict{String, Vector{String}}(

    # SubSection 1.1 - Greek, lowercase [1]
    "A"     =>  String[                                        "\u03b1", ], #   α
    "B"     =>  String[                                        "\u03b2", ], #   β
    "C"     =>  String[                                        "\u03be", ], #   ξ
    "D"     =>  String[                                        "\u03b4", ], #   δ
    "E"     =>  String[                                        "\u03b5", ], #   ε
    "F"     =>  String[                                        "\u03c6", ], #   φ
    "G"     =>  String[                                        "\u03b3", ], #   γ
    "H"     =>  String[                                        "\u03b7", ], #   η
    "I"     =>  String[                                        "\u03b9", ], #   ι
    "K"     =>  String[                                        "\u03ba", ], #   κ
    "L"     =>  String[                                        "\u03bb", ], #   λ
    "M"     =>  String[                                        "\u03bc", ], #   μ
    "N"     =>  String[                                        "\u03bd", ], #   ν
    "O"     =>  String[                                        "\u03bf", ], #   ο
    "P"     =>  String[                                        "\u03c0", ], #   π
    "Q"     =>  String[                                        "\u03b8", ], #   θ
    "R"     =>  String[                                        "\u03c1", ], #   ρ
    "S"     =>  String[                              "\u03c2", "\u03c3", ], #   ς, σ: final/mid
    "S1"    =>  String[                                        "\u03c3", ], #   σ
    "S2"    =>  String[                                        "\u03c2", ], #   ς
    "S3"    =>  String[                                        "\u03f2", ], #   ϲ
    "T"     =>  String[                                        "\u03c4", ], #   τ
    "U"     =>  String[                                        "\u03c5", ], #   υ
    "V"     =>  String[                                        "\u03dd", ], #   ϝ
    "W"     =>  String[                                        "\u03c9", ], #   ω
    "X"     =>  String[                                        "\u03c7", ], #   χ
    "Y"     =>  String[                                        "\u03c8", ], #   ψ
    "Z"     =>  String[                                        "\u03b6", ], #   ζ

    # SubSection 1.1 - Greek, uppercase [1]
    "*A"    =>  String[                                        "\u0391", ], #   Α
    "*B"    =>  String[                                        "\u0392", ], #   Β
    "*C"    =>  String[                                        "\u039e", ], #   Ξ
    "*D"    =>  String[                                        "\u0394", ], #   Δ
    "*E"    =>  String[                                        "\u0395", ], #   Ε
    "*F"    =>  String[                                        "\u03a6", ], #   Φ
    "*G"    =>  String[                                        "\u0393", ], #   Γ
    "*H"    =>  String[                                        "\u0397", ], #   Η
    "*I"    =>  String[                                        "\u0399", ], #   Ι
    "*K"    =>  String[                                        "\u039a", ], #   Κ
    "*L"    =>  String[                                        "\u039b", ], #   Λ
    "*M"    =>  String[                                        "\u039c", ], #   Μ
    "*N"    =>  String[                                        "\u039d", ], #   Ν
    "*O"    =>  String[                                        "\u039f", ], #   Ο
    "*P"    =>  String[                                        "\u03a0", ], #   Π
    "*Q"    =>  String[                                        "\u0398", ], #   Θ
    "*R"    =>  String[                                        "\u03a1", ], #   Ρ
    "*S"    =>  String[                                        "\u03a3", ], #   Σ
    "*S3"   =>  String[                                        "\u03f9", ], #   Ϲ
    "*T"    =>  String[                                        "\u03a4", ], #   Τ
    "*U"    =>  String[                                        "\u03a5", ], #   Υ
    "*V"    =>  String[                                        "\u03dc", ], #   Ϝ
    "*W"    =>  String[                                        "\u03a9", ], #   Ω
    "*X"    =>  String[                                        "\u03a7", ], #   Χ
    "*Y"    =>  String[                                        "\u03a8", ], #   Ψ
    "*Z"    =>  String[                                        "\u0396", ], #   Ζ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")"     =>  String[                             "\u02bc",  "\u0313", ], #   ʼ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    # Update: combining is added as to avoid conversion errors such as: 
    #   B("ἀ") = B("α\u313") --> "A̓" ## Instead of "A)".
    "A)"    =>  String[                       "\u1f00", sp("α\u0313")... ], #   ἀ
    "E)"    =>  String[                       "\u1f10", sp("ϵ\u0313")... ], #   ἐ
    "H)"    =>  String[                       "\u1f20", sp("η\u0313")... ], #   ἠ
    "I)"    =>  String[                       "\u1f30", sp("ι\u0313")... ], #   ἰ
    "O)"    =>  String[                       "\u1f40", sp("ο\u0313")... ], #   ὀ
    "U)"    =>  String[                       "\u1f50", sp("υ\u0313")... ], #   ὐ
    "W)"    =>  String[                       "\u1f60", sp("ω\u0313")... ], #   ὠ
    "R)"    =>  String[                       "\u1fe4", sp("ρ\u0313")... ], #   ῤ
    "*)A"   =>  String[                       "\u1f08", sp("Α\u0313")... ], #   Ἀ
    "*)E"   =>  String[                       "\u1f18", sp("Ε\u0313")... ], #   Ἐ
    "*)H"   =>  String[                       "\u1f28", sp("Η\u0313")... ], #   Ἠ
    "*)I"   =>  String[                       "\u1f38", sp("Ι\u0313")... ], #   Ἰ
    "*)O"   =>  String[                       "\u1f48", sp("Ο\u0313")... ], #   Ὀ
    "*)W"   =>  String[                       "\u1f68", sp("Ω\u0313")... ], #   Ὠ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "("     =>  String[                             "\u02bd",  "\u0314", ], #   ʽ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A("    =>  String[                       "\u1f01", sp("α\u0314")... ], #   ἁ
    "E("    =>  String[                       "\u1f11", sp("ϵ\u0314")... ], #   ἑ
    "H("    =>  String[                       "\u1f21", sp("η\u0314")... ], #   ἡ
    "I("    =>  String[                       "\u1f31", sp("ι\u0314")... ], #   ἱ
    "O("    =>  String[                       "\u1f41", sp("ο\u0314")... ], #   ὁ
    "U("    =>  String[                       "\u1f51", sp("υ\u0314")... ], #   ὑ
    "W("    =>  String[                       "\u1f61", sp("ω\u0314")... ], #   ὡ
    "R("    =>  String[                       "\u1fe5", sp("ρ\u0314")... ], #   ῥ
    "*(A"   =>  String[                       "\u1f09", sp("Α\u0314")... ], #   Ἁ
    "*(E"   =>  String[                       "\u1f19", sp("Ε\u0314")... ], #   Ἑ
    "*(H"   =>  String[                       "\u1f29", sp("Η\u0314")... ], #   Ἡ
    "*(I"   =>  String[                       "\u1f39", sp("Ι\u0314")... ], #   Ἱ
    "*(O"   =>  String[                       "\u1f49", sp("Ο\u0314")... ], #   Ὁ
    "*(U"   =>  String[                       "\u1f59", sp("Υ\u0314")... ], #   Ὑ
    "*(W"   =>  String[                       "\u1f69", sp("Ω\u0314")... ], #   Ὡ
    "*(R"   =>  String[                       "\u1fec", sp("Ρ\u0314")... ], #   Ῥ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "/"     =>  String[                             "\u00b4",  "\u0301", ], #   ´
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A/"    =>  String[             "\u03ac", "\u1f71", sp("α\u0301")... ], #   ά, ά
    "E/"    =>  String[             "\u03ad", "\u1f73", sp("ϵ\u0301")... ], #   έ, έ
    "H/"    =>  String[             "\u03ae", "\u1f75", sp("η\u0301")... ], #   ή, ή
    "I/"    =>  String[             "\u03af", "\u1f77", sp("ι\u0301")... ], #   ί, ί
    "O/"    =>  String[             "\u03cc", "\u1f79", sp("ο\u0301")... ], #   ό, ό
    "U/"    =>  String[             "\u03cd", "\u1f7b", sp("υ\u0301")... ], #   ύ, ύ
    "W/"    =>  String[             "\u03ce", "\u1f7d", sp("ω\u0301")... ], #   ώ, ώ
    "*/A"   =>  String[                       "\u1fbb", sp("Α\u0301")... ], #   Ά
    "*/E"   =>  String[                       "\u1fc9", sp("Ε\u0301")... ], #   Έ
    "*/H"   =>  String[                       "\u1fcb", sp("Η\u0301")... ], #   Ή
    "*/I"   =>  String[                       "\u1fdb", sp("Ι\u0301")... ], #   Ί
    "*/O"   =>  String[                       "\u1ff9", sp("Ο\u0301")... ], #   Ό
    "*/U"   =>  String[                       "\u1feb", sp("Υ\u0301")... ], #   Ύ
    "*/W"   =>  String[                       "\u1ffb", sp("Ω\u0301")... ], #   Ώ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")/"    =>  String[                       "\u1fce",  "\u0313\u0301", ], #   ῎
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)/"   =>  String[                 "\u1f04", sp("α\u0313\u0301")... ], #   ἄ
    "E)/"   =>  String[                 "\u1f14", sp("ϵ\u0313\u0301")... ], #   ἔ
    "H)/"   =>  String[                 "\u1f24", sp("η\u0313\u0301")... ], #   ἤ
    "I)/"   =>  String[                 "\u1f34", sp("ι\u0313\u0301")... ], #   ἴ
    "O)/"   =>  String[                 "\u1f44", sp("ο\u0313\u0301")... ], #   ὄ
    "U)/"   =>  String[                 "\u1f54", sp("υ\u0313\u0301")... ], #   ὔ
    "W)/"   =>  String[                 "\u1f64", sp("ω\u0313\u0301")... ], #   ὤ
    "*)/A"  =>  String[                 "\u1f0c", sp("Α\u0313\u0301")... ], #   Ἄ
    "*)/E"  =>  String[                 "\u1f1c", sp("Ε\u0313\u0301")... ], #   Ἔ
    "*)/H"  =>  String[                 "\u1f2c", sp("Η\u0313\u0301")... ], #   Ἤ
    "*)/I"  =>  String[                 "\u1f3c", sp("Ι\u0313\u0301")... ], #   Ἴ
    "*)/O"  =>  String[                 "\u1f4c", sp("Ο\u0313\u0301")... ], #   Ὄ
    "*)/W"  =>  String[                 "\u1f6c", sp("Ω\u0313\u0301")... ], #   Ὤ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "="     =>  String[                             "\u1fc0",  "\u0342", ], #   ῀
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A="    =>  String[                 "\u1fb6",       sp("α\u0342")... ], #   ᾶ
    "H="    =>  String[                 "\u1fc6",       sp("η\u0342")... ], #   ῆ
    "I="    =>  String[                 "\u1fd6",       sp("ι\u0342")... ], #   ῖ
    "U="    =>  String[                 "\u1fe6",       sp("υ\u0342")... ], #   ῦ
    "W="    =>  String[                 "\u1ff6",       sp("ω\u0342")... ], #   ῶ
    "A)="   =>  String[                 "\u1f06", sp("α\u0313\u0342")... ], #   ἆ
    "H)="   =>  String[                 "\u1f26", sp("η\u0313\u0342")... ], #   ἦ
    "I)="   =>  String[                 "\u1f36", sp("ι\u0313\u0342")... ], #   ἶ
    "U)="   =>  String[                 "\u1f56", sp("υ\u0313\u0342")... ], #   ὖ
    "W)="   =>  String[                 "\u1f66", sp("ω\u0313\u0342")... ], #   ὦ
    "*)=A"  =>  String[                 "\u1f0e", sp("Α\u0313\u0342")... ], #   Ἆ
    "*)=H"  =>  String[                 "\u1f2e", sp("Η\u0313\u0342")... ], #   Ἦ
    "*)=I"  =>  String[                 "\u1f3e", sp("Ι\u0313\u0342")... ], #   Ἶ
    "*)=W"  =>  String[                 "\u1f6e", sp("Ω\u0313\u0342")... ], #   Ὦ
    "A(="   =>  String[                 "\u1f07", sp("α\u0314\u0342")... ], #   ἇ
    "H(="   =>  String[                 "\u1f27", sp("η\u0314\u0342")... ], #   ἧ
    "I(="   =>  String[                 "\u1f37", sp("ι\u0314\u0342")... ], #   ἷ
    "U(="   =>  String[                 "\u1f57", sp("υ\u0314\u0342")... ], #   ὗ
    "W(="   =>  String[                 "\u1f67", sp("ω\u0314\u0342")... ], #   ὧ
    "*(=A"  =>  String[                 "\u1f0f", sp("Α\u0314\u0342")... ], #   Ἇ
    "*(=H"  =>  String[                 "\u1f2f", sp("Η\u0314\u0342")... ], #   Ἧ
    "*(=I"  =>  String[                 "\u1f3f", sp("Ι\u0314\u0342")... ], #   Ἷ
    "*(=U"  =>  String[                 "\u1f5f", sp("Υ\u0314\u0342")... ], #   Ὗ
    "*(=W"  =>  String[                 "\u1f6f", sp("Ω\u0314\u0342")... ], #   Ὧ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "\\"    =>  String[                             "\u0060",  "\u0300", ], #   `
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A\\"   =>  String[                 "\u1f70",       sp("α\u0300")... ], #   ὰ
    "E\\"   =>  String[                 "\u1f72",       sp("ϵ\u0300")... ], #   ὲ
    "H\\"   =>  String[                 "\u1f74",       sp("η\u0300")... ], #   ὴ
    "I\\"   =>  String[                 "\u1f76",       sp("ι\u0300")... ], #   ὶ
    "O\\"   =>  String[                 "\u1f78",       sp("ο\u0300")... ], #   ὸ
    "U\\"   =>  String[                 "\u1f7a",       sp("υ\u0300")... ], #   ὺ
    "W\\"   =>  String[                 "\u1f7c",       sp("ω\u0300")... ], #   ὼ
    "*\\A"  =>  String[                 "\u1fba",       sp("Α\u0300")... ], #   Ὰ
    "*\\E"  =>  String[                 "\u1fc8",       sp("Ε\u0300")... ], #   Ὲ
    "*\\H"  =>  String[                 "\u1fca",       sp("Η\u0300")... ], #   Ὴ
    "*\\I"  =>  String[                 "\u1fda",       sp("Ι\u0300")... ], #   Ὶ
    "*\\O"  =>  String[                 "\u1ff8",       sp("Ο\u0300")... ], #   Ὸ
    "*\\U"  =>  String[                 "\u1fea",       sp("Υ\u0300")... ], #   Ὺ
    "*\\W"  =>  String[                 "\u1ffa",       sp("Ω\u0300")... ], #   Ὼ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")\\"   =>  String[                 "\u1fcd",  sp("\u0313\u0300")... ], #   ῍
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)\\"  =>  String[                 "\u1f02", sp("α\u0313\u0300")... ], #   ἂ
    "E)\\"  =>  String[                 "\u1f12", sp("ϵ\u0313\u0300")... ], #   ἒ
    "H)\\"  =>  String[                 "\u1f22", sp("η\u0313\u0300")... ], #   ἢ
    "I)\\"  =>  String[                 "\u1f32", sp("ι\u0313\u0300")... ], #   ἲ
    "O)\\"  =>  String[                 "\u1f42", sp("ο\u0313\u0300")... ], #   ὂ
    "U)\\"  =>  String[                 "\u1f52", sp("υ\u0313\u0300")... ], #   ὒ
    "W)\\"  =>  String[                 "\u1f62", sp("ω\u0313\u0300")... ], #   ὢ
    "*)\\A" =>  String[                 "\u1f0a", sp("Α\u0313\u0300")... ], #   Ἂ
    "*)\\E" =>  String[                 "\u1f1a", sp("Ε\u0313\u0300")... ], #   Ἒ
    "*)\\H" =>  String[                 "\u1f2a", sp("Η\u0313\u0300")... ], #   Ἢ
    "*)\\I" =>  String[                 "\u1f3a", sp("Ι\u0313\u0300")... ], #   Ἲ
    "*)\\O" =>  String[                 "\u1f4a", sp("Ο\u0313\u0300")... ], #   Ὂ
    "*)\\W" =>  String[                 "\u1f6a", sp("Ω\u0313\u0300")... ], #   Ὢ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "(/"    =>  String[                 "\u1fde",  sp("\u0314\u0301")... ], #   ῞
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A(/"   =>  String[                 "\u1f05", sp("α\u0314\u0301")... ], #   ἅ
    "E(/"   =>  String[                 "\u1f15", sp("ϵ\u0314\u0301")... ], #   ἕ
    "H(/"   =>  String[                 "\u1f25", sp("η\u0314\u0301")... ], #   ἥ
    "I(/"   =>  String[                 "\u1f35", sp("ι\u0314\u0301")... ], #   ἵ
    "O(/"   =>  String[                 "\u1f45", sp("ο\u0314\u0301")... ], #   ὅ
    "U(/"   =>  String[                 "\u1f55", sp("υ\u0314\u0301")... ], #   ὕ
    "W(/"   =>  String[                 "\u1f65", sp("ω\u0314\u0301")... ], #   ὥ
    "*(/A"  =>  String[                 "\u1f0d", sp("Α\u0314\u0301")... ], #   Ἅ
    "*(/E"  =>  String[                 "\u1f1d", sp("Ε\u0314\u0301")... ], #   Ἕ
    "*(/H"  =>  String[                 "\u1f2d", sp("Η\u0314\u0301")... ], #   Ἥ
    "*(/I"  =>  String[                 "\u1f3d", sp("Ι\u0314\u0301")... ], #   Ἵ
    "*(/O"  =>  String[                 "\u1f4d", sp("Ο\u0314\u0301")... ], #   Ὅ
    "*(/U"  =>  String[                 "\u1f5d", sp("Υ\u0314\u0301")... ], #   Ὕ
    "*(/W"  =>  String[                 "\u1f6d", sp("Ω\u0314\u0301")... ], #   Ὥ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "(\\"   =>  String[                 "\u1fdd",  sp("\u0314\u0300")... ], #   ῝
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A(\\"  =>  String[                 "\u1f03", sp("α\u0314\u0300")... ], #   ἃ
    "E(\\"  =>  String[                 "\u1f13", sp("ϵ\u0314\u0300")... ], #   ἓ
    "H(\\"  =>  String[                 "\u1f23", sp("η\u0314\u0300")... ], #   ἣ
    "I(\\"  =>  String[                 "\u1f33", sp("ι\u0314\u0300")... ], #   ἳ
    "O(\\"  =>  String[                 "\u1f43", sp("ο\u0314\u0300")... ], #   ὃ
    "U(\\"  =>  String[                 "\u1f53", sp("υ\u0314\u0300")... ], #   ὓ
    "W(\\"  =>  String[                 "\u1f63", sp("ω\u0314\u0300")... ], #   ὣ
    "*(\\A" =>  String[                 "\u1f0b", sp("Α\u0314\u0300")... ], #   Ἃ
    "*(\\E" =>  String[                 "\u1f1b", sp("Ε\u0314\u0300")... ], #   Ἓ
    "*(\\H" =>  String[                 "\u1f2b", sp("Η\u0314\u0300")... ], #   Ἣ
    "*(\\I" =>  String[                 "\u1f3b", sp("Ι\u0314\u0300")... ], #   Ἳ
    "*(\\O" =>  String[                 "\u1f4b", sp("Ο\u0314\u0300")... ], #   Ὃ
    "*(\\U" =>  String[                 "\u1f5b", sp("Υ\u0314\u0300")... ], #   Ὓ
    "*(\\W" =>  String[                 "\u1f6b", sp("Ω\u0314\u0300")... ], #   Ὣ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "+"     =>  String[                 "\u00a8",        sp("\u0308")... ], #   ¨
    "/+"    =>  String[                 "\u0385",  sp("\u0308\u0301")... ], #   ΅
    "+/"    =>  String[                 "\u1fee",  sp("\u0308\u0301")... ], #   ΅
    "\\+"   =>  String[                 "\u1fed",  sp("\u0308\u0300")... ], #   ῭
    "+\\"   =>  String[                 "\u1fed",  sp("\u0308\u0300")... ], #   ῭
    "+="    =>  String[                 "\u1fc1",  sp("\u0308\u0342")... ], #   ῁
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "I+"    =>  String[                 "\u03ca",       sp("ι\u0308")... ], #   ϊ
    "*+I"   =>  String[                 "\u03aa",       sp("Ι\u0308")... ], #   Ϊ
    "I/+"   =>  String[       "\u0390", "\u1fd3", sp("ι\u0308\u0301")... ], #   ΐ, ΐ
    "I+/"   =>  String[       "\u0390", "\u1fd3", sp("ι\u0308\u0301")... ], #   ΐ, ΐ
    "I\\+"  =>  String[                 "\u1fd2", sp("ι\u0308\u0300")... ], #   ῒ
    "I+\\"  =>  String[                 "\u1fd2", sp("ι\u0308\u0300")... ], #   ῒ
    "I=+"   =>  String[                 "\u1fd7", sp("ι\u0308\u0342")... ], #   ῗ
    "I+="   =>  String[                 "\u1fd7", sp("ι\u0308\u0342")... ], #   ῗ
    "U+"    =>  String[                 "\u03cb",       sp("υ\u0308")... ], #   ϋ
    "*+U"   =>  String[                 "\u03ab",       sp("Υ\u0308")... ], #   Ϋ
    "U/+"   =>  String[       "\u03b0", "\u1fe3", sp("υ\u0308\u0301")... ], #   ΰ, ΰ
    "U+/"   =>  String[       "\u03b0", "\u1fe3", sp("υ\u0308\u0301")... ], #   ΰ, ΰ
    "U\\+"  =>  String[                 "\u1fe2", sp("υ\u0308\u0300")... ], #   ῢ
    "U+\\"  =>  String[                 "\u1fe2", sp("υ\u0308\u0300")... ], #   ῢ
    "U=+"   =>  String[                 "\u1fe7", sp("υ\u0308\u0342")... ], #   ῧ
    "U+="   =>  String[                 "\u1fe7", sp("υ\u0308\u0342")... ], #   ῧ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "|"     =>  String[                 "\u037a",        sp("\u0345")... ], #   ͺ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    # --- U+1f8# range
    "A)|"   =>  String[           "\u1f80",       sp("α\u0313\u0345")... ], #   ᾀ
    "A(|"   =>  String[           "\u1f81",       sp("α\u0314\u0345")... ], #   ᾁ
    "A)\\|" =>  String[           "\u1f82", sp("α\u0313\u0300\u0345")... ], #   ᾂ
    "A(\\|" =>  String[           "\u1f83", sp("α\u0314\u0300\u0345")... ], #   ᾃ
    "A)/|"  =>  String[           "\u1f84", sp("α\u0313\u0301\u0345")... ], #   ᾄ
    "A(/|"  =>  String[           "\u1f85", sp("α\u0314\u0301\u0345")... ], #   ᾅ
    "A)=|"  =>  String[           "\u1f86", sp("α\u0313\u0308\u0345")... ], #   ᾆ
    "A(=|"  =>  String[           "\u1f87", sp("α\u0314\u0308\u0345")... ], #   ᾇ
    "*)A|"  =>  String[           "\u1f88",       sp("Α\u0313\u0345")... ], #   ᾈ
    "*(A|"  =>  String[           "\u1f89",       sp("Α\u0314\u0345")... ], #   ᾉ
    "*)\\A|"=>  String[           "\u1f8a", sp("Α\u0313\u0300\u0345")... ], #   ᾊ
    "*(\\A|"=>  String[           "\u1f8b", sp("Α\u0314\u0300\u0345")... ], #   ᾋ
    "*)/A|" =>  String[           "\u1f8c", sp("Α\u0313\u0301\u0345")... ], #   ᾌ
    "*(/A|" =>  String[           "\u1f8d", sp("Α\u0314\u0301\u0345")... ], #   ᾍ
    "*)=A|" =>  String[           "\u1f8e", sp("Α\u0313\u0308\u0345")... ], #   ᾎ
    "*(=A|" =>  String[           "\u1f8f", sp("Α\u0314\u0308\u0345")... ], #   ᾏ
    # --- U+1f9# range
    "H)|"   =>  String[           "\u1f90",       sp("η\u0313\u0345")... ], #   ᾐ
    "H(|"   =>  String[           "\u1f91",       sp("η\u0314\u0345")... ], #   ᾑ
    "H)\\|" =>  String[           "\u1f92", sp("η\u0313\u0300\u0345")... ], #   ᾒ
    "H(\\|" =>  String[           "\u1f93", sp("η\u0314\u0300\u0345")... ], #   ᾓ
    "H)/|"  =>  String[           "\u1f94", sp("η\u0313\u0301\u0345")... ], #   ᾔ
    "H(/|"  =>  String[           "\u1f95", sp("η\u0314\u0301\u0345")... ], #   ᾕ
    "H)=|"  =>  String[           "\u1f96", sp("η\u0313\u0308\u0345")... ], #   ᾖ
    "H(=|"  =>  String[           "\u1f97", sp("η\u0314\u0308\u0345")... ], #   ᾗ
    "*)H|"  =>  String[           "\u1f98",       sp("Η\u0313\u0345")... ], #   ᾘ
    "*(H|"  =>  String[           "\u1f99",       sp("Η\u0314\u0345")... ], #   ᾙ
    "*)\\H|"=>  String[           "\u1f9a", sp("Η\u0313\u0300\u0345")... ], #   ᾚ
    "*(\\H|"=>  String[           "\u1f9b", sp("Η\u0314\u0300\u0345")... ], #   ᾛ
    "*)/H|" =>  String[           "\u1f9c", sp("Η\u0313\u0301\u0345")... ], #   ᾜ
    "*(/H|" =>  String[           "\u1f9d", sp("Η\u0314\u0301\u0345")... ], #   ᾝ
    "*)=H|" =>  String[           "\u1f9e", sp("Η\u0313\u0308\u0345")... ], #   ᾞ
    "*(=H|" =>  String[           "\u1f9f", sp("Η\u0314\u0308\u0345")... ], #   ᾟ
    # --- U+1fa# range
    "W)|"   =>  String[           "\u1fa0",       sp("ω\u0313\u0345")... ], #   ᾠ
    "W(|"   =>  String[           "\u1fa1",       sp("ω\u0314\u0345")... ], #   ᾡ
    "W)\\|" =>  String[           "\u1fa2", sp("ω\u0313\u0300\u0345")... ], #   ᾢ
    "W(\\|" =>  String[           "\u1fa3", sp("ω\u0314\u0300\u0345")... ], #   ᾣ
    "W)/|"  =>  String[           "\u1fa4", sp("ω\u0313\u0301\u0345")... ], #   ᾤ
    "W(/|"  =>  String[           "\u1fa5", sp("ω\u0314\u0301\u0345")... ], #   ᾥ
    "W)=|"  =>  String[           "\u1fa6", sp("ω\u0313\u0308\u0345")... ], #   ᾦ
    "W(=|"  =>  String[           "\u1fa7", sp("ω\u0314\u0308\u0345")... ], #   ᾧ
    "*)W|"  =>  String[           "\u1fa8",       sp("Ω\u0313\u0345")... ], #   ᾨ
    "*(W|"  =>  String[           "\u1fa9",       sp("Ω\u0314\u0345")... ], #   ᾩ
    "*)\\W|"=>  String[           "\u1faa", sp("Ω\u0313\u0300\u0345")... ], #   ᾪ
    "*(\\W|"=>  String[           "\u1fab", sp("Ω\u0314\u0300\u0345")... ], #   ᾫ
    "*)/W|" =>  String[           "\u1fac", sp("Ω\u0313\u0301\u0345")... ], #   ᾬ
    "*(/W|" =>  String[           "\u1fad", sp("Ω\u0314\u0301\u0345")... ], #   ᾭ
    "*)=W|" =>  String[           "\u1fae", sp("Ω\u0313\u0308\u0345")... ], #   ᾮ
    "*(=W|" =>  String[           "\u1faf", sp("Ω\u0314\u0308\u0345")... ], #   ᾯ

    # --- U+1fb{2,3,4,7,c}
    "A\\|"  =>  String[                 "\u1fb2", sp("α\u0300\u0345")... ], #   ᾲ
    "A|"    =>  String[                 "\u1fb3",       sp("α\u0345")... ], #   ᾳ
    "A/|"   =>  String[                 "\u1fb4", sp("α\u0301\u0345")... ], #   ᾴ
    "A=|"   =>  String[                 "\u1fb7", sp("α\u0308\u0345")... ], #   ᾷ
    "*A|"   =>  String[                 "\u1fbc",       sp("Α\u0345")... ], #   ᾼ

    # --- U+1fc{2,3,4,7,c}
    "H\\|"  =>  String[                 "\u1fc2", sp("η\u0300\u0345")... ], #   ῂ
    "H|"    =>  String[                 "\u1fc3",       sp("η\u0345")... ], #   ῃ
    "H/|"   =>  String[                 "\u1fc4", sp("η\u0301\u0345")... ], #   ῄ
    "H=|"   =>  String[                 "\u1fc7", sp("η\u0308\u0345")... ], #   ῇ
    "*H|"   =>  String[                 "\u1fcc",       sp("Η\u0345")... ], #   ῌ

    # --- U+1ff{2,3,4,7,c}
    "W\\|"  =>  String[                 "\u1ff2", sp("ω\u0300\u0345")... ], #   ῲ
    "W|"    =>  String[                 "\u1ff3",       sp("ω\u0345")... ], #   ῳ
    "W/|"   =>  String[                 "\u1ff4", sp("ω\u0301\u0345")... ], #   ῴ
    "W=|"   =>  String[                 "\u1ff7", sp("ω\u0308\u0345")... ], #   ῷ
    "*W|"   =>  String[                 "\u1ffc",       sp("Ω\u0345")... ], #   ῼ

    # Subsection 1.2 (cont'd) - Purely combining
    "?"     =>  String[                                        "\u0323", ], #   ̣- (comb.w/ '-')

    # SubSection 1.3 - Basic Punctuation [1]
    "."     =>  String[           "\u002e", ],  #   .
    ","     =>  String[           "\u002c", ],  #   ,
    ":"     =>  String[ "\u0387", "\u00b7", ],  #   ·, ·
    ";"     =>  String[ "\u037e", "\u003b", ],  #   ;, ;
    "`"     =>  String[           "\u2018", ],  #   ‘ ### NON-STANDARD BUT CONSISTENT ###
    "'"     =>  String[           "\u2019", ],  #   ’
    "-"     =>  String[           "\u2010", ],  #   ‐
    "_"     =>  String[           "\u2014", ],  #   —

    # SubSection 3.1 - Quotation Marks [1]
    "\""    =>  String[ "\u201c", "\u201d", ],  #   “, ” (stateful in Beta -> Unicode)
    "\"1"   =>  String[ "\u2e42", "\u201e", ],  #   ⹂, „ (stateful in Beta -> Unicode)
    "\"3"   =>  String[ "\u2018", "\u2019", ],  #   ‘, ’ (stateful in Beta -> Unicode)
    "\"4"   =>  String[ "\u2e32", "\u201a", ],  #   ⸲, ‚ (stateful in Beta -> Unicode)
    "\"6"   =>  String[ "\u00ab", "\u00bb", ],  #   «, » (stateful in Beta -> Unicode)
    "\"7"   =>  String[ "\u2039", "\u203a", ],  #   ‹, › (stateful in Beta -> Unicode)

    # SubSection 3.2 - Brackets [1] (Incomplete / only 1:1 strings)
    "["     =>  String[           "\u005b", ],  # [
    "]"     =>  String[           "\u005d", ],  # ]
    "[1"    =>  String[           "\u0028", ],  # (
    "]1"    =>  String[           "\u0029", ],  # )
    "[2"    =>  String[           "\u2329", ],  # 〈
    "]2"    =>  String[           "\u232a", ],  # 〉
    "[3"    =>  String[           "\u007b", ],  # {
    "]3"    =>  String[           "\u007d", ],  # }
    "[4"    =>  String[           "\u27e6", ],  # ⟦
    "]4"    =>  String[           "\u27e7", ],  # ⟧
    "[9"    =>  String[           "\u2991", ],  # ⦑
    "]9"    =>  String[           "\u2992", ],  # ⦒
    "[70"   =>  String[           "\u2e02", ],  # ⸂
    "]70"   =>  String[           "\u2e03", ],  # ⸃
    "[71"   =>  String[           "\u2e04", ],  # ⸄
    "]71"   =>  String[           "\u2e05", ],  # ⸅
    "[72"   =>  String[           "\u2e09", ],  # ⸉
    "]72"   =>  String[           "\u2e0a", ],  # ⸊
    "[82"   =>  String[           "\u2e20", ],  # ⸠
    "]82"   =>  String[           "\u2e21", ],  # ⸡
    "[84"   =>  String[           "\u2e26", ],  # ⸦
    "]84"   =>  String[           "\u2e27", ],  # ⸧
    "[85"   =>  String[           "\u2e28", ],  # ⸨
    "]85"   =>  String[           "\u2e29", ],  # ⸩

    # SubSection 3.3 - Additional Punctuation and Characters
    "%"     =>  String[           "\u2020", ],  # †
    "%1"    =>  String[           "\u003f", ],  # ?
    "%2"    =>  String[           "\u002a", ],  # *
    "%3"    =>  String[           "\u002f", ],  # /
    "%4"    =>  String[           "\u0021", ],  # !
    "%5"    =>  String[           "\u007c", ],  # |
    "%6"    =>  String[           "\u003d", ],  # =
    "%7"    =>  String[           "\u002b", ],  # +
    "%8"    =>  String[           "\u0025", ],  # %
    "%9"    =>  String[           "\u0026", ],  # &
    "%10"   =>  String[           "\u003a", ],  # :
    "%11"   =>  String[           "\u2022", ],  # •
    "%13"   =>  String[           "\u2021", ],  # ‡
    "%14"   =>  String[           "\u00a7", ],  # §
    "%15"   =>  String[           "\u02c8", ],  # ˈ
    "%16"   =>  String[           "\u00a6", ],  # ¦
    "%17"   =>  String[           "\u2016", ],  # ‖
    "%19"   =>  String[           "\u2013", ],  # –
    "%32"   =>  String[           "\u00b4", ],  # ´
    "%33"   =>  String[           "\u0060", ],  # `
    "%39"   =>  String[           "\u00a8", ],  # ¨
    "%43"   =>  String[           "\u00d7", ],  # ×
    "%98"   =>  String[           "\u0022", ],  # "
    "%99"   =>  String[           "\u2248", ],  # ≈
    "%101"  =>  String[           "\u0023", ],  # #
    "%103"  =>  String[           "\u005c", ],  # \
    "%104"  =>  String[           "\u005e", ],  # ^
    "%107"  =>  String[           "\u007e", ],  # ~
    "%108"  =>  String[           "\u00b1", ],  # ±
    "%161"  =>  String[           "\u00f7", ],  # ÷
    "%163"  =>  String[           "\u00b6", ],  # ¶

    # Subsection 3.4 - Additional Characters

    # SubSection 3.4a - Including Further Greek Letters &tc...
    "#"     =>  String[           "\u0374", ],  # ʹ (Keraia)
    "*#1"   =>  String[           "\u03de", ],  # Ϟ
    "#1"    =>  String[           "\u03df", ],  # ϟ
    "*#2"   =>  String[           "\u03da", ],  # Ϛ
    "#2"    =>  String[           "\u03db", ],  # ϛ
    "*#3"   =>  String[           "\u03d8", ],  # Ϙ
    "#3"    =>  String[           "\u03d9", ],  # ϙ
    "*#5"   =>  String[           "\u03e0", ],  # Ϡ
    "#5"    =>  String[           "\u03e1", ],  # ϡ
    "#6"    =>  String[           "\u2e0f", ],  # ⸏
    "#8"    =>  String[           "\u2e10", ],  # ⸐
    "#10"   =>  String[           "\u03fd", ],  # Ͻ
    "#11"   =>  String[           "\u03ff", ],  # Ͽ
    "#12"   =>  String[           "\u2014", ],  # — (em-dash)
    "#13"   =>  String[           "\u203b", ],  # ※
    "#14"   =>  String[           "\u2e16", ],  # ⸖
    "#15"   =>  String[           "\u003e", ],  # >
    "#16"   =>  String[           "\u03fe", ],  # Ͼ
    "#18"   =>  String[           "\u003c", ],  # <
    "#22"   =>  String[           "\u0375", ],  # ͵ (Keraia, lower)

    # SubSection 3.4c - Including New Testament Sigla &tc...
    "#717"  =>  String[           "\u2e00", ],  # ⸀
    "#718"  =>  String[           "\u2e01", ],  # ⸁
    "#719"  =>  String[           "\u2e06", ],  # ⸆
    "#720"  =>  String[           "\u2e07", ],  # ⸇
    "#722"  =>  String[           "\u2135", ],  # ℵ (Alepf Symbol)
    "#723"  =>  String[          "\U1d516", ],  # 𝔖 (Septuagint)
    "#724"  =>  String[           "\u210c", ],  # ℌ (Hebrew Old Testament)
    "#725"  =>  String[          "\U1d510", ],  # 𝔐 (Majority reading NT, MSS)

) # fwdB = ...

# Max Beta key length, for greedy matchings
maxB = max([length(i) for i in keys(fwdB)]...)

# revB - the reverse (unicode to) Beta Code dictionary
revB = Dict{String, Vector{String}}()
for (k, V) in fwdB
    for v in V
        push!(get!(() -> Vector{String}[], revB, v), k)
    end
end

# Max Unicode key length, for greedy matchings
maxU = max([length(i) for i in keys(revB)]...)

export maxB, maxU
export fwdB, revB

