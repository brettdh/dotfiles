filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
    echo "Installing NeoBundle\n"
    silent execute '!mkdir -p ~/.vim/bundle'
    silent execute '!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'
  endif
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch "Shougo/neobundle.vim"

" .... plugins, such as ....
NeoBundle "MarcWeber/vim-addon-mw-utils"
NeoBundle "tomtom/tlib_vim"
NeoBundle "tpope/vim-sensible"
" NeoBundle "garbas/vim-snipmate"
NeoBundle "SirVer/ultisnips"
NeoBundle "honza/vim-snippets"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "kien/ctrlp.vim"
NeoBundle "jlanzarotta/bufexplorer"
NeoBundle "scrooloose/nerdtree.git"
NeoBundle "Lokaltog/vim-easymotion"
NeoBundle "tpope/vim-fugitive"
NeoBundle "scrooloose/syntastic"
NeoBundle "embear/vim-localvimrc"
NeoBundle "Valloric/YouCompleteMe"
NeoBundle "tpope/vim-surround"
" NeoBundle "ntpeters/vim-better-whitespace"
NeoBundle "tfnico/vim-gradle"
NeoBundle "jiangmiao/auto-pairs"
NeoBundle "shime/vim-livedown"
NeoBundle "vim-scripts/a.vim"

call neobundle#end()

NeoBundleCheck
filetype plugin indent on
syntax on

let NERDTreeIgnore = ['\.pyc$', '\.class$']
let g:ctrlp_show_hidden = 1
map <C-x> :CtrlPBuffer<CR>
let g:syntastic_python_checkers = ['python', 'pylint', 'pep8']
let g:syntastic_always_populate_loc_list = 1

let g:UltiSnipsExpandTrigger = "<c-space>"

" bash-like tab completion:
" 1) complete as much as possible
" 2) list all options
" 3+) cycle through options
set wildmode=longest,list,full
set wildmenu

set wildignore+=*.pyc,*_pb2.py,*/build/*
set autoindent
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

set hidden

if has("autocmd")
    autocmd FileType php setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd Filetype javascript setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd Filetype c setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd Filetype cpp setlocal ts=8 sts=4 sw=4 expandtab
    autocmd FileType java setlocal ts=8 sts=4 sw=4 expandtab
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
endif

source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

autocmd BufEnter * silent! lcd %:p:h

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :edit $MYVIMRC<CR>

set number

map ZZ zz
map ZT zt
map ZB zb

set autoread
