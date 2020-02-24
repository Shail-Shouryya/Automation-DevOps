# downloads git-completion for core git bash/zsh script from the Git master repo and adds file to 
# your bash_profile so you don't need to manually activate in every new terminal session

# run using:
# sh 001_gitcompletion_setup.bash
# rerun this script to update git-completion file from git/git master, commenting out indicated line

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash

# comment out THIS following line if you already ran this and just want to update git-completion from the downstream master repository
touch ~/.bash_profile && printf "\nsource ~/.git-completion.bash\n" >> ~/.bash_profile

source ~/.bash_profile
