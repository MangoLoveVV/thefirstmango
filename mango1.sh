#!/bin/bash
# 数据集存放的位置，修改为保存文件的位置
sample_data=/D/AISHELL-1_sample/S0150/S0150_mic
# 指定新创建文件保存的地方
data=/D/AISHELL-1_sample/S0150/S0150_mic/data
if [ ! ‐d $data ];then
mkdir ‐p $data
fi
# 初始化
rm ‐rf $data/wav
rm ‐rf $data/text
# 1.准备 wav text
for sub_dir in `ls ${sample_data}`;do
wav_txt_dir=${sample_data}/${sub_dir}/${sub_dir}_mic
echo $wav_txt_dir
for file in `ls $wav_txt_dir`;do
if [ ${file#*.} != "txt" ];then
# 准备 wav
echo "${file%.*} $wav_txt_dir/${file%.*}.wav" >> $data/wav
# echo `wc ‐l $data/wav`
# 准备 text
txt=`cat $wav_txt_dir/${file%.*}.txt`
echo "${file%.*} $txt" >> $data/text
fi
done
done
echo "wav and text done"
