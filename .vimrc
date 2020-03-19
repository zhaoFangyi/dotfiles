": 常用设置
set number
syntax on
set background=dark
colorscheme solarized
set showcmd
" Ignore case when searching
set ignorecase
" Enabel filetype plugins
filetype plugin on
filetype indent on
" 高亮搜索
set hlsearch
set pastetoggle=<F2>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Don't redraw while executing macros (good performance config)
set lazyredraw
" Add a bit extra margin to the left
set foldcolumn=1
" set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Be smart when using tabs ;)
set smarttab
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

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
" autocmd FileType python,shell,coffee set commentstring=#\ %s
" autocmd FileType java,c,cpp,javascript set commentstring=//\ %s
