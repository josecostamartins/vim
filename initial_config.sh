#!/bin/bash

FONTS=~/.vim/fonts/*
SO="none"
MINPIP_VERSION=1.4


########################################################################
#                                                                      #
#             Checking for permissions and prerequisits                #
#                                                                      #
########################################################################

#utility function to check if some components are installed
command_exists () {
    type "$1" &> /dev/null ;
}

# check if current user can use sudo, it is necessary to install pip
# and other stuff
has_root_access=$(sudo -n uptime 2>&1|grep "load"|wc -l)
if [ ${has_root_access} -gt 0 ]; then
    echo "OK, you have sudo permissions"
else
    echo "You need sudo permission to run this file"
    exit 1
fi

if [ "$(uname)" == "Darwin" ]; then
    SO="mac"
    PATH_TO_APPEND=( "PATH=/usr/local/bin:\$PATH" "export PATH" "export WORKON_HOME=~/.virtualenvs" "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python" "source /usr/local/bin/virtualenvwrapper.sh" )
    
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    SO="linux"
    PATH_TO_APPEND=( "PATH=/usr/local/bin:\$PATH" "export PATH" "export WORKON_HOME=~/.virtualenvs" "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python" "source /usr/local/bin/virtualenvwrapper.sh" )
else
    echo "This script only works on Mac OS X and Linux Distributions"
    echo "Exiting..."
    exit 1
fi


if [ "$SO" == "mac" ]; then
    if command_exists brew; then
        echo "OK, you have homebrew installed"
    else
        echo "You do not have homebrew installed, please install it"
        exit 1
    fi
fi

if command_exists pip; then
    echo "OK, you have pip installed"
    SYSPIP_VERSION=$(pip --version | awk '{ split($2,a,"."); print a[1]"."a[2]; }')
    comp=$(echo $SYSPIP_VERSION '>=' $MINPIP_VERSION | bc -l)
    if [ $comp -gt 0 ]; then
        echo "OK, you have pip >= 1.4"
    else
        echo "You do not have pip >= 1.4, please upgrade"
        echo "exiting..."
        exit 1
    fi
fi

########################################################################
#                                                                      #
#                Set some paths and install dependencies               #
#                                                                      #
########################################################################

if [ "$SO" == "mac" ]; then

    echo "Installing vim configurations for Mac OS X"

    BASH_PROFILE=~/.bash_profile
    FONTS_PATH=~/Library/Fonts
    pip install flake8
    pip install jedi
    pip install virtualenv
    pip install virtualenvwrapper
    brew install node
elif [ "$SO" == "linux" ]; then

    echo "Installing vim configurations for Linux"

    BASH_PROFILE=~/.bashrc
    FONTS_PATH=~/.fonts
    sudo apt-get install vim
    sudo apt-get install python-pip python-dev build-essential
    sudo pip install flake8
    sudo pip install jedi
    sudo pip install virtualenv
    sudo pip install virtualenvwrapper
    sudo apt-get install node
else
    echo "Unfortunately, this script only works under Mac OS X or Linux"
    exit 1
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
    fullname="$FONTS_PATH"$(basename "$f")
    if [ ! -f "$fullname" ]; then
        cp "$f" "$FONTS_PATH"
    fi
done

#echo "export PATH" >> ~/.bash_profile
#echo "export WORKON_HOME=~/.virtualenvs" >> ~/.bash_profile
#echo "export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python" >> ~/.bash_profile
#echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile
#endif
