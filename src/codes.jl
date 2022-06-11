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

fwdB = Dict{String, Vector{String}}(
    # SubSection 1.1 - Greek, lowercase
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
)

