#!/bin/bash
#SystemVersion:CentOS 6.5
#判断变量是数字还是字符串
#~ 是正则匹配操作符
read -p 'please input :' DIR_DATE
flag=`echo $DIR_DATE| awk '{print($0~/^[-]?([0-9])+[.]?([0-9])+$/)?"number":"string"}'`
echo $flag
if [ "$flag" = "number" ];then dir_date=$DIR_DATE ;else dir_date=$($DIR_DATE) ; fi

#匹配后多显示上下几行
seq 10 |grep "5" -A 2      #匹配含有5的那一行再多往下显示2行，最后显示三行
seq 10 |grep "5" -B 2      #匹配含有5的那一行再多往上显示2行，最后显示三行
seq 10 |grep "5" -C 2      #匹配含有5的那一行再多往上，往下显示2行，最后显示五行

#awk NR 为处理的第几行,NF 为列数
#https://www.cnblogs.com/xudong-bupt/p/3721210.html
#http://linux.51yip.com/search/awk
ls -ltr |awk '{print NR " " $6 " " NF }'

#替换第9个字符到第19个字符之间的abc为xyz：
echo "123abc456aababc789abcqweabcrtyabc" \
|awk -F "" 'BEGIN { OFS="" } {for(i=9;i<=19;i++) if($i=="a" && $(i+1)=="b" && $(i+2)=="c"){$i="x";$(i+1)="y";$(i+2)="z"}print }'




#获取本机上网络接口上可用的公网IP地址
#BEGIN{FS="[/ ]+";OFS=" -- "} 是指把一个或多个空格或者/作为读取文本时的字段分隔符,把" -- "作为执行完后的输出字段分隔符
#$2~"eth"{$3~"NO-CARRIER"?a=0:a=1}找到第二个字段匹配到"eth"的行并判断第三个字段是否匹配到"NO-CARRIER",匹配到则a=0,否则a=1
#$NF~"eth"&&a将最后一个字段和a相与,结果为真则打印最后一个字段和第三个字段,否则不处理
ip addr show | awk 'BEGIN{FS="[/ ]+";OFS=" -- "}$2~"eth"{$3~"NO-CARRIER"?a=0:a=1}$NF~"eth"&&a{print $NF,$3}'

#shell程序中有一个变量a=15，你在awk程序中直接使用变量a是不行的，而你用awk -v b=a， 这样在AWK程序中就可以使用变量b了！
hello=1
world=2
awk -v foo=$hello -v bar=$world 'BEGIN {print foo,bar}'


介绍下Shell中的${}、##和%%使用范例，本文给出了不同情况下得到的结果。
假设定义了一个变量为：
代码如下:
file=/dir1/dir2/dir3/my.file.txt
可以用${ }分别替换得到不同的值：
${file#*/}：删掉第一个 / 及其左边的字符串：dir1/dir2/dir3/my.file.txt
${file##*/}：删掉最后一个 / 及其左边的字符串：my.file.txt
${file#*.}：删掉第一个 . 及其左边的字符串：file.txt
${file##*.}：删掉最后一个 . 及其左边的字符串：txt
${file%/*}：删掉最后一个 / 及其右边的字符串：/dir1/dir2/dir3
${file%%/*}：删掉第一个 / 及其右边的字符串：(空值)
${file%.*}：删掉最后一个 . 及其右边的字符串：/dir1/dir2/dir3/my.file
${file%%.*}：删掉第一个 . 及其右边的字符串：/dir1/dir2/dir3/my
记忆的方法为：
# 是 去掉左边（键盘上#在 $ 的左边）
%是去掉右边（键盘上% 在$ 的右边）
单一符号是最小匹配；两个符号是最大匹配
${file:0:5}：提取最左边的 5 个字节：/dir1
${file:5:5}：提取第 5 个字节右边的连续5个字节：/dir2
也可以对变量值里的字符串作替换：
${file/dir/path}：将第一个dir 替换为path：/path1/dir2/dir3/my.file.txt
${file//dir/path}：将全部dir 替换为 path：/path1/path2/path3/my.file.txt 


1. 这个是最简单的了,但是有一点不好的是只能在后面加个后缀
find ./ -name "test.*" -exec mv {} {}.bak \;
find ./ -name hello.sh -exec cp {} {}.bak \;
find -name "hello.sh" -exec rm -rf {} \;
2. 一样的道理
find ./ -name "*.txt" | xargs -i mv {} {}.bak 

3.find ./ -name "*bak" | awk '{printf("mv %s \t %s \n",$1,$1".bak")}' |sh
awk 里面可以自由发挥 单纯的对文件名处理来说 还不是awk的强项
4.那就来sed吧
find ./ -name xxx | sed ''s/XXX/mv xxx xxxxx/'' |sh
效率 注意效率!
创建进程的消耗是很大的,所以能用xargs的时候就不要用 |sh
ls -1|sed ''s/.old$//''|xargs -I {} mv {}.old {}
ls -1|xargs -i mv {} {}.bak
ls -1|sed "s/.bak//g"| xargs -i mv {}.bak {}
ls -1 |grep "sh$"|xargs -i cp {} {}.bak
#find查找指定深度
find ./ -maxdepth 2 -name "*.sh"
find ./ -maxdepth 2 -name "*.sh" -exec cp {} {}.bak \;

awk -v OFS="\t" '{$1=$1}1' inputfile
awk '{for(i=0;i++<NF;){a=i==NF?$i"\n":$i"\t";printf a}}' inputfile
awk -F ","  -v OFS="\t" '{$1=$1 print }' inputfile

lsblk -l  #查看块设备使用
df -T -h  #产看设别类型
df -i     #产看Inodes节点使用情况
mount /dev/sr0 /mnt/cdrom
umount /mnt/cdrom


#shift 用于对参数的移动(左移)
#!/bin/bash
i=1
while [ "$#" != 0 ];do
echo "第$i个参数为:$1 ,参数个数为:$#"
shift
let i++
done

#linux根目录满了，怎样快速查看是哪个文件占用空间大
du -ah --max-depth=1  

#直接创建数组
names=(gao long cheng)
echo ${#names[@])} 
#通过命令结果获取数组
names=($(echo 'w h t '))
echo ${#names[@]}
#指定分割符号，用sed替换就好
namestring="w#h#t"
names=($(echo ${namestring}|sed "s/#/ /g"))
echo ${#names[@]}
#获取数组索引列表
echo ${!names[*]}
#访问数组元素
echo ${names[2]}
#颜色输出
printf  "\033[31mglc love wht\033[0m\n"

#将多行输出转换为单行输出
$ cat example.txt # 样例文件
1 2 3 4 5 6 
7 8 9 10 
11 12
cat example.txt | xargs 
1 2 3 4 5 6 7 8 9 10 11 12
#cat example.txt |xargs -n 3

