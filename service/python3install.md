#### Java 环境变量配置
    export JAVA_HOME=/opt/jdk1.8.0_201   
    export JRE_HOME=$JAVA_HOME/jre    
    export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH   
    export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH   
####  Python3 安装
    yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel
    yum install -y gcc gcc-c++
    yum install -y libffi-devel 
    tar -xvf Python-3.7.3.tgz 
    cd Python-3.7.3/
    ./configure --prefix=/usr/local/python3
    echo $?
    make 
    echo $?
    make install 
    echo $?
    pip3 -V 
    ln -s /usr/local/python3/bin/python3 /usr/bin/python3
    ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
    pip3 -V   
+  <font color=red size=2 face="黑体">_参考https://www.cnblogs.com/kimyeee/p/7250560.html_</font>
####  解决pyecharts转换图片中问小框框 
    yum install bitmap-fonts bitmap-fonts-cjk

