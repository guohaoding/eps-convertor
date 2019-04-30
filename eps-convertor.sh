#!/bin/bash

main_path=$(dirname $0)
main_path=${main_path/\./$(pwd)}
echo "current path:" $main_path


pdf_path=$main_path/pdf

eps_path=$main_path/eps


cd $pdf_path

# convert pdf file into temp eps file without boundingbox
for fname in `ls *.pdf`
do
echo $fname

pdftops -eps $fname

done

# add boundingbox into eps
for fname in `ls *.eps`
do
echo $fname

cat $fname | ps2eps > $eps_path/$fname

done

# remove all the temp eps files
for fname in `ls *.eps`
do

rm $fname

done
