![GreekBetaCode](https://github.com/...)

# GreekBetaCode.jl
Partial greek implementation of the TLG® Beta Code in Julia

# Description

# Examples

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

    [1] Pantelia, M. (Ed.), The TLG® Beta Code Manual, Thesaurus Linguae Graecae, 2016.
        http://www.tlg.uci.edu/encoding/BCM.pdf.

    [2] Yannis Haralambous. Guidelines and Suggested Amendments to the Greek Unicode Tables.
        21st International Unicode Conference, Unicode Consortium, May 2002, Dublin, Ireland.
        Paper hal-02112005. https://hal.archives-ouvertes.fr/hal-02112005.
 


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
