": 常用设置
set number
syntax on
set background=dark
colorscheme solarized
set showcmd
set ignorecase
" 高亮搜索
set hlsearch
" 设置折叠方式
set foldmethod=indent
" 按F2进入粘贴模式
set pastetoggle=<F2>

" 一些方便的映射
let mapleader=","
let g:mapleader=","

" 使用jj进入normal模式
inoremap jj <Esc>`^

" 使用 leader+w直接保存
inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>
" json 格式化
com! FormatJSON %!python3 -m json.tool

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
" Initialize plugin system
call plug#end()

nnoremap <leader>v :NERDTreeFind<cr>
nnoremap <leader>g :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
  \ '\.git$', '\.hg$', '\.svn$', '\.pyc$', '\.pyo', '\.swp$',
  \ '\.DS_Store$',
  \ ]

let g:ctrlp_map = '<c-p>'

nmap ss <Plug>(easymotion-s2)
