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
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Chiel92/vim-autoformat'
Plug 'Raimondi/delimitMate'

" language support
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'avakhov/vim-yaml'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'happyslowly/vim-antlr4'
Plug 'tpope/vim-fireplace'
Plug 'venantius/vim-cljfmt'
Plug 'clojure-vim/async-clj-omni'
Plug 'justmao945/vim-clang'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'cespare/vim-toml'

" look and feel
Plug 'luochen1990/rainbow'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
call plug#end()
" }}}

" ----- Plugin Configuration ----- {{{
" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.git|target)$'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
" NERDTree
let g:NERDTreeWinPos = "right"
" cpp highlight
let g:cpp_class_scope_highlight = 1
" NERDTree
let g:NERDTreeWinPos = "right"
" tagbar
let g:tagbar_left = 1
" vim-go
let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
" Ale
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '•'
" let g:ale_linters = {
"             \   'bash': ['shellcheck'],
"             \   'c': ['clang'],
"             \   'clojure': ['joker', 'clj-kondo'],
"             \   'javascript': ['eslint'],
"             \   'json': ['jq'],
"             \   'rust': ['analyzer'],
"             \   'zsh': ['shellcheck'],
"             \}
" let g:ale_fixers = {
"             \ 'javascript': ['eslint'],
"             \ 'json': ['jq'],
"             \ 'python': ['yapf'],
"             \ 'c': ['clang-format'],
"             \}
" let g:ale_fix_on_save = 1
" let g:ale_linters_explicit = 1
" let g:ale_javascript_eslint_use_global = 0
" Rust
let g:rustfmt_autosave = 1
" vim-indent-guides
let g:indent_guides_start_level = 2
" vim-gitgutter
let g:gitgutter_enabled = 0
" lightline
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ }
" rainbow
let g:rainbow_active = 0
" nord
let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"
" }}}

" ----- General Key Mappings ----- {{{
let mapleader = "\<SPACE>"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" toggle search highlight
nnoremap <C-L> :set hlsearch!<CR>
" ctags
nnoremap <silent> <F2> :TagbarToggle<CR>
" nerdtree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" nerdcommenter
nmap <LEADER>/ <plug>NERDCommenterToggle
vmap <LEADER>/ <plug>NERDCommenterToggle
" terminal
if has("nvim")
    noremap <F4> :e term://zsh<CR>a
else
    noremap <F4> :term<CR><C-W>J<C-W>10_
endif
"tnoremap <ESC> <C-\><C-N>
tnoremap <EXPR> <S-INSERT> '<C-\><C-N>"'.nr2char(getchar()).'pi'*
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
" Autoformat
nnoremap <LEADER>F :Autoformat<CR>
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" fzf
nnoremap <LEADER>o :CtrlP<CR>
" rainbow
nnoremap <LEADER>pp :RainbowToggle<CR>
" ale
nnoremap <LEADER>d :call CocAction('doHover')<CR>
" fireplace
noremap <LEADER>v :Eval<CR>
" Others
nnoremap <LEADER>ev :vsplit $MYVIMRC<CR>
nnoremap <LEADER>sv :source $MYVIMRC<CR>
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
colorscheme nord
" other highlight
hi CocUnderline gui=undercurl term=undercurl

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

    autocmd FileType javascript,javascript.jsx
                \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 |
                \ setlocal foldmethod=syntax

    autocmd FileType c
                \ setlocal tabstop=2 shiftwidth=2 softtabstop=2 |

    autocmd FileType vim
                \ setlocal foldmethod=marker |
                \ setlocal foldenable |
                \ nnoremap <LEADER>S :source %<CR>

    autocmd FileType python
                \ let g:indent_guides_enable_on_vim_startup = 1

    autocmd FileType clojure
                \ let g:rainbow_active = 1
augroup end
" }}}
