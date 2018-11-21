let $LANG = 'en'
set runtimepath^=~/.vim

set rtp+=~/.fzf

set nocompatible hidden autowrite autoread autoindent nosmartindent nocindent
set linebreak lazyredraw ttyfast confirm ruler cursorline splitbelow splitright mousehide
set wildmenu wildmode=full switchbuf=useopen scrolloff=8 sidescrolloff=8
set noerrorbells visualbell t_vb= foldcolumn=1
set magic nohlsearch ignorecase smartcase incsearch
set expandtab smarttab nowrap
set laststatus=2
set guicursor=a:blinkwait0,a:block-cursor
set nobackup nowritebackup noswapfile
set modeline modelines=0
set nrformats=
set backspace=eol,start,indent
set tabstop=4 shiftwidth=4
set viminfo='100,n$HOME/.vim/viminfo

mapclear

if !has("gui_running")
  set nocursorline
end

let g:jekyll_path = "~/Projects/juev.org/source"
let no_buffers_menu = 1

scriptencoding utf-8
set encoding=utf-8
if has('mac') || has('unix')
  set shell=bash
endif

call plug#begin('~/.vim/plugged')

"Add your bundles here

" Plugin 'scrooloose/syntastic'
" Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'aperezdc/vim-template'
Plug 'b4b4r07/vim-ansible-vault'
Plug 'bhurlow/vim-parinfer'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'henrik/rename.vim'
Plug 'Juev/vim-jekyll'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'l04m33/vlime', {'rtp': '~/.vim/'}
Plug 'liuchengxu/vim-which-key'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pearofducks/ansible-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'shvechikov/vim-keymap-russian-jcukenmac'
Plug 'sjl/badwolf'
Plug 'srcery-colors/srcery-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --rust-completer' }
Plug 'vhdirk/vim-cmake'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/paredit.vim'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'WolfgangMehner/c-support'
if has('mac') || has('unix')
  Plug 'editorconfig/editorconfig-vim'
end

call plug#end()

" Use cmake
let g:C_UseTool_cmake = 'yes'

" Colors
set t_Co=256
syntax enable

if filereadable(expand("~/.vim/plugged/badwolf/README.markdown"))
  colorscheme badwolf
endif

" Keymap
if filereadable(expand("~/.vim/plugged/vim-keymap-russian-jcukenmac/README.md"))
  set keymap=russian-jcukenmac iminsert=0 imsearch=0
endif
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Keys
let g:mapleader=","
no ' ,
ino <C-j> <Esc>
vn <C-j> <Esc>

" Toggle paste mode
no <silent> <F4> :set invpaste<CR>:set paste?<CR>
ino <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

no <silent> <Leader>q :bw<CR>
no <silent> <leader>w :w!<CR>
no <leader><leader> <c-^>

no <space> :

no j gj
no k gk

" Visual shifting (does not exit Visual mode)
vn < <gv
vn > >gv

nn Y y$

nn <silent> vv    <C-w>v
nn <silent> ss    <C-w>s
no <silent> <leader>0 <C-w>o

" easier navigation between split windows
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-h> <c-w>h
nn <c-l> <c-w>l

vn Q gq
nn Q gqap

nn <leader>fef gg=G
"map w!! %!sudo tee > /dev/null %

nn <silent> <BS> :nohlsearch<CR>
nn S :%s//g<LEFT><LEFT>

cmap w!! w !sudo tee > /dev/null %

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Commentary
nmap <Leader>c :Commentary<CR>
vmap <Leader>c :Commentary<CR>

" NERDTree
map <F8> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>o :Files<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Vim-Rooter
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1

" Vim-Go
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1

" Ansible-Vault
let g:ansible_vault_password_file = '~/.vault_pass'

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-template
let g:username = "Denis Evsyukov"
let g:email = "denis (at) evsyukov.org"
