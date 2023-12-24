let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'tabline': {
        \ 'left': [ ['buffers'] ],
      \ },
      \ 'component_expand': {
        \ 'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
        \ 'buffers': 'tabsel'
      \ }
    \ }
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#show_number=2
let g:lightline#bufferline#ordinal_number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
let g:lightline#bufferline#shorten_path = 0

