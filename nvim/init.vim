set nocompatible

" ----- NeoVim ----- {{{
if has("nvim")
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
endif
" }}}

" ----- Plugins ----- {{{
call plug#begin('~/.vim/plugged')

" Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" language support
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'avakhov/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'

" look and feel
Plug 'ayu-theme/ayu-vim'
Plug 'itchyny/lightline.vim'
call plug#end()
" }}}

" ----- Plugin Configuration ----- {{{
" nerdtree
let g:NERDTreeWinPos = "right"
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" nerdcommenter
nmap <LEADER>/ <plug>NERDCommenterToggle
vmap <LEADER>/ <plug>NERDCommenterToggle
" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
" rust
let g:rustfmt_autosave = 1
" lightline
let g:lightline = {
            \ 'colorscheme': 'ayu',
            \ }
" }}}

" ----- General Key Mappings ----- {{{
let mapleader = "\<SPACE>"
" toggle search highlight
nnoremap <C-L> :set hlsearch!<CR>
" window movement
noremap <C-J> <C-W>j
noremap <C-H> <C-W>h
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
" copy and paste
noremap <LEADER>Y "+y
noremap <LEADER>P "+p
" select all
nnoremap <LEADER>A ggVG
noremap <2-LeftMouse> za
" }}}

" ----- Editor ----- {{{
syntax on
filetype plugin indent on
set number
set showcmd
set hidden
set autochdir
set incsearch
set hlsearch
set nobackup
set showmatch
set wildmenu
set ignorecase
set infercase
set autoread
set nowrap
set backspace=indent,eol,start
set colorcolumn=80
set laststatus=2

" indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set expandtab

" formats
set fileformats=unix

" encoding
set encoding=UTF-8

" swap
set directory^=$HOME/.vim/tmp/

" look and feel
if has("termguicolors")
    set termguicolors
endif
set background=dark
let ayucolor="mirage"
colorscheme ayu
hi comment cterm=italic gui=italic

set t_Co=256
if has("gui_running")
    if has("win32")
        set gfn=Consolas:h12:cANSI
    elseif !has("gui_vimr")
        set gfn=PragmataProMono-Regular:h22
    endif
    set guioptions=
endif

if has("mouse")
    set mouse=a
endif

set cursorline
set guicursor=

" spell check
set spelllang=en
set spellsuggest=5

" autocomplete
set complete=.,t,d,i
set completeopt=menu,menuone

" folding
set foldmethod=syntax
set nofoldenable
" }}}

" ----- Editor Hooks ----- {{{
augroup hooks
    autocmd!

    " jump back to last position
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \       exe "normal g`\"" |
                \ endif

    " remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e

augroup end
" }}}

" ----- Filetype Hooks ----- {{{
augroup file
    autocmd!

    " enable spell checking for markdown files
    auto Filetype markdown,html
                \ setlocal spell spelllang=en_us |
                \ setlocal tabstop=2 |
                \ setlocal softtabstop=2

    autocmd FileType go nmap <LEADER>b <Plug>(go-build)
    autocmd FileType go nmap <LEADER>r <Plug>(go-run)

    autocmd FileType rust nmap <LEADER>r :Cargo run<CR>
    autocmd FileType rust nmap <LEADER>t :Cargo test<CR>
    autocmd FileType rust nmap <LEADER>c :Cargo check<CR>

    autocmd FileType javascript,javascript.jsx,typescript,typescriptreact
                \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 |
                \ setlocal foldmethod=syntax

    autocmd FileType c
                \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 |

    autocmd FileType vim
                \ setlocal foldmethod=marker |
                \ setlocal foldenable |
                \ nnoremap <LEADER>S :source %<CR>
augroup end
" }}}

" ----- coc ----- {{{
execute 'source ' . stdpath('config') . '/coc.vim'
" }}}
