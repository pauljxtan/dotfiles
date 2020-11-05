" Requirements:
" - Install neovim
" - Install vim-plug (https://github.com/junegunn/vim-plug)

" This file is intended mostly for plugin initialization. All other
" order-independent config should be defined under config/*.vim and sourced
" accordingly.

" ---- vim-plug --------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')

"""" General

" Filesystem
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Navigation
Plug 'psliwka/vim-smoothie'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'

" Text
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/vis'

" coc replaces deoplete, neosnippet, etc. for IDE-like features
" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""" Filetype plugins

" For convenience, delegate as much as possible to vim-polyglot
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

"" And some stuff not included in vim-polyglot 

" Common Lisp
Plug 'kovisoft/slimv'

" Haskell
Plug 'pbrisbin/vim-syntax-shakespeare'

" Jinja
Plug 'lepture/vim-jinja'

" Markdown
Plug 'masukomi/vim-markdown-folding'

" Python
Plug 'fisadev/vim-isort'

" TeX
Plug 'lervag/vimtex'

"""" Application plugins

"" Neuron
" NOTE the original plugin is at 'ihsanturk/neuron.vim'
" This is a more actively maintained fork
"Plug 'fiatjaf/neuron.vim'
Plug 'pauljxtan/neuron.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'

"""" Colorschemes

Plug 'sainnhe/sonokai'

"""" Pre-load settings

" vim-polyglot needs to be configured before it is loaded
let g:polyglot_disabled = ['markdown']

call plug#end()

" ----------------------------------------------------------------------------

runtime config/functions.vim
runtime config/general.vim
runtime config/keys.vim
runtime config/plugins.vim
runtime config/style.vim
