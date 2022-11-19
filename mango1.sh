#!/bin/bash

# 数据集存放的位置
sample_data=/d/AISHELL-1_sample
# 数据生成的地方
data=/d/data_
if [ ! -d $data ];then
    mkdir -p $data
fi
# 初始化
rm -rf $data/wav.scp
rm -rf $data/text
# 1.准备 wav.scp text
for sub_dir in `ls ${sample_data}`;do
    wav_txt_dir=${sample_data}/${sub_dir}/${sub_dir}_mic
    echo $wav_txt_dir
    for file in `ls $wav_txt_dir`;do
        if [ ${file#*.} != "txt" ];then
            # 准备wav.scp
            echo "${file%.*} $wav_txt_dir/${file%.*}.wav" >> $data/wav.scp
            # echo `wc -l $data/wav.scp`
            # 准备text
            txt=`cat $wav_txt_dir/${file%.*}.txt`
            echo "${file%.*} $txt" >> $data/text
        fi
    done
done
echo "wav.scp and text done!"
