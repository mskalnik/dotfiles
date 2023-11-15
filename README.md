# Dotfiles

This repository contains my personal dotfiles and configuration files for macOS. These dotfiles help me customize and
streamline my macOS environment to suit my preferences and workflow

## Getting Started

Before using these dotfiles, please make sure you have the following prerequisites installed on your macOS system:

1. **Homebrew**: If you haven't already installed Homebrew, you can do so by running the following command in your
terminal:

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. **Git**: Ensure Git is installed on your system. You can install it using Homebrew:

```shell
brew install git
```

## Installation

To set up these dotfiles on your macOS system, follow these steps:

1. Clone this repository to your local machine:

```shell
git clone https://github.com/mskalnik/dotfiles.git ~/dotfiles
```

2. Navigate the dotfiles folder:

```shell
cd ~/dotfiles
```

3. Run the installation script to set up the dotfiles:

```shell
./install.sh
```

The installation script will create symbolic links for the configuration files in your home directory, pointing to the
corresponding files in the dotfiles repository.

Feel free to explore and modify these dotfiles to better suit your own needs and preferences. Keep in mind that these
configurations are tailored to my specific setup, and while they can serve as a great starting point for your
customization journey, your unique requirements might differ. If you encounter any issues or have suggestions for
improvements, don't hesitate to contribute or reach out.
