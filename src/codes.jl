#
# This is a greek language only --- hence, partial --- implementation of the TLG® Beta Code  [1]
# that aims to cover enough codepoints as to represent an entire Greek New Testament edition  in
# Beta Code and in corresponding Unicode, with the SBL Greek New Testament  in  mind,  including
# (i) the Greek Alphabet (subsection 1.1 of [1]); (ii) basic Greek punctuation  (subsection  1.1
# of [1]); (iii) combining Greek  Diacritics  (subsection  1.3  of  [1]);  as  well  as  partial
# (iv) quotation  marks  (subsection  3.1  of  [1]);  (v)  brackets  (subsection  3.2  of  [1]);
# (vi) additional punctuation  and  characters  (subsections  3.3  and  3.4  of  [1]).  Whenever
# applicable, rules from [2] are accounted for as to reduce or prevent redundancy.
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
    "*A"    =>  String[           "\u0391", ],   #    Α
    "*B"    =>  String[           "\u0392", ],   #    Β
    "*C"    =>  String[           "\u039e", ],   #    Ξ
    "*D"    =>  String[           "\u0394", ],   #    Δ
    "*E"    =>  String[           "\u0395", ],   #    Ε
    "*F"    =>  String[           "\u03a6", ],   #    Φ
    "*G"    =>  String[           "\u0393", ],   #    Γ
    "*H"    =>  String[           "\u0397", ],   #    Η
    "*I"    =>  String[           "\u0399", ],   #    Ι
    "*K"    =>  String[           "\u039a", ],   #    Κ
    "*L"    =>  String[           "\u039b", ],   #    Λ
    "*M"    =>  String[           "\u039c", ],   #    Μ
    "*N"    =>  String[           "\u039d", ],   #    Ν
    "*O"    =>  String[           "\u039f", ],   #    Ο
    "*P"    =>  String[           "\u03a0", ],   #    Π
    "*Q"    =>  String[           "\u0398", ],   #    Θ
    "*R"    =>  String[           "\u03a1", ],   #    Ρ
    "*S"    =>  String[           "\u03a3", ],   #    Σ
    "*S3"   =>  String[           "\u03f9", ],   #    Ϲ
    "*T"    =>  String[           "\u03a4", ],   #    Τ
    "*U"    =>  String[           "\u03a5", ],   #    Υ
    "*V"    =>  String[           "\u03dc", ],   #    Ϝ
    "*W"    =>  String[           "\u03a9", ],   #    Ω
    "*X"    =>  String[           "\u03a7", ],   #    Χ
    "*Y"    =>  String[           "\u03a8", ],   #    Ψ
    "*Z"    =>  String[           "\u0396", ],   #    Ζ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")"     =>  String[           "\u02bc", ],   #    ʼ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)"    =>  String[           "\u1f00", ],   #    ἀ
    "E)"    =>  String[           "\u1f10", ],   #    ἐ
    "H)"    =>  String[           "\u1f20", ],   #    ἠ
    "I)"    =>  String[           "\u1f30", ],   #    ἰ
    "O)"    =>  String[           "\u1f40", ],   #    ὀ
    "U)"    =>  String[           "\u1f50", ],   #    ὐ
    "W)"    =>  String[           "\u1f60", ],   #    ὠ
    "R)"    =>  String[           "\u1fe4", ],   #    ῤ
    "*)A"   =>  String[           "\u1f08", ],   #    Ἀ
    "*)E"   =>  String[           "\u1f18", ],   #    Ἐ
    "*)H"   =>  String[           "\u1f28", ],   #    Ἠ
    "*)I"   =>  String[           "\u1f38", ],   #    Ἰ
    "*)O"   =>  String[           "\u1f48", ],   #    Ὀ
    "*)W"   =>  String[           "\u1f68", ],   #    Ὠ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "("     =>  String[           "\u02bd", ],   #    ʽ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A("    =>  String[           "\u1f01", ],   #    ἁ
    "E("    =>  String[           "\u1f11", ],   #    ἑ
    "H("    =>  String[           "\u1f21", ],   #    ἡ
    "I("    =>  String[           "\u1f31", ],   #    ἱ
    "O("    =>  String[           "\u1f41", ],   #    ὁ
    "U("    =>  String[           "\u1f51", ],   #    ὑ
    "W("    =>  String[           "\u1f61", ],   #    ὡ
    "R("    =>  String[           "\u1fe5", ],   #    ῥ
    "*(A"   =>  String[           "\u1f09", ],   #    Ἁ
    "*(E"   =>  String[           "\u1f19", ],   #    Ἑ
    "*(H"   =>  String[           "\u1f29", ],   #    Ἡ
    "*(I"   =>  String[           "\u1f39", ],   #    Ἱ
    "*(O"   =>  String[           "\u1f49", ],   #    Ὁ
    "*(U"   =>  String[           "\u1f59", ],   #    Ὑ
    "*(W"   =>  String[           "\u1f69", ],   #    Ὡ
    "*(R"   =>  String[           "\u1fec", ],   #    Ῥ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "/"     =>  String[           "\u00b4", ],   #    ´
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A/"    =>  String[ "\u03ac", "\u1f71", ],   #    ά, ά
    "E/"    =>  String[ "\u03ad", "\u1f73", ],   #    έ, έ
    "H/"    =>  String[ "\u03ae", "\u1f75", ],   #    ή, ή
    "I/"    =>  String[ "\u03af", "\u1f77", ],   #    ί, ί
    "O/"    =>  String[ "\u03cc", "\u1f79", ],   #    ό, ό
    "U/"    =>  String[ "\u03cd", "\u1f7b", ],   #    ύ, ύ
    "W/"    =>  String[ "\u03ce", "\u1f7d", ],   #    ώ, ώ
    "*/A"   =>  String[           "\u1fbb", ],   #    Ά
    "*/E"   =>  String[           "\u1fc9", ],   #    Έ
    "*/H"   =>  String[           "\u1fcb", ],   #    Ή
    "*/I"   =>  String[           "\u1fdb", ],   #    Ί
    "*/O"   =>  String[           "\u1ff9", ],   #    Ό
    "*/U"   =>  String[           "\u1feb", ],   #    Ύ
    "*/W"   =>  String[           "\u1ffb", ],   #    Ώ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")/"    =>  String[           "\u1fce", ],   #    ῎
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)/"   =>  String[           "\u1f04", ],   #    ἄ
    "E)/"   =>  String[           "\u1f14", ],   #    ἔ
    "H)/"   =>  String[           "\u1f24", ],   #    ἤ
    "I)/"   =>  String[           "\u1f34", ],   #    ἴ
    "O)/"   =>  String[           "\u1f44", ],   #    ὄ
    "U)/"   =>  String[           "\u1f54", ],   #    ὔ
    "W)/"   =>  String[           "\u1f64", ],   #    ὤ
    "*)/A"  =>  String[           "\u1f0c", ],   #    Ἄ
    "*)/E"  =>  String[           "\u1f1c", ],   #    Ἔ
    "*)/H"  =>  String[           "\u1f2c", ],   #    Ἤ
    "*)/I"  =>  String[           "\u1f3c", ],   #    Ἴ
    "*)/O"  =>  String[           "\u1f4c", ],   #    Ὄ
    "*)/W"  =>  String[           "\u1f6c", ],   #    Ὤ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "="     =>  String[           "\u1fc0", ],   #    ῀
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A="    =>  String[           "\u1fb6", ],   #    ᾶ
    "H="    =>  String[           "\u1fc6", ],   #    ῆ
    "I="    =>  String[           "\u1fd6", ],   #    ῖ
    "U="    =>  String[           "\u1fe6", ],   #    ῦ
    "W="    =>  String[           "\u1ff6", ],   #    ῶ
    "A)="   =>  String[           "\u1f06", ],   #    ἆ
    "H)="   =>  String[           "\u1f26", ],   #    ἦ
    "I)="   =>  String[           "\u1f36", ],   #    ἶ
    "U)="   =>  String[           "\u1f56", ],   #    ὖ
    "W)="   =>  String[           "\u1f66", ],   #    ὦ
    "*)=A"  =>  String[           "\u1f0e", ],   #    Ἆ
    "*)=H"  =>  String[           "\u1f2e", ],   #    Ἦ
    "*)=I"  =>  String[           "\u1f3e", ],   #    Ἶ
    "*)=W"  =>  String[           "\u1f6e", ],   #    Ὦ
    "A(="   =>  String[           "\u1f07", ],   #    ἇ
    "H(="   =>  String[           "\u1f27", ],   #    ἧ
    "I(="   =>  String[           "\u1f37", ],   #    ἷ
    "U(="   =>  String[           "\u1f57", ],   #    ὗ
    "W(="   =>  String[           "\u1f67", ],   #    ὧ
    "*(=A"  =>  String[           "\u1f0f", ],   #    Ἇ
    "*(=H"  =>  String[           "\u1f2f", ],   #    Ἧ
    "*(=I"  =>  String[           "\u1f3f", ],   #    Ἷ
    "*(=U"  =>  String[           "\u1f5f", ],   #    Ὗ
    "*(=W"  =>  String[           "\u1f6f", ],   #    Ὧ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "\\"    =>  String[           "\u0060", ],   #    `
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A\\"   =>  String[           "\u1f70", ],   #    ὰ
    "E\\"   =>  String[           "\u1f72", ],   #    ὲ
    "H\\"   =>  String[           "\u1f74", ],   #    ὴ
    "I\\"   =>  String[           "\u1f76", ],   #    ὶ
    "O\\"   =>  String[           "\u1f78", ],   #    ὸ
    "U\\"   =>  String[           "\u1f7a", ],   #    ὺ
    "W\\"   =>  String[           "\u1f7c", ],   #    ὼ
    "*\\A"  =>  String[           "\u1fba", ],   #    Ὰ
    "*\\E"  =>  String[           "\u1fc8", ],   #    Ὲ
    "*\\H"  =>  String[           "\u1fca", ],   #    Ὴ
    "*\\I"  =>  String[           "\u1fda", ],   #    Ὶ
    "*\\O"  =>  String[           "\u1ff8", ],   #    Ὸ
    "*\\U"  =>  String[           "\u1fea", ],   #    Ὺ
    "*\\W"  =>  String[           "\u1ffa", ],   #    Ὼ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    ")\\"   =>  String[           "\u1fcd", ],   #    ῍
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A)\\"  =>  String[           "\u1f02", ],   #    ἂ
    "E)\\"  =>  String[           "\u1f12", ],   #    ἒ
    "H)\\"  =>  String[           "\u1f22", ],   #    ἢ
    "I)\\"  =>  String[           "\u1f32", ],   #    ἲ
    "O)\\"  =>  String[           "\u1f42", ],   #    ὂ
    "U)\\"  =>  String[           "\u1f52", ],   #    ὒ
    "W)\\"  =>  String[           "\u1f62", ],   #    ὢ
    "*)\\A" =>  String[           "\u1f0a", ],   #    Ἂ
    "*)\\E" =>  String[           "\u1f1a", ],   #    Ἒ
    "*)\\H" =>  String[           "\u1f2a", ],   #    Ἢ
    "*)\\I" =>  String[           "\u1f3a", ],   #    Ἲ
    "*)\\O" =>  String[           "\u1f4a", ],   #    Ὂ
    "*)\\W" =>  String[           "\u1f6a", ],   #    Ὢ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "(/"    =>  String[           "\u1fde", ],   #    ῞
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A(/"   =>  String[           "\u1f05", ],   #    ἅ
    "E(/"   =>  String[           "\u1f15", ],   #    ἕ
    "H(/"   =>  String[           "\u1f25", ],   #    ἥ
    "I(/"   =>  String[           "\u1f35", ],   #    ἵ
    "O(/"   =>  String[           "\u1f45", ],   #    ὅ
    "U(/"   =>  String[           "\u1f55", ],   #    ὕ
    "W(/"   =>  String[           "\u1f65", ],   #    ὥ
    "*(/A"  =>  String[           "\u1f0d", ],   #    Ἅ
    "*(/E"  =>  String[           "\u1f1d", ],   #    Ἕ
    "*(/H"  =>  String[           "\u1f2d", ],   #    Ἥ
    "*(/I"  =>  String[           "\u1f3d", ],   #    Ἵ
    "*(/O"  =>  String[           "\u1f4d", ],   #    Ὅ
    "*(/U"  =>  String[           "\u1f5d", ],   #    Ὕ
    "*(/W"  =>  String[           "\u1f6d", ],   #    Ὥ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "(\\"   =>  String[           "\u1fdd", ],   #    ῝
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "A(\\"  =>  String[           "\u1f03", ],   #    ἃ
    "E(\\"  =>  String[           "\u1f13", ],   #    ἓ
    "H(\\"  =>  String[           "\u1f23", ],   #    ἣ
    "I(\\"  =>  String[           "\u1f33", ],   #    ἳ
    "O(\\"  =>  String[           "\u1f43", ],   #    ὃ
    "U(\\"  =>  String[           "\u1f53", ],   #    ὓ
    "W(\\"  =>  String[           "\u1f63", ],   #    ὣ
    "*(\\A" =>  String[           "\u1f0b", ],   #    Ἃ
    "*(\\E" =>  String[           "\u1f1b", ],   #    Ἓ
    "*(\\H" =>  String[           "\u1f2b", ],   #    Ἣ
    "*(\\I" =>  String[           "\u1f3b", ],   #    Ἳ
    "*(\\O" =>  String[           "\u1f4b", ],   #    Ὃ
    "*(\\U" =>  String[           "\u1f5b", ],   #    Ὓ
    "*(\\W" =>  String[           "\u1f6b", ],   #    Ὣ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "+"     =>  String[           "\u00a8", ],   #    ¨
    "/+"    =>  String[           "\u0385", ],   #    ΅
    "+/"    =>  String[           "\u1fee", ],   #    ΅
    "\\+"   =>  String[           "\u1fed", ],   #    ῭
    "+\\"   =>  String[           "\u1fed", ],   #    ῭
    "+="    =>  String[           "\u1fc1", ],   #    ῁
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    "I+"    =>  String[           "\u03ca", ],   #    ϊ
    "*+I"   =>  String[           "\u03aa", ],   #    Ϊ
    "I/+"   =>  String[ "\u0390", "\u1fd3", ],   #    ΐ, ΐ
    "I+/"   =>  String[ "\u0390", "\u1fd3", ],   #    ΐ, ΐ
    "I\\+"  =>  String[           "\u1fd2", ],   #    ῒ
    "I+\\"  =>  String[           "\u1fd2", ],   #    ῒ
    "I=+"   =>  String[           "\u1fd7", ],   #    ῗ
    "I+="   =>  String[           "\u1fd7", ],   #    ῗ
    "U+"    =>  String[           "\u03cb", ],   #    ϋ
    "*+U"   =>  String[           "\u03ab", ],   #    Ϋ
    "U/+"   =>  String[ "\u03b0", "\u1fe3", ],   #    ΰ, ΰ
    "U+/"   =>  String[ "\u03b0", "\u1fe3", ],   #    ΰ, ΰ
    "U\\+"  =>  String[           "\u1fe2", ],   #    ῢ
    "U+\\"  =>  String[           "\u1fe2", ],   #    ῢ
    "U=+"   =>  String[           "\u1fe7", ],   #    ῧ
    "U+="   =>  String[           "\u1fe7", ],   #    ῧ

    # SubSection 1.2 - Combining Diacritics [1] (Modified)
    "|"     =>  String[           "\u037a", ],   #    ͺ
    # Suggestion 6: Pre-accented characters vs. combining diacritics [2]
    # --- U+1f8# range
    "A)|"   =>  String[           "\u1f80", ],   #    ᾀ
    "A(|"   =>  String[           "\u1f81", ],   #    ᾁ
    "A)\\|" =>  String[           "\u1f82", ],   #    ᾂ
    "A(\\|" =>  String[           "\u1f83", ],   #    ᾃ
    "A)/|"  =>  String[           "\u1f84", ],   #    ᾄ
    "A(/|"  =>  String[           "\u1f85", ],   #    ᾅ
    "A)=|"  =>  String[           "\u1f86", ],   #    ᾆ
    "A(=|"  =>  String[           "\u1f87", ],   #    ᾇ
    "*)A|"  =>  String[           "\u1f88", ],   #    ᾈ
    "*(A|"  =>  String[           "\u1f89", ],   #    ᾉ
    "*)\\A|"=>  String[           "\u1f8a", ],   #    ᾊ
    "*(\\A|"=>  String[           "\u1f8b", ],   #    ᾋ
    "*)/A|" =>  String[           "\u1f8c", ],   #    ᾌ
    "*(/A|" =>  String[           "\u1f8d", ],   #    ᾍ
    "*)=A|" =>  String[           "\u1f8e", ],   #    ᾎ
    "*(=A|" =>  String[           "\u1f8f", ],   #    ᾏ
    # --- U+1f9# range
    "H)|"   =>  String[           "\u1f90", ],   #    ᾐ
    "H(|"   =>  String[           "\u1f91", ],   #    ᾑ
    "H)\\|" =>  String[           "\u1f92", ],   #    ᾒ
    "H(\\|" =>  String[           "\u1f93", ],   #    ᾓ
    "H)/|"  =>  String[           "\u1f94", ],   #    ᾔ
    "H(/|"  =>  String[           "\u1f95", ],   #    ᾕ
    "H)=|"  =>  String[           "\u1f96", ],   #    ᾖ
    "H(=|"  =>  String[           "\u1f97", ],   #    ᾗ
    "*)H|"  =>  String[           "\u1f98", ],   #    ᾘ
    "*(H|"  =>  String[           "\u1f99", ],   #    ᾙ
    "*)\\H|"=>  String[           "\u1f9a", ],   #    ᾚ
    "*(\\H|"=>  String[           "\u1f9b", ],   #    ᾛ
    "*)/H|" =>  String[           "\u1f9c", ],   #    ᾜ
    "*(/H|" =>  String[           "\u1f9d", ],   #    ᾝ
    "*)=H|" =>  String[           "\u1f9e", ],   #    ᾞ
    "*(=H|" =>  String[           "\u1f9f", ],   #    ᾟ
    # --- U+1fa# range
    "W)|"   =>  String[           "\u1fa0", ],   #    ᾠ
    "W(|"   =>  String[           "\u1fa1", ],   #    ᾡ
    "W)\\|" =>  String[           "\u1fa2", ],   #    ᾢ
    "W(\\|" =>  String[           "\u1fa3", ],   #    ᾣ
    "W)/|"  =>  String[           "\u1fa4", ],   #    ᾤ
    "W(/|"  =>  String[           "\u1fa5", ],   #    ᾥ
    "W)=|"  =>  String[           "\u1fa6", ],   #    ᾦ
    "W(=|"  =>  String[           "\u1fa7", ],   #    ᾧ
    "*)W|"  =>  String[           "\u1fa8", ],   #    ᾨ
    "*(W|"  =>  String[           "\u1fa9", ],   #    ᾩ
    "*)\\W|"=>  String[           "\u1faa", ],   #    ᾪ
    "*(\\W|"=>  String[           "\u1fab", ],   #    ᾫ
    "*)/W|" =>  String[           "\u1fac", ],   #    ᾬ
    "*(/W|" =>  String[           "\u1fad", ],   #    ᾭ
    "*)=W|" =>  String[           "\u1fae", ],   #    ᾮ
    "*(=W|" =>  String[           "\u1faf", ],   #    ᾯ

    # --- U+1fb{2,3,4,7,c}
    "A\\|"  =>  String[           "\u1fb2", ],   #    ᾲ
    "A|"    =>  String[           "\u1fb3", ],   #    ᾳ
    "A/|"   =>  String[           "\u1fb4", ],   #    ᾴ
    "A=|"   =>  String[           "\u1fb7", ],   #    ᾷ
    "*A|"   =>  String[           "\u1fbc", ],   #    ᾼ

    # --- U+1fc{2,3,4,7,c}
    "H\\|"  =>  String[           "\u1fc2", ],   #    ῂ
    "H|"    =>  String[           "\u1fc3", ],   #    ῃ
    "H/|"   =>  String[           "\u1fc4", ],   #    ῄ
    "H=|"   =>  String[           "\u1fc7", ],   #    ῇ
    "*H|"   =>  String[           "\u1fcc", ],   #    ῌ

    # --- U+1ff{2,3,4,7,c}
    "W\\|"  =>  String[           "\u1ff2", ],   #    ῲ
    "W|"    =>  String[           "\u1ff3", ],   #    ῳ
    "W/|"   =>  String[           "\u1ff4", ],   #    ῴ
    "W=|"   =>  String[           "\u1ff7", ],   #    ῷ
    "*W|"   =>  String[           "\u1ffc", ],   #    ῼ

    # SubSection 1.3 - Basic Punctuation [1]
    "."     =>  String[           "\u002e", ],   #    .
    ","     =>  String[           "\u002c", ],   #    ,
    ":"     =>  String[           "\u0387", ],   #    ·
    ";"     =>  String[           "\u037e", ],   #    ;
    "'"     =>  String[           "\u2019", ],   #    ’
    "-"     =>  String[           "\u2010", ],   #    ‐
    "_"     =>  String[           "\u2014", ],   #    —

    # SubSection 3.1 - Quotation Marks [1]
    "\""    =>  String[ "\u201c", "\u201d", ],  # “, ” (stateful in Beta -> Unicode)

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

