#!/bin/zsh

corpus_dir="../corpus/tsubame00.kototoi.knp"
task_file=./para.tasks
PWD=~/nounCategorization_rb

#GXP3を利用して並列化する

#GXP3のノード数
NODE=`cut -d ' ' -f2 /home/lr/tsakaki/gxp3/hosts | ./sum_stdin.sh`

#gxp3rcの読み込み
echo "node loading..." > $PWD/node.txt
source $PWD/gxp3rc
while (test `gxpc e hostname | wc -l` -lt $NODE)
do
  source $PWD/gxp3rc
done

echo ""
echo "NODE GOT!!"

acd $PWD

#獲得したノード数をメモ
cat /dev/null > ./node.txt
date >> ./node.txt
echo `gxpc e hostname | sort | uniq -c` >> ./node.txt

echo "Sum:"$NODE >> ./node.txt


#もともと:gxpを使わない場合
# for f in $corpus_dir/*.bz2
# do
#   bzcat $f | nkf -Lu | ruby nounExtracter.rb
# # exit
# done


#タスクファイルの生成
cnt=1
cat /dev/null > $task_file

rm -rf ./nounLists/*

for f in $corpus_dir/*.bz2
do
#  id=$f:t:r
  id=$cnt
  cnt=$[$cnt + 1]
  input=$f

  echo "$id /home/lr/tsakaki/nounCategorization_rb/extractNoun.sh $input" >> $task_file
#とりあえず1つのファイルのみ
  break
done


#ファイルにappendしていくので、元々のファイルを削除
rm ./nounLists/*
rm -rf ./status ./log ./output/

#taskファイルに基づいて実行
acd ~/nounCategorization_rb/
gxpc ep ./para.tasks

gxpc quit

