#!/bin/zsh

fileName=$1

bzcat $fileName | nkf -Lu | ruby ./src/knpLineScanner.rb
