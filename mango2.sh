data=/d/data_
exec 3<$data/wav
exec 4<$data/text
exec 5<$data/text
rm ‐rf $data/data_list
while read wav <&3 && read txt <&4 && read txt1 <&5
do
key=`echo $wav | awk ‐F ' ' '{ printf $1}'`
wav=`echo $wav | awk ‐F ' ' '{ printf $2}'`
txt=`echo $txt | awk ‐F ' ' '{ printf $2}'`
echo "{\"key\":\"${key}\",\"wav\":\"${wav}\",\"txt\":\"${txt}\" }" >> $data/data_list
done
echo "data_list done!"
