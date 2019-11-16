# downloads git-completion for core git bash/zsh script from the Git master repo and adds file to your bash_profile so you don't need to manually activate in every new terminal session

# run using:
# 001_gitcompletion_setup.bash 

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git_completion.bash
touch ~/.bash_profile && printf "\nsource ~/.git-completion.bash\n" >> ~/.bash_profile