" This file is intended for vanilla config unrelated to 3rd-party plugins.

"""" Filetype

" This is only needed for vim since nvim is always nocompatible, but is kept
" for portability
set nocompatible

filetype plugin on
syntax on

set encoding=utf8
set fileformats=unix,dos,mac

" Specific filetype overrides
autocmd BufReadPost *.rkt,*.rktl set filetype=racket

"""" Whitespace

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set nojoinspaces

"""" Line width

" Notes on various defaults/recos:
" - PEP8: 79 for code, 72 for comments/text
" - rustfmt default: 100
" - mix format default: 80 (?)
" I'm still not sure what to use, so just going with the default for now
" (This is hard to find in the docs, but this breaks lines _on_ the 79th char)

set textwidth=0

"""" Navigation

set cursorline
set number
set ruler
set showmatch
set wrap

" Up to 2 sign columns may be used for: coc, gitgutter
set signcolumn=auto:2

"""" Search and substitution

set hlsearch
set incsearch

set ignorecase
set smartcase

" An alternative is 'nosplit' (in-place substitution), but I find 'split' more
" useful multiple substitutions spread out over many lines
set inccommand=split

"""" Folding

set foldenable

set foldlevelstart=99
set foldnestmax=99

" 'indent' works more universally, but 'syntax' may be better for supported
" filetypes
set foldmethod=indent

"""" Filesystem

" Enable switching out of a buffer without needing to write it
set hidden

" Disable automatic backups (I save frequently by reflex)
set nobackup
set noswapfile
set nowritebackup

" Default updatetime is 4000ms, which seems kinda long
" This affects certain plugin refreshes, e.g. gitgutter
" Setting this too low _may_ cause glitches (e.g. with highlighting)
set updatetime=1000

"""" Clipboard

" Use the clipboard for all operations, instead of interacting with
" the '+' and/or '*' registers explicitly
set clipboard+=unnamedplus

"""" Error bells

" Disable everything
set noerrorbells
set novisualbell
set t_vb=

"""" Splits

" It seems more intuitive to split _to_ the new window
set splitbelow
set splitright

"""" History

set history=100

"""" Messages

" Silence non-useful completion-related messages like 'Pattern not found'
set shortmess+=c

"""" fzf
" https://github.com/junegunn/fzf/issues/1393#issuecomment-426576577
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
