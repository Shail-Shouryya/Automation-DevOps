# downloads git-completion for core git bash/zsh script from the Git master repo and adds file to your bash_profile so you don't need to manually activate in every new terminal session

# run using:
# 001_gitcompletion_setup.bash
# you can rerun this script to update the git-completion file from master, just comment out the indicated line below

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git_completion.bash

# comment out THIS following line if you already ran this and just want to update git-completion from the downstream master repository
touch ~/.bash_profile && printf "\nsource ~/.git-completion.bash\n" >> ~/.bash_profile

source ~/.bash_profile
