### GitHub beginner's note --GitHub repo

* Right click on your local repo and select "git bash"
* git init (initiate your commit precedure)
* git add @input your file name@ (load your file)
* git commit -m "init commit" (init commit your file)
* git remote add origin @填input your remote repo address, end with .git@ (this step can be droped if the repo already loaded)
* git pull --rebase origin master (optional step in case sometimes you find an error, to apply changes of remote repo to your local repo as well)
* git push origin master (push your file to the remote repo and finish)
* git remote rm origin (this command needed if you want to change your remote repo)