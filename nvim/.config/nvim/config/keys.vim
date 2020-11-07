let mapleader = "\\"

" Make it easier to change config
nnoremap <leader>ev :vsplit $HOME/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source $HOME/.config/nvim/init.vim<cr>

" Preserve visual selection after an indent or dedent
vnoremap < <gv
vnoremap > >gv

" This is a relic of a time when I was weaning myself of arrow keys, and is
" left mostly for posterity
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>

" Used on most of my personal projects
noremap <F3> :!make fmt<cr>:e<cr>
