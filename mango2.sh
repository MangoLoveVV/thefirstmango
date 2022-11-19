data=/d/data_
# 2.准备data.list
exec 3<$data/wav
exec 4<$data/text
exec 5<$data/text
rm -rf $data/data.list
while read wav <&3 && read txt <&4 && read txt1 <&5
do  
    key=`echo $wav | awk -F ' ' '{ printf $1}'`
    wav=`echo $wav | awk -F ' ' '{ printf $2}'`
    txt=`echo $txt | awk -F ' ' '{ printf $2}'`
    echo "{\"key\":\"${key}\",\"wav\":\"${wav}\",\"txt\":\"${txt}\" }" >> $data/data.list
done
echo "data.list done!"
