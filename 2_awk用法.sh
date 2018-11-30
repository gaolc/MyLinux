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