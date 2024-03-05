# Schellchemy
Utility functions to run multiple commands at once for Z Shell and Bash. 

## Basic Installation
1. Clone this repository to any path. Take note of the path where you cloned it using the `pwd` command.
    ```
    $ cd shellchemy && pwd
    /Users/myuser/shellchemy
    ```
2. Open your favorite text editor and access your shell configuration file. Depending on your OS and shell, the file's name can be `~/.bashrc`, `~/.zprofile`, `~/.bash_profile`, `.profile`, etc.
3. Add the following line at the end of the file to execute shellchemy. Ensure the source path is the same as in step 1, followed by `/index`.
    ```
    source /Users/myuser/shellchemy/index
    ```
4. Open a new terminal to apply your changes.

<br>

## Additional features
### Prompt theme
Add the following line to execute the theme **after** the the line executing shellchemy.
```
source /Users/myuser/shellchemy/shellchemy
```
### Jira
Add the line with the organization name variable **before** the line executing shellchemy. If the Jira URL is `https://myorganization.atlassian.net/`, then the value should be `'myorganization'`.
```
BP_JIRA_ORGANIZATION='myorganization'
```
### Node Version Manager
If you lack permissions to add `.nvmrc` files and need to work with different versions of Node in every repository, you can use the `cdnvm` function. Define custom aliases to change directory and use the desired version.
```
alias cdrepo1="cdnvm /Users/myuser/myorganization/repo1 10.13";
alias cdrepo2="cdnvm /Users/myuser/myorganization/repo2 16";
```

<br>

## Shell configuration file example
Assuming you install shellchemy with all the additional features, your shell configuration file should look something like this:
```
BP_JIRA_ORGANIZATION='myorganization'
source /Users/myuser/shellchemy/index
source /Users/myuser/shellchemy/shellchemy

alias cdrepo1="cdnvm /Users/myuser/myorganization/repo1 10.13";
alias cdrepo2="cdnvm /Users/myuser/myorganization/repo2 16";
```

## Common issues
### command not found: ^M
Perhaps you clonned the repository with `autocrlf` enabled. You can disabled it in your `~/.gitconfig` file or run
```
git config --global core.autocrlf false
```
If you need to keep `autocrlf` enabled, you can explore the [Github issue in ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/issues/1363) for more options.