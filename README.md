vim
====
My personal vim configuration, i mainly use vim for django and python programming nowadays. Other languages, like PHP, C, etc., might be added in the future, case i need them.

DISCLAIMER: still in it's early ages

> Installation:
> git clone https://github.com/josecostamartins/vim ~/.vim
> ln -s ~/.vim/vimrc ~/.vimrc

Requirements
---
* You need to have **sudo privileges**.
* You need pip \>= 1.4 (you should be fine if you're not using ubuntu 12.04)
* If you use a mac you need homebrew

There is script located in "vim/initial\_config.sh" that automatically installs vim, python, pip, virtualenv, virtualenvwrapper

** MY SCRIPT DOES NOT WORK ON WINDOWS **

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

### Python Specific:
* davidhalter/jedi-vim for python autocompletion
* jmcantrell/vim-virtualenv for using python virtualenv inside vim (great for virtual packages completion, like django)
* vim-pony for Django Commands (installed but not used, i use iTerm for django stuff)

### HTML:
* mattn/emmet-vim for crazy completion of html syntax (this is great if you do a lot of html)

### Latex:
* LaTeX-Box-Team/LaTeX-Box for latex support on vim (still needs to install mactex)

### Themes:
* altercation/vim-colors-solarized theme for mac vim (installed but not used)
* wombat256mod theme for terminal vim (installed but not used)
* michalbachowski/vim-wombat256mod theme (installed but not used)
* sickill/vim-monokai theme (default)


Also, i auto-install vundle by using this tip:
http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/

Using flake8 for python static syntax checking

