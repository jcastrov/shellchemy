# bash-scripts

Utility functions to run multiple commands at once. 

## Optional global variables:
**`BP_JIRA_ORGANIZATION`:** Subdomain of the JIRA URL. If the URL is `https://myorganization.atlassian.net/`, then the value should be `'myorganization'`

## How to use them
1. Clone this repo.
2. On your `~/.bashrc`, or `~/.zprofile` files, add the following lines (Let's assume you cloned this repository in your $HOME directory):
    ```
    BP_JIRA_ORGANIZATION='myorganization'
    source ~/bash_scripts/index
    ```
3. If you want to change the appearance of your shell prompt, add this line below the lines you added.
    ```
    source ~/bash_scripts/prompt"
    ```
3. Restart your terminal.

## Common issues
### command not found: ^M
You clonned the repository with `autocrlf` enabled. You can disabled it in your `~/.gitconfig` file or run
```
git config --global core.autocrlf false
```
If you need to keep `autocrlf` enabled, you can explore the [Github issue in ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/issues/1363) for more options.