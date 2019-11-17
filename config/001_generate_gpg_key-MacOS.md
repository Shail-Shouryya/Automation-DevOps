# Using a GPG key (MacOS)
The links to the official GitHub walkthrough pages are included, but the bullet points provide a condensed version of all the information and should be enough to set everything up :)

- Check to see if you already have an existing GPG key
  - `gpg --list-secret-keys --keyid-format LONG`
  - if the above command didn't work:
    - `gpg2 --list-secret-keys --keyid-format LONG`
    - `git config --global gpg.program $(which gpg2)`
    - If you don't see any key pairs or want to use a different key, proceed to the next step below. Otherwise, skip to the following step
    - Download the [GPG command line tools](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key) for your OS (scroll down to **GnuPG binary releases**). This is mostly taken from [Generating a new GPG key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)
  - open terminal
    - generate a GPG key pair using
      - `gpg --full-generate-key`
      - specify the type of key you want (accept the default `RSA and RSA` if unsure)
      - choose desired key size; the max of `4096` is recommended
      - enter length of time key should be valid
        - just hit `Enter` if unsure to accept the default value of 0, indicating the key will never expire
      - verify your entered information
      - enter your user ID info (use the same information you provided for your GitHub account to make sure GitHub can match this GPG key to your GitHub account)
      - from GitHub:
        - When asked to enter your email address, ensure that you enter the verified email address for your GitHub account. To keep your email address private, use your GitHub-provided no-reply email address.
        - For more information, see "[Verifying your email address](https://help.github.com/en/articles/verifying-your-email-address)" and "[Setting your commit email address](https://help.github.com/en/articles/setting-your-commit-email-address)."
      - choose a secure passphrase
      - list GPG keys for which you have both a public and private key (private key required for signing commits or tags!)
        - `gpg --list-secret-keys --keyid-format LONG`
        - `gpg2 --list-secret-keys --keyid-format LONG` (if your system uses `gpg2`)
      - copy the GPG key ID you want to use from the list of GPG keys
        ```
        gpg --list-secret-keys --keyid-format LONG
        /Users/hubot/.gnupg/secring.gpg
        ------------------------------------
        sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
        uid                          Hubot 
        ssb   4096R/42B317FD4BA89E7A 2016-03-10
        ```
        - in this case, the GPG key ID is `3AA5C34371567BD2`
      - paste the key ID after `gpg --armor --export`
      - `gpg --armor --export 3AA5C34371567BD2 #Prints the GPG key ID, in ASCII armor format`
      - copy the GPG key, starting with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----`.
- [Add the new key to your GitHub account](https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account)
  - on GitHub:
    - click your profile photo > `Settings` > click `SSH and GPG keys` in user sidebar settings > click `New GPG key` > paste GPG key (taken from the last part of the previous step) into the `Key` field starting with `-----BEGIN PGP PUBLIC KEY BLOCK-----` and ending with `-----END PGP PUBLIC KEY BLOCK-----` > click `Add GPG key`
- [Tell Git about your GPG key](https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key)
  - open terminal
  - list the GPG keys that have both public and private keys using
    - `gpg --list-secret-keys --keyid-format LONG`
    - `gpg2 --list-secret-keys --keyid-format LONG` (for `gpg2`)
      - you should've already changed this earlier, but in case you missed it:
      `git config --global gpg.program $(which gpg2)`
  - copy the GPG key ID you want to use from the list of GPG keys
    ```
    gpg --list-secret-keys --keyid-format LONG
    /Users/hubot/.gnupg/secring.gpg
    ------------------------------------
    sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
    uid                          Hubot 
    ssb   4096R/42B317FD4BA89E7A 2016-03-10
    ```
    - in this case, the GPG key ID is `3AA5C34371567BD2`
  - enter the GPG key ID (substitute `3AA5C34371567BD2` with your own ID!!)
    - `git config --global user.signingkey 3AA5C34371567BD2`
    - If you aren't using the GPG suite, paste the text below to add the GPG key to your bash profile:
      - `test -r ~/.bash_profile && echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile`
        - NOTE: If you don't have `.bash_profile`, use the second command adds your GPG key to `.profile`.
      - `$ echo 'export GPG_TTY=$(tty)' >> ~/.profile`
    
- [Associating an email with your GPG key](https://help.github.com/en/github/authenticating-to-github/associating-an-email-with-your-gpg-key)
- [Signing commits](https://help.github.com/en/github/authenticating-to-github/signing-commits)
  - To configure your Git client to sign commits by default for a local repository, in Git versions 2.0.0 and above open terminal and navigate to your local repository, then enter:
    - `git config commit.gpgsign true`
    - To sign all commits by default in any local repository on your computer open terminal and enter:
      - `git config --global commit.gpgsign true`
  - add the `-S` flag to the git commit command when committing changes in your local branch and enter the passphrase you provided when creating the GPG key after entering your commit message
    - `git commit -S -m "your commit message" # Creates a signed commit`
    - push changes to your remote GitHub repository:
      - `git push origin yourBranch`
  - check to see your verified signature on GitHub by navigating to your pull request and clicking `Commits`
- [Signing tags](https://help.github.com/en/github/authenticating-to-github/signing-tags)
  - similar procedure as signing commits:
    - `git tag -s mytag #Creates a signed tag`
      - verify your tag is signed by running `git tag -v [tag-name]`
        - `git tag -v mytag #Verifies the signed tag`
- [Viewing your repository's tags](https://help.github.com/en/github/administering-a-repository/viewing-your-repositorys-tags)

## Troubleshooting
- [**GitHub Desktop: error: cannot run gpg: No such file or directory** #675](https://github.com/isaacs/github/issues/675) - GitHub Issues
- [Git error - gpg failed to sign data](https://stackoverflow.com/questions/41052538/git-error-gpg-failed-to-sign-data) - Stack Overflow
