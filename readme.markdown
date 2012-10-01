# Turn on Git's AutoCorrect Feature
This option is available only in Git 1.6.1 and later. If you mistype a command in Git 1.6, it shows you something like this:

    cmd> git com
    git: 'com' is not a git-command. See 'git --help'.

    Did you mean this?
         commit

If you set `help.autocorrect` to 1, Git will automatically run the command if it has only one match under this scenario.

    cmd> git config --global help.autocorrect 1
