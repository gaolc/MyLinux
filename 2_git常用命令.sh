#server 
#当前目录新建一个git代码库
git init
#新建一个目录，将其初始化为git代码库
git init [project-name]

#下载一个项目和它的整个代码历史
git clone git@200.31.147.77:TS/dxs.git

cd dxs 
# 显示所有远程仓库
git checkout master181  #切换分支
git remote -v
git branch -v
git rm Imix*
git commit  -m "delete Imix file"
git status 

# 上传本地指定分支到远程仓库
git push [remote] [branch]


#中央仓库应该永远是裸仓库（没有工作目录），可以这样创建：
ssh user@host git init --bare /path/to/repo.git


##检出创库
#执行如下命令以创建一个本地仓库的克隆版本： 
git clone /path/to/repository
#如果是远端服务器上的仓库，你的命令会是这个样子： 
git clone username@host:/path/to/repository （通过 SSH） 或者： 
git clone https:/path/to/repository.git （通过 https）
#比如说：
git clone https://github.com/geeeeeeeeek/git-recipes.git 可以将 git 教程 clone到你指定的目录。

#创建新仓库
创建新文件夹，打开，然后执行 git init 以创建新的 git 仓库。
下面每一步中，你都可以通过 git status 来查看你的 git 仓库状态。
|------------|  add  |----------|  commit  |---------|
| workingdir |------>|  index   |--------->|  head   |
|------------|       |----------|          |---------|

#你可以计划改动（把它们添加到缓存区），使用如下命令：
git add <filename>
git add *

#使用如下命令以实际提交改动：
git commit -m "代码提交信息"
#现在，你的改动已经提交到了 HEAD，但是还没到你的远端仓库。

#推送改动
#你的改动现在已经在本地仓库的 HEAD 中了。执行如下命令以将这些改动提交到远端仓库：
git push origin master
#可以把 master 换成你想要推送的任何分支。

#如果你还没有克隆现有仓库，并欲将你的仓库连接到某个远程服务器，你可以使用如下命令添加：
git remote add origin <server>

###############################
git init
将当前的目录转换成一个 Git 仓库。它在当前的目录下增加了一个 .git 目录，于是就可以开始记录项目版本了。

git init <directory>
在指定目录创建一个空的 Git 仓库。运行这个命令会创建一个名为 directory，只包含 .git 子目录的空目录。

git init --bare <directory>


git config --global user.name <name>
定义当前用户所有提交使用的作者姓名。

git config --global user.email <email>
定义当前用户所有提交使用的作者邮箱。

git config --global alias.<alias-name> <git-command>
为Git命令创建一个快捷方式（别名）。

git config --system core.editor <editor>
定义当前机器所有用户使用命令时用到的文本编辑器，如 git commit。<editor> 参数用编辑器的启动命令（如 vi）替代。

git config --global --edit

Git 将配置项保存在三个单独的文件中，允许你分别对单个仓库、用户和整个系统设置。

/.git/config – 特定仓库的设置。

~/.gitconfig – 特定用户的设置。这也是 --global 标记的设置项存放的位置。

$(prefix)/etc/gitconfig – 系统层面的设置。

# 告诉Git你是谁

git config --global user.name "John Smith"

git config --global user.email john@example.com

# 选择你喜欢的文本编辑器

git config --global core.editor vim

# 添加一些快捷方式(别名)

git config --global alias.st status

git config --global alias.co checkout

git config --global alias.br branch

git config --global alias.up rebase

git config --global alias.ci commit

#裸仓库
因为 git clone 创建项目的本地拷贝更为方便，git init 最常见的使用情景就是用于创建中央仓库：

ssh <user>@<host>

cd path/above/repo

git init --bare my-project.git


#保存更改
git add <file>
将<file>中的更改加入下次提交缓存

git add <directory>
将 <directory> 下的更改加入下次提交的缓存。


git reset HEAD~2 
命令将当前分支向前倒退两个提交，相当于在项目历史中移除刚创建的这两个提交。

Git回滚代码到某个commit
回退命令：
git reset --hard HEAD^         回退到上个版本
git reset --hard HEAD~3        回退到前3次提交之前，以此类推，回退到n次提交之前
git reset --hard commit_id     退到/进到 指定commit的sha码



2，先把git的东西fetch到你本地然后merge后再push
$ git fetch
$ git merge


git clean -n   
git clean -f    #移除当前目录下未被跟踪的文件


用下面这些命令接受更改并并入你的本地 master 分支：
git checkout master  
git log origin/master 


#在分支目录下使用一下命令合并
git merge origin/master
origin/master 和 master 分支现在指向了同一个提交，你已经和上游的更新保持了同步。


#在基于 Git的协作工作流中，将上游更改合并到你的本地仓库是一个常见的工作。我们已经知道应该使用 git fetch，然后是 git merge，但是 git pull 将这两个命令合二为一。

拉取当前分支对应的远程副本中的更改，并立即并入本地副本。效果和 git fetch 后接 git merge origin/. 一致。
git pull --rebase <remote>


下面的栗子演示了如何和一个中央仓库的 master branch 同步：
git checkout master
git pull --rebase origin

Push 是你将本地仓库中的提交转移到远程仓库中时要做的事。它和 git fetch 正好相反，fetch 将提交导入到本地分支，而 push 将提交导出到远程分支。它可以覆盖已有的更改，所以你需要小心使用。这些情况请见下面的讨论。
git push <remote> <branch>

#错误问题解决 git push origin master 报一下错误
 ! [remote rejected] master -> master (branch is currently checked out)
error: failed to push some refs to 'git@10.1.1.13:/opt/git/.git'
#解决方法
这是由于git默认拒绝了push操作，需要进行设置，修改.git/config文件后面添加如下代码：
[receive]
denyCurrentBranch = ignore

无法查看push后的git中文件的原因与解决方法
在初始化远程仓库时最好使用
git --bare init
而不要使用：git init


在初始化远程仓库时最好使用 git –bare init   而不要使用：git init。这样在使用hooks的时候，会有用处。

如果使用了git init初始化，则远程仓库的目录下，也包含work tree，当本地仓库向远程仓库push时,   如果远程仓库正在push的分支上（如果当时不在push的分支，就没有问题）, 那么push后的结果不会反应在work tree上,  也即在远程仓库的目录下对应的文件还是之前的内容，必须得使用git reset –hard才能看到push后的内容.




下面的四条命令在工作目录、stage 缓存(也叫做索引)和 commit 历史之间复制文件。
git add files 把工作目录中的文件加入 stage 缓存
git commit 把 stage 缓存生成一次 commit，并加入 commit 历史
git reset -- files 撤销最后一次 git add files，你也可以用 git reset 撤销所有 stage 缓存文件
git checkout -- files 把文件从 stage 缓存复制到工作目录，用来丢弃本地修改

git checkout HEAD -- files 回滚到复制最后一次提交。


git checkout 命令用于从历史提交（或者 stage 缓存）中拷贝文件到工作目录，也可用于切换分支。

注解：

          LF：Line Feed 换行

          CRLF：Carriage Return Line Feed 回车换行键

 

1、不同操作系统下，处理行尾结束符的方法是不同的：

　　windows下：CRLF（表示句尾使用回车换行两个字符，即windows下的"\r\n"换行）

       unix下：LF（表示句尾，只使用换行）

       mac下：CR（表示只使用回车）

2、Git下处理“换行”（line ending）

　　core.autocrlf是git中负责处理line ending的变量，可以设置3个值：true，false，inout。

（1）设置为true【config --global core.autocrlf true】

          当设置成true时，这意味着你在任何时候添加(add)文件到git仓库时，git都会视为它是一个文本文件(text file)。

　　　它将把crlf变成LF。

（2）设置为false【config --global core.autocrlf false】

   　　当设置成false时，line endings将不做转换操作。文本文件保持原来的样子。

（3）设置为input时，添加文件git仓库时，git把crlf编程lf。当有人Check代码时还是lf方式。因此在window操作系统下，不要使用这个设置。

综上，出现上面那个警告的原因是：

　　windows中的换行符为CRLF，而Linux下的换行符为LF（使用Git命令行Git Bash，实际上就是相当于linux环境），所以在执行git add xxx.xx操作时，会出现这个错误提示！

解决方法：(注意：会删仓库！会删仓库！会删仓库！)

　　<1>删除.git   【rm -rf .git】

　　<2>禁用自动转换，即将设置：git config --global core.autocrlf false

         再重新初始化，并执行添加add操作：

　　<3>【git init】

　　<4> 【git add xxx.xx】


#server 
#当前目录新建一个git代码库
git init
#新建一个目录，将其初始化为git代码库
git init [project-name]

#下载一个项目和它的整个代码历史
git clone git@200.31.147.77:TS/dxs.git

cd dxs 
# 显示所有远程仓库
git checkout master181
git remote -v
git branch -v
git rm Imix*
git commit  -m "delete Imix file"
git status 
git remote add origin  git@github.com/glory0510/MyLinux.git 
# 上传本地指定分支到远程仓库
git push [remote] [branch]

ssh-keygen -t rsa 
############################################
#git设置
git config --global user.name "xxx"
git config --global user.email "xxx@gmail.com"

git config --lis
git config --global user.name "glory0510"
git config --global user.email "240949806@qq.com" 

############################################
git status  #中文显示乱码
modified:   "1_shell\345\237\272\347\241\200.sh"
git config --global core.quotepath false


># yum remove git
># wget https://github.com/git/git/archive/v2.2.1.tar.gz
># tar zxvf v2.2.1.tar.gz
># cd git-2.2.1
># make configure
># ./configure --prefix=/usr/local/git --with-iconv=/usr/local/libiconv
># make all doc
># make install install-doc install-html
># echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc
># source /etc/bashrc

查看分支：git branch

创建分支：git branch <name>

切换分支：git checkout <name>

创建+切换分支：git checkout -b <name>

合并某分支到当前分支：git merge <name>

删除分支：git branch -d <name>


…or create a new repository on the command line
echo "# MyOracle" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:glory0510/MyOracle.git
git push -u origin master

…or push an existing repository from the command line
git remote add origin git@github.com:glory0510/MyOracle.git
git push -u origin master

#基于master分支创建test分支
1.拷贝源代码
git clone git@github.com:glory0510/MyOracle.git
cd MyOracle
2、根据已有分支创建新的分支
git checkout -b test origin/master 
3、推送到git
git push origin test 