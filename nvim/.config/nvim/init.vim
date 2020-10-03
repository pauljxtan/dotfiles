" Before using this config:
" - Install neovim
" - Install vim-plug (https://github.com/junegunn/vim-plug)

"---- Plug -------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
"-- General
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/vis'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
" coc (replaces deoplete, neosnippet, etc.)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"-- Filetype-specific
" vim-polyglot should cover almost everything
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

"-- Extra stuff not included in vim-polyglot 
" Common Lisp
Plug 'kovisoft/slimv'
" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'
" Markdown
Plug 'masukomi/vim-markdown-folding'
" Python
Plug 'fisadev/vim-isort'
" TeX
Plug 'lervag/vimtex'

"-- Application-specific
" Neuron
Plug 'ihsanturk/neuron.vim'

"-- Colorschemes
" TODO I no longer use most of these - clean this up
Plug 'AlessandroYorba/Alduin'
Plug 'ajmwagar/vim-deus'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'fmoralesc/molokayo'
Plug 'franbach/miramare'
Plug 'morhetz/gruvbox'
Plug 'nightsense/carbonized'
Plug 'nightsense/snow'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/sonokai'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'srcery-colors/srcery-vim'
Plug 'tomasr/molokai'
Plug 'wadackel/vim-dogrun'

" vim-polyglot needs to be configured before it is loaded
let g:polyglot_disabled = ['markdown']

" Initialize plugin system
call plug#end()

"---- General ----------------------------------------------------------

"-- Colors
set termguicolors
set background=dark

let g:sonokai_transparent_background = 1
let g:sonokai_enable_italic = 1
colorscheme sonokai

" Sometimes we need to override stuff for the entire window to be transparent
" Check :h highlight-groups for reference
"hi EndOfBuffer guibg=NONE ctermbg=NONE
"hi LineNr guibg=NONE ctermbg=NONE
"hi Normal guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE

"-- Keybindings
let mapleader = "\\"
" Make it easier to change config
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
" Keep visual selection after (un)indent
vnoremap < <gv
vnoremap > >gv
" I have zero muscle memory remaining for arrow keys, but as well leave this
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>

"-- Filetype
" This is only needed for vim since nvim is always nocompatible
set nocompatible
filetype plugin on
syntax on
set encoding=utf8
set fileformats=unix,dos,mac

"-- Spaces, tabs, indents
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set nojoinspaces

"-- Line width
" Notes on various defaults/recos:
" - PEP8: 79 for code, 72 for comments/text
" - rustfmt default: 100
" - mix format default: 80 (?)
" I'm still not sure what to use, so just going with the default for now
" (This is hard to find in the docs, but this breaks lines _on_ the 79th char)
set textwidth=0

"-- Navigation
set cursorline
set number
set ruler
set showmatch
set wrap
"-- Up to 2 sign columns may be used for: coc, gitgutter
set signcolumn=auto:2

"-- Search
set hlsearch
set ignorecase
" split is more useful than nosplit for multiple substitutions
set inccommand=split
set incsearch
set smartcase

"-- Folds
set foldenable
set foldlevel=1
" indent 'works' universally, but syntax may be better for supported filetypes
set foldmethod=indent
set foldnestmax=99

"-- Filesystem
" Enable switches buffer w/out saving
set hidden
" Disable automatic backups, I save frequently by reflex anyway
set nobackup
set noswapfile
set nowritebackup
" Default updatetime is 4000 (4s)
" This affects certain plugin refreshes, e.g. gitgutter
" Setting this too low _may_ cause glitches (e.g. with highlighting)
set updatetime=1000

"-- Clipboard
" To ALWAYS use the clipboard for ALL operations (instead of interacting with
" the '+' and/or '*' registers explicitly):
set clipboard+=unnamedplus

"-- Turn off error bells - who actually wants these?
set noerrorbells
set novisualbell
set t_vb=

"-- Splits
" It seems more intuitive to split _to_ the new window
set splitbelow
set splitright

"-- History
set history=100

"-- Messages
" Silence non-useful completion-related messages like 'Pattern not found'
set shortmess+=c

"---- Plugin-specific -------------------------------------------------
"-- Neuron
let g:neuron_no_mappings = 0

"-- gitgutter
let g:gitgutter_highlight_linenrs = 1
" Changes show up as a (*) in the fold text
set foldtext=gitgutter#fold#foldtext()

"-- coc
" Use tab to trigger and navigate completions
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-- vim-isort
" Adjust to match whatever length the code formatter uses
let g:vim_isort_config_overrides = {'line_length': 99}

"-- vim-autoformat
" TODO I don't really use this plugin much anymore - should probably remove
" this stuff soon
nnoremap <F3> :Autoformat<CR>
" Custom definitions
let g:formatdef_brittany = '"brittany"'
let g:formatdef_elmformat = '"elm-format --stdin --elm-version 0.19 --yes" '
let g:formatdef_eslint = '"eslint --stdin" '
let g:formatdef_hindent = '"hindent"'
let g:formatdef_prettier_css = '"prettier" '
let g:formatdef_prettier_html = '"prettier" '
let g:formatdef_prettier_javascript = '"prettier" '
let g:formatdef_prettier_json = '"prettier" '
let g:formatdef_prettier_markdown = '"prettier --parser markdown --print-width 79 --prose-wrap always" '
let g:formatdef_purty = '"purty format --write -" '
let g:formatdef_standardjs = '"standard --fix" '
" Formatter settings
let g:formatters_eelixir = ['prettier_html']
let g:formatters_elm = ['elmformat']
let g:formatters_haskell = ['hindent', 'brittany', 'stylish-haskell']
let g:formatters_javascript = ['prettier_javascript']
let g:formatters_jinja = ['prettier_html']
let g:formatters_json = ['prettier_json']
let g:formatters_markdown = ['prettier_markdown']
let g:formatters_purescript = ['purty']
let g:formatters_python = ['yapf']
let g:formatters_vue = ['prettier_javascript']

"-- vimtex
let g:tex_flavor = "latex"
let g:vimtex_view_enabled = 1
let g:vimtex_view_method = 'mupdf'
let g:vimtex_fold_enabled = 1
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'continuous' : 0,
            \ 'options' : [
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-shell-escape',
            \ ],
            \}
" Reminder: set $pdf_mode = 5 in .latexmkrc

"-- fzf.vim
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
let g:fzf_preview_window = 'right:50%'

"-- vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"-- lightline
" These are mostly the defaults, with minor changes
" Refer to :help g:lightline, etc.
let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'gitbranch' ],
            \           [ 'readonly', 'relativepath', 'modified', 'cocstatus' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'formatoptions', 'fileformat',
            \              'fileencoding', 'filetype' ] ]
            \}
let g:lightline.inactive = {
            \ 'left': [ [ 'filename' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ] ]
            \}
let g:lightline.component = {
            \ 'absolutepath': '%F',
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&ff}',
            \ 'filename': '%t',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'formatoptions': '%{&fo}',
            \ 'lineinfo': '%3l:%-2v',
            \ 'mode': '%{lightline#mode()}',
            \ 'modified': '%M',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'percent': '%3p%%',
            \ 'percentwin': '%P',
            \ 'readonly': '%R',
            \ 'relativepath': '%f'
            \}
let g:lightline.component_function = {
            \ 'cocstatus': 'coc#status',
            \ 'gitbranch': 'FugitiveHead'
            \}
" The extra `-- INSERT --` is redundant if using lightline
set noshowmode
" Force lightline updates for coc
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"-- vim-startify
let g:startify_change_to_dir = 0

"---- Functions --------------------------------------------------------

" https://www.reddit.com/r/vim/comments/3duumy/changing_markdown_syntax_colors/ct90v0z/
function! GetSyntaxID()
    return synID(line('.'), col('.'), 1)
endfunction
function! GetSyntaxParentID()
    return synIDtrans(GetSyntaxID())
endfunction
function! GetSyntax()
    echo synIDattr(GetSyntaxID(), 'name')
    exec "hi ".synIDattr(GetSyntaxParentID(), 'name')
endfunction
