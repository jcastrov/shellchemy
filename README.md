# Shellchemy

A utility library for running multiple commands efficiently in Z Shell and Bash environments.

## Features

- **Command Orchestration**: Run multiple commands simultaneously with ease
- **Enhanced Prompt**: Customizable shell prompt (optional)
- **Jira Integration**: Quick access to Jira tickets
- **Node Version Management**: Seamless Node.js version switching with `cdnvm`
- **Square Icon Generator**: Easily create a square icon using a single command
- **Cross-shell Compatibility**: Works with both Z Shell and Bash

## Installation

1. Navigate to your desired installation directory (Let's use `$HOME` for example):
   ```bash
   cd ~
   ```

2. Run the installation command:
   ```bash
   n=shellchemy; f=$n.zip && \
   curl -sL $(
   curl -s https://api.github.com/repos/jcastrov/$n/releases/latest \
       | grep "browser_download_url" | grep "$f" | cut -d '"' -f 4
   ) -o "$f" && \
   unzip -q "$f" && \
   rm "$f" && \
   printf '%.0s-' {1..40}; echo && \
   echo -e "\033[32msource $PWD/$n/index\nsource $PWD/$n/prompt\033[0m"
   ```

3. **Successful installation** will display two green lines:
   - `source /path/to/shellchemy/index` - Core utility functions
   - `source /path/to/shellchemy/prompt` - Enhanced prompt (optional)

4. Add the desired lines to your shell configuration file:
   - **Bash**: `~/.bashrc` or `~/.bash_profile`
   - **Z Shell**: `~/.zshrc` or `~/.zprofile`
   - **Universal**: `~/.profile`

5. Reload your shell or start a new terminal session.

## Configuration

### Jira Integration

To enable Jira ticket functionality, set your organization name **before** sourcing Shellchemy:

```bash
SHELLCHEMY_JIRA_ORGANIZATION='myorganization'
source /path/to/shellchemy/index
```

*Example*: If your Jira URL is `https://mycompany.atlassian.net/`, use `'mycompany'`

### Node Version Manager

For projects requiring specific Node.js versions without `.nvmrc` files:

```bash
alias cdproject1="cdnvm /path/to/project1 18.12"
alias cdproject2="cdnvm /path/to/project2 16.15"
```

This automatically switches to the specified Node version when changing directories.

## Complete Configuration Example

```bash
# Shellchemy Configuration
SHELLCHEMY_JIRA_ORGANIZATION='mycompany'

# Core functionality
source /Users/username/shellchemy/index

# Enhanced prompt (optional)
source /Users/username/shellchemy/prompt

# Project-specific Node versions
alias cdapi="cdnvm /Projects/api 18.12"
alias cdweb="cdnvm /Projects/web 16.15"
alias cdmobile="cdnvm /Projects/mobile 14.20"
```

## Troubleshooting

### "command not found: ^M" Error

This typically occurs when repository files have Windows-style line endings.

**Solution 1: Disable autocrlf globally**
```bash
git config --global core.autocrlf false
```

**Solution 2: Convert existing files**
```bash
# Remove shelchemy
rm -rf shellchemy
# Re-run installation with autocrlf disabled
```

For more options, refer to the [Oh My Zsh related issue](https://github.com/ohmyzsh/ohmyzsh/issues/1363).

## Support

- **Shell Compatibility**: Z Shell (zsh) 5.0+, Bash 4.0+
- **Platforms**: macOS, Linux, Windows (WSL)

---

*Shellchemy - Streamline your shell workflow*