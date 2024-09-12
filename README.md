# Dotfiles

Opinionated dotfiles for seasoned developers who value efficiency and customization.

## Overview

This repository contains a curated set of dotfiles optimized for a Unix-based development environment. It's designed to be modular, allowing you to cherry-pick configurations as needed.

## Current Contents

- `.zshrc`: Zsh configuration with Oh My Zsh integration

## Quick Start

For those who like to live dangerously:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh  # To be implemented
```

## Manual Integration

Symlink the desired configurations:

```bash
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
```

## Key Features

### Zsh Configuration (.zshrc)

- Oh My Zsh with custom theme
- Optimized aliases for git, ls, and kubectl
- Custom functions for enhanced workflow
- fzf integration for fuzzy finding
- NVM and Google Cloud SDK setup
- Go environment configuration

## Customization

The dotfiles are extensively commented. Tailor them to your workflow by editing the relevant files directly.

## Adding New Dotfiles

1. Add the dotfile to the repository
2. Update `install.sh` to handle the new file
3. Document the addition in this README

## Contributing

Contributions are welcome. Please adhere to these guidelines:
- Use descriptive commit messages
- Follow the existing code style
- Add comments for non-obvious configurations

## License

MIT

## Acknowledgments

This project stands on the shoulders of giants. A tip of the hat to:
- [Oh My Zsh](https://ohmyz.sh/)
- [eza](https://github.com/eza-community/eza)
- [fzf](https://github.com/junegunn/fzf)

## TODO

- Implement `install.sh`
- Add Vim/Neovim configurations
- Include Tmux setup
- Dockerize for easy testing and deployment
Ellograph CF Heavy
