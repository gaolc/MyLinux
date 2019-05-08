#通过设置输出分隔符（OFS="%"）修改输出格式
awk  'BEGIN{OFS="%"}{print $1,$2 }' data

#表达式1?表达式2:表达式3 相当于：
if (表达式1) 
   表达式2 
else 
   表达式3 
awk '{print ($1>4 ? "high "$1: "low "$1)}' file  

#打印所有元素,以行显示
awk '{ for(i=1;i<=NF;i++) {print NR"-"i,$i}}'  data 
#awk if语句
awk '{if ($1==1) print "A"; else if ($1==2) print "B"; else print "C"}'

#awk aplit()函数
time="12:34:56"
echo $time | awk '{split($0,a,":");print a[1],a[2],a[3]}'

#awk substr()函数
#substr(s,p) 返回字符串s中从p开始的后缀部分
#substr(s,p,n) 返回字符串s中从p开始长度为n的后缀部分
echo "123" | awk '{print substr($0,1,1)}'

#列求和： cat tmp.txt |awk '{a+=$1}END{print a}' 
#列求平均值：cat you.txt |awk '{a+=$1}END{print a/NR}'
#列求最大值：cat you.txt |awk 'BEGIN{a=0}{if ($1>a) a=$1 fi}END{print a}'

#awk 某一列求和
#awk '{sum+=$1}END{print sum}
#exp: 计算第二列的和 ，out: 11
cat << EOF | awk '{sum+=$2}END{print sum}' 
2019-02-01  1  10 
2019-02-01  1  10
2019-02-01  1  10
2019-02-02  2  20
2019-02-02  2  20
2019-02-02  2  20
2019-02-02  2  20
EOF 


#awk 以第一列分组，第二、三列求和
awk '{s[$1] += $2; a[$1] += $3}END{ for(i in s){  print i,s[i],a[i]}}'
cat << EOF | awk '{s[$1] += $2; a[$1] += $3}END{ for(i in s){  print i,s[i],a[i]}}' 
2019-02-01  1  10 
2019-02-01  1  10
2019-02-01  1  10
2019-02-02  2  20
2019-02-02  2  20
2019-02-02  2  20
2019-02-02  2  20
EOF

#第一个例子在整个文档中匹配test，匹配的都被替换成mytest。
#第二个例子在整个文档的第一个域中匹配，所有匹配的都被替换成mytest
$ awk '{ gsub(/test/, "mytest"); print }' testfile
$ awk '{ gsub(/test/, "mytest", $1); print }' testfile
