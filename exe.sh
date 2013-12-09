#!/bin/zsh

corpus_dir="../corpus/tsubame00.kototoi.knp"



rm -rf ./nounLists/*

for f in $corpus_dir/*.bz2
do
  bzcat $f | nkf -Lu | ruby nounExtracter.rb
  exit
done

