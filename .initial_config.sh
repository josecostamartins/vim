#!/bin/bash

BASH_PROFILE=~/.bash_profile

STRING_TO_APPEND=( "PATH=/usr/local/bin:$PATH" "export PATH" "export WORKON_HOME=~/.virtualenvs" "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python" "source /usr/local/bin/virtualenvwrapper.sh" )

FONTS=~/.vim/fonts/*
FONTS_PATH=~/Library/Fonts

command_exists () {
    type "$1" &> /dev/null ;
}

if command_exists pip; then
    pip install flake8
    pip install jedi
    pip install virtualenvwrapper
else
    echo "You do not have pip"
    echo "You should install python using homebrew"
fi

if [ ! -f "$BASH_PROFILE" ]; then 
    touch "$BASH_PROFILE" 
fi

for i in "${STRING_TO_APPEND[@]}"; do
    if grep -q "$i" "$BASH_PROFILE"; then
        continue
    else
        echo "Writing $i to $BASH_PROFILE"
        echo $i >> "$BASH_PROFILE"
    fi
done

for f in $FONTS; do 
    fullname="$FONTS_DIR"$(basename "$f")
    if [ ! -f "$fullname" ]; then 
        cp "$fi" "$FONTS_PATH"
    fi
done

#echo "export PATH" >> ~/.bash_profile
#echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_profile
#echo "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python" >> ~/.bash_profile
#echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile
#endif

