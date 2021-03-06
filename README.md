vim
====
My personal vim configuration, i mainly use vim for django and python programming nowadays. Other languages, like PHP, C, etc., might be added in the future, case i need them.

DISCLAIMER: still in it's early ages

> Installation:

> git clone https://github.com/josecostamartins/vim ~/.vim

> ln -s ~/.vim/vimrc ~/.vimrc

> vim [filename]

This will clone my vim repository to ~/.vim (which is a hidden folder inside the user's home folder), then with "ln -s" we will create a symbolic link (A.K.A. symlink), the full installation is triggered when opening vim. This installation process only occurs the first time you open vim. If something goes wrong with the installation process, you can reinstall everything by executing ~/.vim/initial_config.sh.


Requirements
---
* You need to have **sudo privileges**.
* You need pip \>= 1.4 (you should be fine if you're not using ubuntu 12.04)
* If you use a mac you need homebrew

There is a script named **initial\_config.sh**.
This script is responsible for automatically installing:
* vim
* python
* pip
* virtualenv
* virtualenvwrapper

and it writes the necessary paths to .bashrc or .bashprofile

**MY SCRIPT DOES NOT WORK ON WINDOWS**

Plugins:
---

### General Purpose:
* gmarick/vundle for plugin management
* bling/airline for status line revamped
* scrooloose/nercommenter for easy commenting of code (i usually use leader c space that toggles comments)
* scrooloose/syntastic for syntax checking, this is one of the best things someone created for vim (just use it).
* Yggdroot/indentLine indentation lines for easy visualization, specially in python and html
* vim-indent-guides for visual indentation (didn't work on my macvim nor on terminal vim, so it's commented and not installed)
* ervandew/supertab for tab completion (press tab to enable possible completions)
* SirVer/ultisnips for code snippets
* tpope/vim-surround for helping on the manipulation of surrounding tags (e.g \<\>, \{\}, \(\) )
* godlygeek/tabular to easily tabularize data, great when doing data analisys
* control-P for finding files with fuzzy logic

### Python Specific:
* davidhalter/jedi-vim for python autocompletion
* jmcantrell/vim-virtualenv for using python virtualenv inside vim (great for virtual packages completion, like django)
* vim-pony for Django Commands (installed but not used, i use iTerm for django stuff)
* django.vim for django templates highlight

### HTML:
* mattn/emmet-vim for crazy completion of html syntax (this is great if you do a lot of html)

### Latex:
* LaTeX-Box-Team/LaTeX-Box for latex support on vim (still needs to install mactex)

### Themes:
* altercation/vim-colors-solarized theme for mac vim (installed but not used)
* wombat256mod theme (installed but not used)
* wombat256 original theme
* michalbachowski/vim-wombat256mod theme (installed but not used)
* sickill/vim-monokai theme (default)


Also, i auto-install vundle by using this tip:
http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/

Using flake8 for python static syntax checking

