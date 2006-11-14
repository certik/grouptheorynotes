#! /bin/bash

name=groups

dir=$(pwd)
export TEXINPUTS="$dir/macros:$dir/src:$dir/images:"
export BIBINPUTS="$dir/src:"
#echo $TEXINPUTS

pdftex -jobname $name -fmt=csplain -output-directory tmp main.tex
bibtex tmp/$name
pdftex -jobname $name -fmt=csplain -output-directory tmp main.tex
pdftex -jobname $name -fmt=csplain -output-directory tmp main.tex

cd tmp 
dvips $name.dvi
dvipdf $name.dvi
