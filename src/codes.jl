#
# This partially implements the Greek part of the TLG® Beta Code [1],  i.e.,  mostly  subsection
#   1.1 - Greek, pp.5--6, directly; indirectly the subsection 1.2 - Combining  Diacritics,  p.6,
#   under the ``Rule 6: Diacritics'' recomendations  of  [2]  with  the  usage  of  pre-accented
#   characters; subsection 1.3 - Basic Punctuation, [1]  pp.6--7;  subsection  3.1  -  Quotation
#   Marks, [1] p.20; and subsection 3.2 - Brackets, [1] pp.21--25.
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
#                                       Greek Beta Codes                                       #
#----------------------------------------------------------------------------------------------#

# fwdB - the forwards Beta Code (to unicode) dictionary
fwdB = Dict{String, Vector{String}}(

    # SubSection 1.1 - Greek, lowercase [1]
    "A"     =>  String[           "\u03b1", ],   #    α
    "B"     =>  String[           "\u03b2", ],   #    β
    "C"     =>  String[           "\u03be", ],   #    ξ
    "D"     =>  String[           "\u03b4", ],   #    δ
    "E"     =>  String[           "\u03b5", ],   #    ε
    "F"     =>  String[           "\u03c6", ],   #    φ
    "G"     =>  String[           "\u03b3", ],   #    γ
    "H"     =>  String[           "\u03b7", ],   #    η
    "I"     =>  String[           "\u03b9", ],   #    ι
    "K"     =>  String[           "\u03ba", ],   #    κ
    "L"     =>  String[           "\u03bb", ],   #    λ
    "M"     =>  String[           "\u03bc", ],   #    μ
    "N"     =>  String[           "\u03bd", ],   #    ν
    "O"     =>  String[           "\u03bf", ],   #    ο
    "P"     =>  String[           "\u03c0", ],   #    π
    "Q"     =>  String[           "\u03b8", ],   #    θ
    "R"     =>  String[           "\u03c1", ],   #    ρ
    "S"     =>  String[ "\u03c2", "\u03c3", ],   # ς, σ
    "S1"    =>  String[           "\u03c3", ],   #    σ
    "S2"    =>  String[           "\u03c2", ],   #    ς
    "S3"    =>  String[           "\u03f2", ],   #    ϲ
    "T"     =>  String[           "\u03c4", ],   #    τ
    "U"     =>  String[           "\u03c5", ],   #    υ
    "V"     =>  String[           "\u03dd", ],   #    ϝ
    "W"     =>  String[           "\u03c9", ],   #    ω
    "X"     =>  String[           "\u03c7", ],   #    χ
    "Y"     =>  String[           "\u03c8", ],   #    ψ
    "Z"     =>  String[           "\u03b6", ],   #    ζ

    # SubSection 1.1 - Greek, uppercase [1]
    "*A"    =>  String[ "\u0391", ],    # Α
    "*B"    =>  String[ "\u0392", ],    # Β
    "*C"    =>  String[ "\u039e", ],    # Ξ
    "*D"    =>  String[ "\u0394", ],    # Δ
    "*E"    =>  String[ "\u0395", ],    # Ε
    "*F"    =>  String[ "\u03a6", ],    # Φ
    "*G"    =>  String[ "\u0393", ],    # Γ
    "*H"    =>  String[ "\u0397", ],    # Η
    "*I"    =>  String[ "\u0399", ],    # Ι
    "*K"    =>  String[ "\u039a", ],    # Κ
    "*L"    =>  String[ "\u039b", ],    # Λ
    "*M"    =>  String[ "\u039c", ],    # Μ
    "*N"    =>  String[ "\u039d", ],    # Ν
    "*O"    =>  String[ "\u039f", ],    # Ο
    "*P"    =>  String[ "\u03a0", ],    # Π
    "*Q"    =>  String[ "\u0398", ],    # Θ
    "*R"    =>  String[ "\u03a1", ],    # Ρ
    "*S"    =>  String[ "\u03a3", ],    # Σ
    "*S3"   =>  String[ "\u03f9", ],    # Ϲ
    "*T"    =>  String[ "\u03a4", ],    # Τ
    "*U"    =>  String[ "\u03a5", ],    # Υ
    "*V"    =>  String[ "\u03dc", ],    # Ϝ
    "*W"    =>  String[ "\u03a9", ],    # Ω
    "*X"    =>  String[ "\u03a7", ],    # Χ
    "*Y"    =>  String[ "\u03a8", ],    # Ψ
    "*Z"    =>  String[ "\u0396", ],    # Ζ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")"     =>  String[       "\u02bc", ],    # ʼ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)"    =>  String[       "\u1f00", ],    # ἀ
    "E)"    =>  String[       "\u1f10", ],    # ἐ
    "H)"    =>  String[       "\u1f20", ],    # ἠ
    "I)"    =>  String[       "\u1f30", ],    # ἰ
    "O)"    =>  String[       "\u1f40", ],    # ὀ
    "U)"    =>  String[       "\u1f50", ],    # ὐ
    "W)"    =>  String[       "\u1f60", ],    # ὠ
    "R)"    =>  String[       "\u1fe4", ],    # ῤ
    "*)A"   =>  String[       "\u1f08", ],    # Ἀ
    "*)E"   =>  String[       "\u1f18", ],    # Ἐ
    "*)H"   =>  String[       "\u1f28", ],    # Ἠ
    "*)I"   =>  String[       "\u1f38", ],    # Ἰ
    "*)O"   =>  String[       "\u1f48", ],    # Ὀ
    "*)U"   =>  String[ "\u03a5\u0313", ],    # Υ̓
    "*)W"   =>  String[       "\u1f68", ],    # Ὠ
    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "("     =>  String[       "\u02bd", ],    # ʽ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A("    =>  String[       "\u1f01", ],    # ἁ
    "E("    =>  String[       "\u1f11", ],    # ἑ
    "H("    =>  String[       "\u1f21", ],    # ἡ
    "I("    =>  String[       "\u1f31", ],    # ἱ
    "O("    =>  String[       "\u1f41", ],    # ὁ
    "U("    =>  String[       "\u1f51", ],    # ὑ
    "W("    =>  String[       "\u1f61", ],    # ὡ
    "R("    =>  String[       "\u1fe5", ],    # ῥ
    "*(A"   =>  String[       "\u1f09", ],    # Ἁ
    "*(E"   =>  String[       "\u1f19", ],    # Ἑ
    "*(H"   =>  String[       "\u1f29", ],    # Ἡ
    "*(I"   =>  String[       "\u1f39", ],    # Ἱ
    "*(O"   =>  String[       "\u1f49", ],    # Ὁ
    "*(U"   =>  String[       "\u1f59", ],    # Ὑ
    "*(W"   =>  String[       "\u1f69", ],    # Ὡ
    "*(R"   =>  String[       "\u1fec", ],    # Ῥ
    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "/"     =>  String[       "\u00b4", ],    # ´
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A/"    =>  String[       "\u1f71", ],    # ά
    "E/"    =>  String[       "\u1f73", ],    # έ
    "H/"    =>  String[       "\u1f75", ],    # ή
    "I/"    =>  String[       "\u1f77", ],    # ί
    "O/"    =>  String[       "\u1f79", ],    # ό
    "U/"    =>  String[       "\u1f7b", ],    # ύ
    "W/"    =>  String[       "\u1f7d", ],    # ώ
    "*/A"   =>  String[       "\u1fbb", ],    # Ά
    "*/E"   =>  String[       "\u1fc9", ],    # Έ
    "*/H"   =>  String[       "\u1fcb", ],    # Ή
    "*/I"   =>  String[       "\u1fdb", ],    # Ί
    "*/O"   =>  String[       "\u1ff9", ],    # Ό
    "*/U"   =>  String[       "\u1feb", ],    # Ύ
    "*/W"   =>  String[       "\u1ffb", ],    # Ώ
    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")/"    =>  String[       "\u1fce", ],    # ῎
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)/"   =>  String[       "\u1f04", ],    # ἄ
    "E)/"   =>  String[       "\u1f14", ],    # ἔ
    "H)/"   =>  String[       "\u1f24", ],    # ἤ
    "I)/"   =>  String[       "\u1f34", ],    # ἴ
    "O)/"   =>  String[       "\u1f44", ],    # ὄ
    "U)/"   =>  String[       "\u1f54", ],    # ὔ
    "W)/"   =>  String[       "\u1f64", ],    # ὤ
    "*)/A"  =>  String[       "\u1f0c", ],    # Ἄ
    "*)/E"  =>  String[       "\u1f1c", ],    # Ἔ
    "*)/H"  =>  String[       "\u1f2c", ],    # Ἤ
    "*)/I"  =>  String[       "\u1f3c", ],    # Ἴ
    "*)/O"  =>  String[       "\u1f4c", ],    # Ὄ
    "*)/U"  =>  String[ "\u1feb\u0313", ],    # Ύ̓
    "*)/W"  =>  String[       "\u1f6c", ],    # Ὤ
    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "="     =>  String[       "\u1fc0", ],    # ῀
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A="    =>  String[       "\u1fb6", ],    # ᾶ
    "H="    =>  String[       "\u1fc6", ],    # ῆ
    "I="    =>  String[       "\u1fd6", ],    # ῖ
    "U="    =>  String[       "\u1fe6", ],    # ῦ
    "W="    =>  String[       "\u1ff6", ],    # ῶ
    "A)="   =>  String[       "\u1f06", ],    # ἆ
    "H)="   =>  String[       "\u1f26", ],    # ἦ
    "I)="   =>  String[       "\u1f36", ],    # ἶ
    "U)="   =>  String[       "\u1f56", ],    # ὖ
    "W)="   =>  String[       "\u1f66", ],    # ὦ
    "*)=A"  =>  String[       "\u1f0e", ],    # Ἆ
    "*)=H"  =>  String[       "\u1f2e", ],    # Ἦ
    "*)=I"  =>  String[       "\u1f3e", ],    # Ἶ
    "*)=W"  =>  String[       "\u1f6e", ],    # Ὦ
    "A(="   =>  String[       "\u1f07", ],    # ἇ
    "H(="   =>  String[       "\u1f27", ],    # ἧ
    "I(="   =>  String[       "\u1f37", ],    # ἷ
    "U(="   =>  String[       "\u1f57", ],    # ὗ
    "W(="   =>  String[       "\u1f67", ],    # ὧ
    "*(=A"  =>  String[       "\u1f0f", ],    # Ἇ
    "*(=H"  =>  String[       "\u1f2f", ],    # Ἧ
    "*(=I"  =>  String[       "\u1f3f", ],    # Ἷ
    "*(=U"  =>  String[       "\u1f5f", ],    # Ὗ
    "*(=W"  =>  String[       "\u1f6f", ],    # Ὧ
    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "\\"    =>  String[       "\u0060", ],    # `
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A\\"   =>  String[       "\u1f70", ],    # ὰ
    "E\\"   =>  String[       "\u1f72", ],    # ὲ
    "H\\"   =>  String[       "\u1f74", ],    # ὴ
    "I\\"   =>  String[       "\u1f76", ],    # ὶ
    "O\\"   =>  String[       "\u1f78", ],    # ὸ
    "U\\"   =>  String[       "\u1f7a", ],    # ὺ
    "W\\"   =>  String[       "\u1f7c", ],    # ὼ
    "*\\A"  =>  String[       "\u1fba", ],    # Ὰ
    "*\\E"  =>  String[       "\u1fc8", ],    # Ὲ
    "*\\H"  =>  String[       "\u1fca", ],    # Ὴ
    "*\\I"  =>  String[       "\u1fda", ],    # Ὶ
    "*\\O"  =>  String[       "\u1ff8", ],    # Ὸ
    "*\\U"  =>  String[       "\u1fea", ],    # Ὺ
    "*\\W"  =>  String[       "\u1ffa", ],    # Ὼ
)

# revB - the reverse (unicode to) Beta Code dictionary
revB = Dict{String, Vector{String}}()
for (k, V) in fwdB
    for v in V
        push!(get!(() -> Vector{String}[], revB, v), k)
    end
end

export fwdB, revB

