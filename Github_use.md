##菜鸟学习笔记之--提交一个本地文件到一个已经存在的github repo

*在所选文件夹中右键， 选择git bash

*git init 初始化

*git add @文件名@ 加载该文件

*git commit -m "init commit" 准备提交该文件到github

*git remote add origin @填写github repo的http网址，以.git结尾@

*git pull --rebase origin master 先将该repo的文件拉下来， 有的时候不用加这一步，但有的时候不加会报错。 该命令会让repo里的所有文件下载到你选择的本地库

*git push origin master 将选择的文件push到repo，完成


###另外，有的时候已经选择了repo但是报错，需要先清除已经add的repo再重新添加。这时需要用到命令
git remote rm origin

