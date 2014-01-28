#!/bin/bash

BASH_PROFILE=~/.bash_profile

PATH_TO_APPEND=( "PATH=/usr/local/bin:\$PATH" "export PATH" "export WORKON_HOME=~/.virtualenvs" "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python" "source /usr/local/bin/virtualenvwrapper.sh" )

FONTS=~/.vim/fonts/*
FONTS_PATH=~/Library/Fonts

command_exists () {
    type "$1" &> /dev/null ;
}

if command_exists pip; then
    echo "Install flake8, jedi, virtualenv and virtualenvwrapper..."
    pip install flake8
    pip install jedi
    pip install virtualenvwrapper
else
    echo "You do not have pip"
    echo "You should install python using homebrew"
fi

if command_exists brew; then
    echo "Installing node.js..."
    brew install node
else
    echo "could not install node"
    echo "install homebrew first"
fi


if [ ! -f "$BASH_PROFILE" ]; then
    echo "Creating $BASH_PROFILE""..."
    touch "$BASH_PROFILE"
fi

for i in "${PATH_TO_APPEND[@]}"; do
    if grep -q "$i" "$BASH_PROFILE"; then
        continue
    else
        echo "Appending $i to $BASH_PROFILE"
        echo $i >> "$BASH_PROFILE"
    fi
done

for f in $FONTS; do
    fullname="$FONTS_DIR"$(basename "$f")
    if [ ! -f "$fullname" ]; then
        cp "$f" "$FONTS_PATH"
    fi
done

#echo "export PATH" >> ~/.bash_profile
#echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_profile
#echo "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python" >> ~/.bash_profile
#echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile
#endif
