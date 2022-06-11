set termguicolors
set background=dark

let g:sonokai_transparent_background = 1
let g:sonokai_enable_italic = 1
let g:sonokai_style = 'shusia'
colorscheme sonokai

" Sometimes we need to override stuff for the entire window to be transparent
" Check :h highlight-groups for reference
"hi EndOfBuffer guibg=NONE ctermbg=NONE
"hi LineNr guibg=NONE ctermbg=NONE
"hi Normal guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE ctermbg=NONE

" Make window splits stand out more
hi VertSplit guibg=bg guifg=fg
