#!/bin/zsh

fileName=$1

bzcat $fileName | nkf -Lu | ruby nounExtracter.rb
