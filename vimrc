"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif


" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My bundles here:

""""""""""""""""""""""""""""
" original repos on GitHub "
""""""""""""""""""""""""""""
"solarized theme
Bundle 'altercation/vim-colors-solarized'
"status line revamped
Bundle 'bling/vim-airline'
"python autocompletion
Bundle 'davidhalter/jedi-vim'
"minibuffer explorer, help managing buffers
Bundle 'fholgado/minibufexpl.vim'
"easily use a virtualenv
Bundle 'jmcantrell/vim-virtualenv'
"file explorer
Bundle 'scrooloose/nerdtree'
"syntax checker for many languages
Bundle 'scrooloose/syntastic'
"Django Commands
Bundle 'jmcomets/vim-pony'
"Bundle 'cwood/vim-jango'
"Wombat256 coloscheme
Bundle 'vim-scripts/wombat256.vim'

"""""""""""""""""""""
" vim-scripts repos "
"""""""""""""""""""""
" open files easily by pressing ctrl+p and typing the filename
Bundle 'ctrlp.vim'
" django template highlight
Bundle 'django.vim'

""""""""""""""""""""
" non-GitHub repos "
""""""""""""""""""""

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
set t_Co=256 " force console to have 256 colors
syntax enable
set background=light
color slate
if has("gui_running")
  colorscheme solarized
endif
" let g:solarized_termtrans = 1
" solarized options
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" if has('gui_running')
    " if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        "let g:solarized_termcolors=256
       " let g:solarized_termtrans=1
       " let g:solarized_contrast="normal"
       " let g:solarized_visibility="normal"
       " color solarized             " Load a colorscheme
       " color wombat256mod
   "  endif
" else
"    let g:solarized_termcolors = 256 | 16
"    let g:solarized_termtrans=1
"    let g:solarized_contrast="normal"
"    let g:solarized_visibility="normal"
"    color solarized
" endif

" colorscheme solarized
" colorscheme desert

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noshowmode " hide original status line because of airline
set laststatus=2 " always show statusline, needed in order to display airline
set guifont=Sauce\ Code\ Powerline\ for\ Powerline:h13

let g:airline_theme = 'murmur'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_powerline_fonts')
    " Use the default set of separators with a few customizations
    let airline_left_sep = '>'
    let g:airline_right_sep = '<'
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-django configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:django_projects = '~/Documents/Projects'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 set autoindent                                             "auto indentation
 set autoread                                               " reload files when changed on disk, i.e. via `git checkout`
 set backspace=2                                            " Fix broken backspace in some setups
 set backupcopy=yes                                         " see :help crontab
 set clipboard=unnamed                                      " yank and paste with the system clipboard
 set directory-=.                                           " don't store swapfiles in the current directory
 set encoding=utf-8
 set expandtab                                              " expand tabs to spaces
 set hidden
 set ignorecase                                             " case-insensitive search
 set incsearch                                              " search as you type
 set laststatus=2                                           " always show statusline
 set list                                                   " show trailing whitespace
 set listchars=tab:▸\ ,trail:▫
 set nobackup
 set noswapfile                                             " do not create a swap file
 set number                                                 " show line numbers
 set ruler                                                  " show where you are
 set scrolloff=3                                            " show context above/below cursorline
 set shiftwidth=4                                           " normal mode indentation commands use 4 spaces
 set showcmd
 set smartcase                                              " case-sensitive search if any caps
 set splitbelow                  " Puts new split windows to the bottom of the current
 set splitright                  " Puts new vsplit windows to the right of the current
 set tabstop=4
 set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
 set wildmenu                                                 " show a navigable menu for tab completion
 set wildmode=longest,list,full
 set pastetoggle=<F2> " enter in paste mode
 set clipboard=unnamed " accepts pasting from the system, not only from vim to vim
 set mouse=a " allows the usage of a mouse with vim

 set ttimeoutlen=50 " set a timeout, this makes moving in and out of Insert Mode quicker

 set hidden                      " manage tabs like other editors

 " keep selection after shifting it
 vnoremap < <gv
 vnoremap > >gv

 " autocmd! bufwritepost .vimrc source % " auto reload .vimrc file
 autocmd BufWritePre .vimrc,*.py,*.html :%s/\s\+$//e " remove trailing whitespaces


 " map sort function to a key
 vnoremap <leader>s :sort<CR>

 " Allows to use different shortcuts, the default leader key is \
 let mapleader = ","
 map <D-S-left> :tabprevious<CR>
 map <D-S-right> :tabnext<CR>
 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l
 map <C-left> <C-w>h
 map <C-down> <C-w>j
 map <C-up> <C-w>k
 map <C-right> <C-w>l

 map <S-up> :m-2<CR>
 map <S-down> :m+1<CR>

 " Syntastic configuration for python
 let g:syntastic_python_checkers = ['flake8']

 " Django configuration
 "
 "let g:django_projects = '~/Documents/Projects/' "Sets all projects under project
 "let g:django_project_directory = '~/Documents/Projects/'
 " let g:django_project_container = 'source' "Inside of these folders look for source
 "let g:django_activate_virtualenv = 0 "Try to activate the associated virtualenv
 "let g:django_activate_nerdtree = 0 "Try to open nerdtree at the project root.

 "ctrlp configuration

 "start ctrlp in the current folder
 let g:ctrlp_working_path_mode = 'a'

 " let g:ctrlp_working_path_mode = 0

 " tab navigation
 "nmap tn :tabn<CR>
 "nmap tp :tabp<CR>
 "nmap tm :tabm
 "nmap tt :tabnew
 "nmap ts :tab split<CR>

 " minibufexpl toggle
 map <Leader>t :MBEToggle<cr>

 noremap <C-TAB>   :MBEbn<CR>
 noremap <C-S-TAB> :MBEbp<CR>


 " NERDTree (better file browser) toggle
 " map <leader>t :NERDTreeToggle<CR>

 " Ignore files on NERDTree
 " let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

 " Set autocomplete form
 "set completeopt=menuone,longest

 "--- python formatting help ---
 autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

 " Enable omni completion.
 "autocmd FileType css set omnifunc=csscomplete#CompleteCSS
 "autocmd FileType html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
 "autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
 "autocmd FileType python set omnifunc=pythoncomplete#Complete
 "autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
 "autocmd FileType php,ctp set omnifunc=phpcomplete#CompletePHP
 "autocmd FileType vim set omnifunc=syntaxcomplete#Complete

 " remaping the save to ctrl-z
 noremap <C-Z> :update<CR>
 vnoremap <C-Z> <C-C> :update<CR>
 inoremap <C-Z> <C-O> :update<CR>

 " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
 "if executable('ag')
 "  let g:ackprg = 'ag --nogroup --column'

   " Use Ag over Grep
 "  set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
 "  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 "endif

 " maps the command ,-shift-v to source my vimrc, maybe this is not needed
 map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
