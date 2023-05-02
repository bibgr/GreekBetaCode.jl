![GreekBetaCode](https://github.com/bibgr/GreekBetaCode.jl/blob/main/docs/assets/logo.png?raw=true)

# GreekBetaCode.jl

Partial greek implementation of the TLG® Beta Code in Julia

# Description

This package partially implements the greek parts of the Thesaurus Linguae Graecae, TLG®, Beta
Code. The rationale is to deal with greek text only (thus leaving out control and markup beta
codes, as well as latin, coptic, hebrew, and a plethora of seemingly unrelated codes). In
particular, editions of Greek New Testaments with critical apparata, such as SBL's are the
must-cover character set for the library. Beyond this "core" application, the selection of
covered characters has been somewhat arbitrary, mainly focusing on familiar characters in the
U+00XX, U+03XX, and U+20XX Unicode codepoint ranges.

The package is fairly straight-forward, providing two conversion functions: (1) From Beta to
Unicode, and (2) From Unicode to Beta. The functions are erspectively named `U` and `B`:

# Examples

Entering Beta and getting Unicode:

```julia-repl
julia> using GreekBetaCode
[ Info: Precompiling GreekBetaCode [9dc342f4-d0cc-4e90-9103-06b4474f2d96]

julia> U
U (generic function with 1 method)

julia> B
B (generic function with 1 method)

julia> txt = "*EI)=PEN AU)TH=| O( *)IHSOU=S: *)EGW/ EI)MI H( A)NA/STASIS KAI\\ H( ZWH/";

julia> uni = U(txt)
"Εἶπεν αὐτῇ ὁ Ἰησοῦς· Ἐγώ εἰμι ἡ ἀνάστασις καὶ ἡ ζωή"
```

Which, in a free translation, means: "Jesus said to her: ‘I am the ressurection and the life’ ".

Entering Unicode and getting Beta:

```julia-repl
julia> uni = U(txt)
"Εἶπεν αὐτῇ ὁ Ἰησοῦς· Ἐγώ εἰμι ἡ ἀνάστασις καὶ ἡ ζωή"

julia> B(uni)
"*EI)=PEN AU)TH=| O( *)IHSOU=S2: *)EGW/ EI)MI H( A)NA/STASIS KAI\\ H( ZWH/"
```

Some conversion rules are enforced in case of ambiguity, such as:

1. Always prefer Unicode characters with diacritics over plain characters folowed by combining
   diacritics; This is done by always preferring the lesser number of Unicode codepoints.
2. Always prefer Unicode characters of lower codepoint values for the same glyph.
3. In Beta, diacritics always follows, i.e. are given after, the target character.
4. In Beta, breathings such as psili and dasia, precede accents.
5. In Beta, accents such as oxia, varia, perispomeni, and dialiticas, precede subscribed iotas.
6. When generating Beta, dialitica accents are always placed last.

Therefore, owing to these rules, when the conversions are performed twice, i.e., back and forth
to a given format, whether Beta or Unicode, they have the effect of normalizing their input:

```julia-repl
julia> bs = [ "I+/", "I/+" ] # Beta input codes
2-element Vector{String}:
 "I+/"
 "I/+"

julia> us = U.(bs)
2-element Vector{String}:
 "ΐ"
 "ΐ"

julia> us[1] == us[2] # Both beta inputs produced the same output
true

julia> BS = B.(us) # Converted back to Beta codes. Notice the uniformity
2-element Vector{String}:
 "I/+"
 "I/+"

julia> BS .== bs # Due to enforced standards, only the second input is equal
2-element BitVector:
 0
 1
```

Normalizing combining diacritics with accented characters in Unicode:

```julia-repl
julia> using Combinatorics

julia> inputs = String[join(i) for i in permutations(["α\u0300\u0314"...])]
6-element Vector{String}:
 "ὰ̔"
 "ἃ"
 "̀ἁ"
 "̀̔α"	# The 6 permutations of "α" and two combining diacritics are print!
 "̔ὰ"
 "̔̀α"

julia> B.(inputs)
6-element Vector{String}:
 "A(\\"
 "A(\\"
 "A(\\"
 "A(\\" # They all converted to the same beta code
 "A(\\"
 "A(\\"

julia> U.(B.(inputs))
6-element Vector{String}:
 "ἃ"
 "ἃ"
 "ἃ"
 "ἃ"    # They all converted again to Unicode... this time, they are all the same:
 "ἃ"
 "ἃ"

julia> [ i[1] for i in U.(B.(inputs)) ]
6-element Vector{Char}:
 'ἃ': Unicode U+1F03 (category Ll: Letter, lowercase)
 'ἃ': Unicode U+1F03 (category Ll: Letter, lowercase)
 'ἃ': Unicode U+1F03 (category Ll: Letter, lowercase)
 'ἃ': Unicode U+1F03 (category Ll: Letter, lowercase)
 'ἃ': Unicode U+1F03 (category Ll: Letter, lowercase)
 'ἃ': Unicode U+1F03 (category Ll: Letter, lowercase)
```

# Author
C Naaktgeboren. [Lattes](http://lattes.cnpq.br/8621139258082919).

`NaaktgeborenC <dot!> PhD {at!} gmail [dot!] com`

## License

This project is [licensed](https://github.com/bibgr/GreekBetaCode.jl/blob/master/LICENSE)
under the MIT license.

## Citations

How to cite this project:

```bibtex
@Misc{2023-NaaktgeborenC-GreekBetaCode,
  author       = {C. Naaktgeboren},
  title        = {{GreekBetaCode.jl} -- Partial greek implementation of the {TLG®} {B}eta {C}ode in {J}ulia},
  howpublished = {Online},
  year         = {2023},
  journal      = {GitHub repository},
  publisher    = {GitHub},
  url          = {https://github.com/bibgr/GreekBetaCode.jl},
}
```

# References

```
[1] Pantelia, M. (Ed.), The TLG® Beta Code Manual, Thesaurus Linguae Graecae, 2016.
    http://www.tlg.uci.edu/encoding/BCM.pdf.

[2] Yannis Haralambous. Guidelines and Suggested Amendments to the Greek Unicode Tables.
    21st International Unicode Conference, Unicode Consortium, May 2002, Dublin, Ireland.
    Paper hal-02112005. https://hal.archives-ouvertes.fr/hal-02112005.
```

