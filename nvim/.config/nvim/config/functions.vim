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
