#### Java 环境变量配置(CentOS6.5+)
    export JAVA_HOME=/opt/jdk1.8.0_201   
    export JRE_HOME=$JAVA_HOME/jre    
    export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH   
    export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH   
####  Python3 安装(CentOS6.5+)           
    yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
    yum install -y gcc gcc-c++
    yum install -y libffi-devel
    wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz 
    tar -xvf Python-3.7.3.tgz 
    cd Python-3.7.3/
    ./configure --prefix=/usr/local/python3   #指定安装目录
    echo $?
    make 
    echo $?
    make install 
    echo $?
    pip3 -V 
    ln -s /usr/local/python3/bin/python3 /usr/bin/python3
    ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
    python3     #检查是否安装正确
    pip3 -V    

+  <font color=red size=2 face="黑体">_参考https://www.cnblogs.com/kimyeee/p/7250560.html_</font>
####  解决pyecharts转换图片中问小框框 
    yum install bitmap-fonts bitmap-fonts-cjk

