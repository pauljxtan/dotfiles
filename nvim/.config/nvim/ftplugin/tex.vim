setlocal sw=2

" This almost always gets disabled after a timeout, 
" so may as well disable it from the start
setlocal inccommand=

nnoremap <leader>al i\begin{AsciiList}{auto}<cr>- <cr>\end{AsciiList}<esc>

command! AlignTabular :normal vipga*&<esc>
