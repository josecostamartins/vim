"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting up Vundle - the vim plugin bundler {
    let iCanHazVundle=1
    let plugin_manager=expand('~/.vim/autoload/plug.vim')
    let init_conf=expand('~/.vim/initial_config.sh')
    if !filereadable(plugin_manager)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        if filereadable(init_conf)
            silent ! ~/.vim/initial_config.sh
        endif
        let iCanHazVundle=0
    endif
" }
set nocompatible              " be iMproved
filetype off                  " required!

"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()



" let Vundle manage Vundle
" required!
"Plug 'gmarik/vundle'
"Plug 'VundleVim/Vundle.vim'

" My bundles here:

""""""""""""""""""""""""""""
" original repos on GitHub "
""""""""""""""""""""""""""""
" solarized theme
Plug 'altercation/vim-colors-solarized'

" status line revamped
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" python autocompletion
Plug 'davidhalter/jedi-vim'

" apparently youcompleteme better than jedi-vim, lets testit
"Plug 'Valloric/YouCompleteMe'

" minibuffer explorer, help managing buffers
"Plug 'fholgado/minibufexpl.vim'

" Virtualenv commands inside vim
Plug 'jmcantrell/vim-virtualenv'

" file explorer
"Plug 'scrooloose/nerdtree'

" Comment more easily
Plug 'scrooloose/nerdcommenter'

" syntax checker for many languages
Plug 'scrooloose/syntastic'

" Django Commands
Plug 'jmcomets/vim-pony'
" Plug 'cwood/vim-jango'

" html crazy completion
Plug 'mattn/emmet-vim'

" Latex plugin
Plug 'LaTeX-Box-Team/LaTeX-Box'

" Creates indentations guides within text
Plug 'Yggdroot/indentLine'

" Lets me use <tab> instead of <c-space> for completion
" Bonus for using jedi when filetype is python
Plug 'ervandew/supertab'

" UtilSnips for snippets, apparently it's awesome
Plug 'SirVer/ultisnips'

" wombat modified colorscheme
Plug 'michalbachowski/vim-wombat256mod'

" monokai theme
Plug 'sickill/vim-monokai'

" manipulate surroundings
Plug 'tpope/vim-surround'

" tabularization of csv data
Plug 'godlygeek/tabular'

" swift support
Plug 'keith/swift.vim'

"""""""""""""""""""""
" vim-scripts repos "
"""""""""""""""""""""
" open files easily by pressing ctrl+p and typing the filename
Plug 'ctrlpvim/ctrlp'

" django template highlight
" use :setfiletype htmldjango on django template files to get the highlight
"Plug 'django.vim'

"Wombat256 coloscheme
Plug '/vim-scripts/wombat256'

""""""""""""""""""""
" non-GitHub repos "
""""""""""""""""""""


"""""""""""""""""""""""""""""""""
" First time install for vundle "
"""""""""""""""""""""""""""""""""
if iCanHazVundle == 0
    echo "Installing Plugs, please ignore key map error messages"
    echo ""
    :PlugInstall
endif

call plug#end()            " required
filetype plugin indent on     " required!
"
" Brief help
" :PlugList          - list configured bundles
" :PlugInstall(!)    - install (update) bundles
" :PlugSearch(!) foo - search (or refresh cache first) for foo
" :PlugClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plug commands are not allowed.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
set t_Co=256 " force console to have 256 colors
syntax enable
set background=dark
"colorscheme wombat256mod
color monokai
if has("gui_running")
    colorscheme monokai
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
set guifont=Hack:h14
"set guifont=Source\ Code\ Pro\ for\ Powerline:h14
"set guifont=Monaco\ For\ Powerline
"set guifont=Menlo\ For\ Powerline
"set guifont=Liberation\ Mono\ For\ Powerline:h13

let g:airline_theme = 'powerlineish'
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
"set scrolloff=3                                            " show context above/below cursorline
set autoindent                                             "auto indentation
set autoread                                               " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                            " Fix broken backspace in some setups
set backupcopy=yes                                         " see :help crontab
set clipboard=unnamed                                      " yank and paste with the system clipboard
set colorcolumn=+1                                         " highlight column number textwidth+1, in my case column 80, to show the limit
set directory-=.                                           " don't store swapfiles in the current directory
set encoding=utf-8                                         " set ytf-8 as the default encoding
set expandtab                                              " expand tabs to spaces
set fo-=t                                                  " don't automatically wrap text when typing
set hidden                                                 " manage tabs like other editors
set ignorecase                                             " case-insensitive search
set incsearch                                              " search as you type
set laststatus=2                                           " always show statusline
set list                                                   " show trailing whitespace
set listchars=tab:▸\ ,trail:▫                              " show tabs and trailing spaces
set mouse=a                                                " allows the usage of a mouse with vim
set nobackup                                               " do not make backup of files
set noswapfile                                             " do not create a swap file
set nowrap                                                 " don't automatically wrap on load
set number                                                 " show line numbers
set pastetoggle=<F2>                                       " enter in paste mode
set ruler                                                  " show where you are
set shiftwidth=4                                           " normal mode indentation commands use 4 spaces
set showcmd                                                " show the command you are typing, if on mac this is the default
set smartcase                                              " case-sensitive search if any caps
set splitbelow                                             " Puts new split windows to the bottom of the current
set splitright                                             " Puts new vsplit windows to the right of the current
set tabstop=4                                              " Set a tab to be 4 whitespaces
set textwidth=79                                           " Limit size of line to 79 characters, python recommended
set ttimeoutlen=50                                         " set a timeout, this makes moving in and out of Insert Mode quicker
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                               " show a navigable menu for tab completion
set wildmode=longest,list,full


" folding settings {
    set foldmethod=indent   "fold based on indent
    set foldnestmax=10     "deepest fold is 10 levels
    set nofoldenable        "dont fold by default
    set foldlevel=1         "this is just what i use
" }


" keep selection after shifting it
vnoremap < <gv
vnoremap > >gv

autocmd BufWritePre .vimrc,*.py,*.html,*.tex,*.js,*.css :%s/\s\+$//e " remove trailing whitespaces
autocmd! bufwritepost .vimrc source % " auto reload .vimrc file

" YouCompleteMe {
let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
let g:ycm_filetype_blacklist = {
    \ 'python' : 1,
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'mail' : 1
\}
" }


" jedi-vim {
    "let g:jedi#auto_vim_configuration = 0
    "let g:jedi#popup_on_dot = 0
    "let g:jedi#popup_select_first = 0
    "let g:jedi#completions_enabled = 0
    "let g:jedi#completions_command = ""
    "let g:jedi#show_call_signatures = "1"

    let g:jedi#goto_assignments_command = "<leader>goa"
    let g:jedi#goto_definitions_command = "<leader>god"
    let g:jedi#documentation_command = "<leader>doc"
    let g:jedi#usages_command = "<leader>use"
    let g:jedi#rename_command = "<leader>ren"
" }


" mappings {
    let mapleader = ","                                    " Allows to use different shortcuts, the default leader key is \

    " change tabs by pressing command-shift-left or command-shift-right
    map <D-S-left> :tabprevious<CR>
    map <D-S-right> :tabnext<CR>

    " simplify changing buffers
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

    " also allow to change buffers using arrow keys
    map <C-left> <C-w>h
    map <C-down> <C-w>j
    map <C-up> <C-w>k
    map <C-right> <C-w>l

    " Swap lines up and down by pression shift-up or shift-down
    map <S-up> :m-2<CR>
    map <S-down> :m+1<CR>

    " Save file by pressing ctrl-s
    noremap  <silent> <C-S>  :update<CR>
    inoremap <silent> <C-S>  <C-C>:update<CR>i
    vnoremap <silent> <C-S>  <C-O>:update<CR>gv

    " map sort function to a key
    vnoremap <leader>s :sort<CR>

    " force circumflex to go to first non-blak character of the line
    "nnoremap ^ 0w

    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
" }

" Syntastic configuration for python {
    let g:syntastic_python_checkers = ['flake8', 'pylint']
    let g:syntastic_python_flake8_args='--ignore=E126,E128,E124,E123,E221'
    let g:syntastic_python_pylint_args="--indent-string='    '"
" }

" LaTeX-Box Configuration {
    let g:LatexBox_latexmk_options = "-pdf -pvc"
    let g:LatexBox_latexmk_async=1
    let g:LatexBox_latexmk_preview_continuously=1
    let g:LatexBox_autojump = 1
" }

" indent guidelines {
    set list lcs=tab:\|\
" }
"
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" SuperTab configuration {
    let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    "let g:SuperTabDefaultCompletionType = "<c-n>"
" }


" Emmet configuration{
    " emmet-vim integration with ultisnips
    "let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
    let g:user_emmet_mode='a'    "enable all function in all mode.
    " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" }

" Django configuration {
    "let g:django_projects = '~/Documents/Projects/' "Sets all projects under project
    "let g:django_project_directory = '~/Documents/Projects/'
    " let g:django_project_container = 'source' "Inside of these folders look for source
    "let g:django_activate_virtualenv = 0 "Try to activate the associated virtualenv
    "let g:django_activate_nerdtree = 0 "Try to open nerdtree at the project root.
" }

"ctrlp configuration {
    "start ctrlp in the current folder
    let g:ctrlp_working_path_mode = 'a'
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc)$'
    " let g:ctrlp_working_path_mode = 0
"}

" tab navigation {
    "nmap tn :tabn<CR>
    "nmap tp :tabp<CR>
    "nmap tm :tabm
    "nmap tt :tabnew
    "nmap ts :tab split<CR>
"}

" Mini Buffer Explorer {
    " minibufexpl toggle
    " map <Leader>t :MBEToggle<cr>

    " noremap <C-TAB>   :MBEbn<CR>
    " noremap <C-S-TAB> :MBEbp<CR>
"}

"  NERDTree {
    " NERDTree (better file browser) toggle
    " map <leader>t :NERDTreeToggle<CR>

    " Ignore files on NERDTree
    " let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" }

" Set autocomplete form
"set completeopt=menuone,longest


" omnicompletion {
    "--- python formatting help ---
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

    " Enable omni completion.
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown,ctp set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType python set omnifunc=pythoncomplete#Complete
    "autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
    "autocmd FileType php,ctp set omnifunc=phpcomplete#CompletePHP
    "autocmd FileType vim set omnifunc=syntaxcomplete#Complete
"}

" remaping the save to ctrl-z {
    "noremap <D-z> :update<CR>
    "vnoremap <D-z> <D-C> :update<CR>
    "inoremap <D-z> <D-O> :update<CR>
" }

" Silver Searcher {
    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
    "if executable('ag')
    "  let g:ackprg = 'ag --nogroup --column'

      " Use Ag over Grep
    "  set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    "  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    "endif
" }

" Reload vimrc {
    " maps the command <leader>-shift-v to source my vimrc, maybe this is not needed
    map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
" }
