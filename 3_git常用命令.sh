#基于master分支创建test分支
1.拷贝源代码
git clone git@github.com:glory0510/MyOracle.git
cd MyOracle
2、根据已有分支创建新的分支
git checkout -b test origin/master 
3、推送到git
git push origin test 

#create a new repository on the command line
echo "# MyWindows" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:glory0510/MyWindows.git
git push -u origin master


#Chinese display of garbled code
git status  
modified:   "1_shell\345\237\272\347\241\200.sh"
git config --global core.quotepath false

#warning: LF will be replaced by CRLF in README.md.
git config --global core.aotucrlf false

#创建版本库
git clone <url>    #克隆远程版本库
git init           #初始化本地版本库

#修改和提交
git status         #查看状态
git diff           #查看变更内容
git add .          #跟踪所有改的的文件。每次修改，如果不add到暂存区，那就不会加入到commit中
git add <file>     #跟踪指定的文件
git mv <old> <new> #文件改的
git rm <file>      #删除文件
git rm --cached <file>            #停止跟踪文件但不删除
git commit -m "commit message"    #提交所有更新过的文件
git commit --amend                #修改最后一次提交

#查看提交历史
git log            #查看提交历史 
git log --oneline  #以一行一次提交信息显示
git log -p <file>  #查看指定文件的提交历史
git blame <file>   #以列表的方式查看指定文件的提交历史

#撤销
git reset --hard HEAD        #撤销工作目录中所有未提交文件的修改内容
git checkout HEAD <file>     #撤销指定的未提交文件的修改内容
git revert <commit>          #撤销指定的提交


#分支与标签
git branch                   #显示所有本地分支
git checkout <branch/tag>    #切换到指定分支和标签
git branch <new-branch>      #创建新分支
git branch -d <branch>       #删除本地分子
git tag                      #列出所有本地标签
git tag <tagname>            #基于最新提交创建标签
git tag -d <tagname>         #删除标签


#合并和衍合
git merge <branch>            #合并指定分支到当前分支
git rebase <branch>           #衍和指定分支到当前分支


#远程操作
git remote                    #查看远程库的信息
git remote -v                 #用git remote -v显示更详细的信息
git remote show <remote>      #查看指定远程版本信息
git remote add <remote> <url> #添加远程版本库
git fetch <remote>            #从远程库获取代码
git pull <remote> <branch>    #下载代码及快速合并
git push <remote> <branch>    #上传代码及快速合并
git push <remote> :<branch/tag-name>   #删除远程分支或标签
git push --tags               #上传所有标下

#git configuration  --global is all user use 
git config --global user.name "Your Name"
git config --global user.email "email@example.com" 

#回退 
git reset --hard HEAD^         #回退最近一次的提交
git reflog                     #记录你的每一次命令
git reset --hard commit_id     #Git允许我们在版本的历史之间穿梭，使用命令git reset --hard commit_id
git diff HEAD -- readme.txt    #可以查看工作区和版本库里面最新版本的区别
git commit -m "git tracks changes"    #commit提交的是store里面的内容


#撤销修改
git checkout -- readme.txt     #意思就是，把readme.txt文件在工作区的修改全部撤销
#一种是readme.txt自修改后还没有被放到暂存区，现在，撤销修改就回到和版本库一模一样的状态
#一种是readme.txt已经添加到暂存区后，又作了修改，现在，撤销修改就回到添加到暂存区后的状态
git reset HEAD readme.txt      #命令git reset HEAD file可以把暂存区的修改撤销掉（unstage），重新放回工作区

#场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令git checkout -- file。
#场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，第一步用命令git reset HEAD file，就回到了场景1，第二步按场景1操作。 
#场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，参考版本回退一节，不过前提是没有推送到远程库

#删除文件
git rm test.txt rm 'test.txt' 
git commit -m "remove test.txt"
git checkout -- test.txt       #git checkout其实是用版本库里的版本替换工作区的版本，无论工作区是修改还是删除，都 可以“一键还原”

git remote add origin git@github.com:michaelliao/learngit.git   #关联远程仓库
git push -u origin master                                       #远程库的名字就是origin，这是Git默认的叫法，也可以改成别的，远程库是空的，我们第⼀一次推送master分支时，加上了-u参数，
git push origin master

git branch                   #查看分支
git branch -a                #查看所有本地分支和远程分支
git branch name              #创建分支
git checkout name            #切换分支
git checkout -b name         #创建+切换分支
git merge name               #合并某分支到当前分支
git branch -d name           #删除分支

git stash                    #Git还提供了⼀一个stash功能，可以把当前⼯工作现场“储藏”起来，等以后恢复现场后 继续⼯工作： 
git stash list               
#Git把stash内容存在某个地方了，但是需要恢复一下，有两个办法： 一是用git stash apply恢复，但是恢复后，stash内容并不删除，你需要用git stash drop来删除；
#另一种方式是用git stash pop，恢复的同时把stash内容也删了：  
git stash pop 

git merge --no-ff -m "merged bug fix 101" issue-101  #合并分支时，加上--no-ff参数就可以用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合
git log --graph --pretty=oneline --abbrev-commit

git stash list                #你可以多次stash，恢复的时候，先用git stash list查看
git stash apply stash@{0}     #恢复指定的stash 

#Feature分支
git checkout -b feature-vulcan
git add vulcan.py 
git commit -m "add feature vulcan" 
git checkout dev 
git branch -d feature-vulcan       #Git友情提醒，feature-vulcan分支还没有被合并，如果删除，将丢失掉修改， 如果要强行删除，需要使用命令git branch -D feature-vulcan
git branch -D feature-vulcan       #现在我们强行删除

#推送分支，就是把该分支上的所有本地提交推送到远程库。推送时，要指定本地分支，这样Git就会把该分支推送到远程库对应的远程分支上： 
git push origin master              
git push origin dev               #如果要推送其他分支，如dev

#本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branchname，本地和远程分支的名称最好一致
git checkout -b dev origin/dev    #基于远程dev分支创建dev分支


#如果git pull提示“no tracking information”，则说明本地分支和远程分支的链接关系没有创建，用命令git branch --set-upstream branch-name origin/branch-name
git pull                          #Unpacking objects
git branch --set-upstream dev origin/<branch> 
git branch --set-upstream dev origin/dev 

#标签管理
git tag v1.0           # git tag name就可以打一个新标签     
git tag                #可以用命令git tag查看所有标签  
git tag v1.0           #默认标签是打在新提交的commit上的。有时候，如果忘了打标签，比如，现在已经是周五了，但应该在周一打的标签没有打，怎么办？ 
git log --pretty=oneline --abbrev-commit 
git tag v0.9 6224937   #给指定commit 打标签

git show v0.9          #标签不是按时间顺序列出，而是按字母排序的。git show tagname查看标签信息 
git tag -s v0.2 -m "signed version 0.2 released" fec145a       #还可以通过-s用私钥签名一个标签
git tag -a tagname -m "blablabla..."     #可以指定标签信息
git tag -d v0.1        #删除标签

git push origin v1.0   #如果要推送某个标签到远程，使用命令git push origin tagname
git push origin --tags #一次性推送全部尚未推送到远程的本地标签

#如果标签已经推送到远程，要删除远程标签就麻烦一点，先从本地删除: 
git tag -d v0.9 
#然后，从远程删除。删除命令也是push，但是格式如下： 
git push origin :refs/tags/v0.9

git config --global color.ui true   #让Git显示颜色，会让命令输出看起来更醒目

#忽略特殊文件
#Git考虑到了大家的感受，这个问题解决起来也很简单，在Git工作区的根目录下创建一个特殊的.gitignore文件，然后把要忽略的文件名填进去，Git就会自动忽略这些文件
1. 忽略某些文件时，需要编写.gitignore。 
2. .gitignore⽂文件本身要放到版本库里，并且可以对.gitignore做版本管理


#配置别名
git config --global alias.st status 
git config --global alias.co checkout 
git config --global alias.ci commit 
git config --global alias.br branch
git config --global alias.unstage 'reset HEAD' 
#当你敲入命令：  git unstage test.py 实际上Git执行的是：  git reset HEAD test.py
git config --global alias.last 'log -1' 
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 


