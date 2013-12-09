#!/bin/zsh

ans=0
while read num
do
  ans=$[$ans + $num]
done
echo $ans
