" Thie file is intended for config specific to 3rd-party plugins.

"""" neuron.vim

" Use the default mappings
let g:neuron_no_mappings = 0

let g:neuron_dir = $HOME.'/zettelkasten/'

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

"""" vim-autoformat

nnoremap <F3> :Autoformat<CR>

" TODO My current preferred workflow leans more towards running these commands
" externally. These settings are left for reference for now, but should be
" cleaned out at some point.

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

" Filetype commands
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
