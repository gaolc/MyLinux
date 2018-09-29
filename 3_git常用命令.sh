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

