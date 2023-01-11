#!/bin/bash

# Below is a script used at Ada to install needed software and some optional packages (Firefox Chrome etc).

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ $(uname -m) == arm64 ]
then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Then install python
brew install python

# Make it run Python3 when the user types "python"
echo "alias python=python3" >> ~/.zshrc
echo "alias python=python3" >> ~/.profile

# Make it run pip3 when the user types "pip"
echo "alias pip=pip3" >> ~/.zshrc
echo "alias pip=pip3" >> ~/.profile

# Get the updated path for homebrew
source ~/.zshrc
source ~/.profile

# Set up git
brew install git

# Read in their name & email address
echo ""
IFS= read -r -p "Enter your name: " studentname

echo ""
echo "Please enter the email address you use with github"
read studentemail

git config --global user.name "$studentname"
git config --global user.email "$studentemail"
git config --global core.ignorecase false
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global push.default current
git config --global pull.rebase false
git config --global core.editor "code --wait"

echo "Verification:  This should print your name and email"
git config --get user.name
git config --get user.email

# Install Node
brew install node

# Install VS Code
echo "Would you like me to install VS Code? Y/N"
read yesno
if [ $yesno = "Y" ] || [ $yesno = "y" ]
then
  brew install --cask visual-studio-code
fi

# Install Firefox & Chrome
echo "Would you like me to install Firefox? Y/N"
read yesno
if [ $yesno = "Y" ] || [ $yesno = "y" ]
then
  brew install --cask firefox
fi

echo "Would you like me to install Google Chrome? Y/N"
read yesno
if [ $yesno = "Y" ] || [ $yesno = "y" ]
then
  brew install --cask google-chrome
fi

# Install Slack
echo "Would you like me to install Slack for Mac? Y/N"
read yesno
if [ $yesno = "Y" ] || [ $yesno = "y" ]
then
  brew install --cask slack
fi

echo "Installation complete!"

exit