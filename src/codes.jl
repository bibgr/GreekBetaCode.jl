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
    "A("    =>  String[ "\u1f01", ],    # ἁ
    "E("    =>  String[ "\u1f11", ],    # ἑ
    "H("    =>  String[ "\u1f21", ],    # ἡ
    "I("    =>  String[ "\u1f31", ],    # ἱ
    "O("    =>  String[ "\u1f41", ],    # ὁ
    "U("    =>  String[ "\u1f51", ],    # ὑ
    "W("    =>  String[ "\u1f61", ],    # ὡ
    "R("    =>  String[ "\u1fe5", ],    # ῥ
)

# revB - the reverse (unicode to) Beta Code dictionary
revB = Dict{String, Vector{String}}()
for (k, V) in fwdB
    for v in V
        push!(get!(() -> Vector{String}[], revB, v), k)
    end
end

export fwdB, revB

