let mapleader = "\\"

" Make it easier to change config
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

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

" Run `make fmt` if available, or fall back to other formatters
function Fmt()
    !make fmt
    if v:shell_error
        if &filetype == "python"
            !black %
        endif
    endif
endfunction

noremap <F3> :call Fmt()<cr>

" Leave terminal mode more easily
tnoremap <Esc> <C-\><C-n>
" But also have a way to send <Esc> to other programs
tnoremap <C-v><Esc> <Esc>
