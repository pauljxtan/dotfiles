" Thie file is intended for config specific to 3rd-party plugins.

"""" neuron.vim

" Use the default mappings
let g:neuron_no_mappings = 0

let g:neuron_dir = resolve($HOME.'/zettelkasten/')

"""" gitgutter

let g:gitgutter_highlight_linenrs = 1

" Indicate changes as a (*) in the fold text
set foldtext=gitgutter#fold#foldtext()

"""" coc

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
" (There are more commands available, but I find these the most useful)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show docs in a preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
      else
            execute '!' . &keywordprg . " " . expand('<cword>')
      endif
endfunction

" CocList shortcuts
nnoremap <silent><nowait> <space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o :<C-u>CocList outline<cr>

"""" vimtex

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

" Reminder: Set $pdf_mode = 5 in .latexmkrc

"""" fzf.vim

nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>

let g:fzf_preview_window = 'right:50%'

"""" vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""" lightline

set noshowmode

" NOTE These are mostly carried over from the defaults, with minor changes
" See :help g:lightline

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

" NOTE The extra `-- INSERT --` is redundant if using lightline

" Force lightline updates for coc
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"""" rainbow_parentheses
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

"""" vim-slime
let g:slime_target = "neovim"
