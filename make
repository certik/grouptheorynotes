#! /bin/bash

name=groups

tex=tex
#tex=pdftex

dir=$(pwd)
export TEXINPUTS="$dir/macros:$dir/src:$dir/images:"
export BIBINPUTS="$dir/src:"
#echo $TEXINPUTS

$tex -jobname $name -fmt=csplain -output-directory tmp main.tex
bibtex tmp/$name
$tex -jobname $name -fmt=csplain -output-directory tmp main.tex
$tex -jobname $name -fmt=csplain -output-directory tmp main.tex

cd tmp 
dvips $name.dvi
dvipdf $name.dvi
