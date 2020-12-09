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

" Run `make fmt` if available, otherwise just fix indentation
function Fmt()
    !make fmt
    if v:shell_error
        normal gg=G
    else
        edit
    endif
endfunction

noremap <F3> :call Fmt()<cr>
