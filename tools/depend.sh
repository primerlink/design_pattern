#! /bin/sh

depend_temp=/tmp/depend.$$$$
rm -rf ${depend_temp}

#注意对首行的解析，尤其是续航符后不能有其它字符（立即换行）
#sed -n -e '1p' $1 | cut -d ' ' -f 2- | awk 'BEGIN{x = 1} {printf "%s : ", $x; x++} END {while (x < NF) {printf "%s", $x; x++} if(NF > 1){printf "%s" ,$NF} printf "\n"}' > ${depend_temp}

sed -n -e '1p' $1 | cut -d ' ' -f 2- > ${depend_temp}

sed -n -e '1p' ${depend_temp} | grep '^\\' 1>&/dev/null && rm ${depend_temp} && touch ${depend_temp}

awk 'NR>1 {print $0}' $1 >> ${depend_temp}
#tail -n +2 $1 >> ${depend_temp}

cp ${depend_temp} ${depend_temp}.bak

rm ${depend_temp} && touch ${depend_temp}

sed -n -e '1p' ${depend_temp}.bak | awk 'BEGIN{x =1 }  {printf "%s : ", $x; x++} END{while (x < NF) {printf "%s", $x; x++} if(NF >1) {printf "%s", $NF} printf "\n"}' > ${depend_temp}
awk 'NR>1 {print $0}' ${depend_temp}.bak >> ${depend_temp}
rm ${depend_temp}.bak

add_line=`head -n 1 ${depend_temp} | cut -d ' ' -f 1`
#在最后一行加入touch命令
#${parameter%word},可以看下bash中的此用法
echo -e "\ttouch ${add_line}" >> ${depend_temp}
cat ${depend_temp}

rm -rf ${depend_temp}
