if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

set shell=/bin/bash

function! PackInit() abort

  packadd minpac

  call minpac#init()

  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Add other plugins here.
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('mengelbrecht/lightline-bufferline')
  call minpac#add('nathanaelkane/vim-indent-guides')
  call minpac#add('jeetsukumaran/vim-filebeagle')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('tomtom/tcomment_vim')
  call minpac#add('tpope/vim-surround')
  call minpac#add('ludovicchabant/vim-gutentags')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('mattn/emmet-vim')
  call minpac#add('fatih/vim-go')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('digitaltoad/vim-pug')
  call minpac#add('rizzatti/dash.vim')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('jremmen/vim-ripgrep')
  call minpac#add('github/copilot.vim')
  call minpac#add('liuchengxu/vista.vim')
  call minpac#add('lifepillar/vim-solarized8')

  " Load the plugins right now. (optional)
  " packloadall

endfunction

let mapleader = "\<space>"
inoremap jk <ESC>

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors " Enable 24-bit RGB colors
set clipboard=unnamed  " Set clipboard to system clipboard
set encoding=utf-8    " Set file encoding to utf-8
set hidden               " Open another file for editing without saving another.
set lazyredraw           " Don’t update screen during macro and script execution.
set number
set backspace=indent,eol,start   "backspace through anything
set complete-=i 
set ruler
set wildmenu "
set formatoptions+=j "remove comment char when joining lines
set autoread  "reload file if it is changed outside of vim
set history=1000
set tabpagemax=50
set nrformats-=octal
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.png,*.jpg,*.bmp,*.gif,*.exe

set sidescrolloff=5
set scrolloff=1

set expandtab
set tabstop=8
set softtabstop=2
set shiftwidth=2
set smarttab

set laststatus=2
set noshowmode
set showtabline=2 "Always show tabline

" Make hidden chars visible
set list

"set showbreak = ↪\
set listchars=tab:→\ ,nbsp:•,trail:•,extends:⟩,precedes:⟨


" CoC Suggestions
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes
" End of CoC Suggestions

" fzf"
set rtp+=/usr/local/opt/fzf
set grepprg=rg\ --vimgrep

filetype plugin indent on
syntax enable

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

nmap <silent> <leader>r :Rg

"Paste content without pain
map <leader>sp :set paste<cr>p<esc>:set nopaste<cr>

"----- TOGGLE LINE WRAP -----
nmap <silent> <leader>nw :set wrap!<CR>

"-----EDIT / RELOAD .vimrc
nmap <silent> <leader>ev :e /Volumes/Macintosh HD/Users/mfk/.vim/vimrc<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


"1 [http://vim.wikia.com/wiki/Highlight_unwanted_spaces]
autocmd BufWinLeave * call clearmatches()

"------UNDO/SWP/BACKUP DIRS-----
set undofile
set undodir=~/.vim/.undo//
set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//

"------BUFFER NAVIGATION
nmap <leader>h :bprevious<cr>
nmap <leader>l :bnext<cr>
nmap <leader>q :bdelete<cr>

"------MOVE AROUND-----
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <right> <nop>

noremap j gj
noremap k gk

"-----SPLIT SCREEN----
nnoremap <silent> vv <C-w>v
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"-----SEARCH------
set ignorecase
set incsearch
set showmatch
set hlsearch

vnoremap // y/<C-R>"<CR>
"Clean search highlights
nnoremap <leader>, :noh<cr>

" "-----PLUGIN: vim-colors-solarized
" set background=dark
" colorscheme solarized
" let g:solarized_menu=0
" let g:solarized_contrast="high"
set background=light
autocmd vimenter * ++nested colorscheme solarized8_flat


"The order matters. This line should come later than vim-colors-solarized settings.
highlight SpecialKey ctermbg=NONE ctermfg=19 cterm=NONE

"-----PLUGIN: CoC

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

vmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"--------------------------------------

"-----PLUGIN: lightline
let g:bufferline_solo_highlight    = 1
let g:lightline                    = {'colorscheme': 'solarized'}
let g:lightline.tabline            = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.active             = {'left': [['mode', 'paste'],
                                    \          ['gitbranch'], ['readonly', 'filename', 'modified', 'gutentags', 'coc']]
                                    \}

let g:lightline.component_expand   = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type     = {'buffers': 'tabsel'}
let g:lightline.component_function = {'gitbranch': 'FugitiveHead',
                                    \ 'coc': 'CocStatus',
                                    \ 'gutentags': 'gutentags#statusline'
                                    \}
let g:lightline.separator          = { 'left': "\ue0b0", 'right': "\ue0b2" }
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_map = {
                                       \  0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
                                       \  5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'
                                       \}

function! LightlineBufferline()
  call bufferline#refresh_status()
  return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction

" ---- PLUGIN: indent guides
nmap <leader>ig :IndentGuidesToggle<cr>
let g:indent_guides_guide_size = 1

"--- PLUGIN: fzf
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :BTags<CR>
nnoremap <Leader>t :Tags<CR>
map ; :GFiles<CR>

"------PLUGIN: tomtom/tcomment_vim
noremap <silent> <Leader>cc :TComment<CR>

"------PLUGIN: Dash 
nmap <silent> <leader>d <Plug>DashSearch

"------PLUGIN: vista
let g:vista_default_executive = 'coc'
nnoremap <silent> <leader>o :Vista!!<CR>

"------PLUGIN: github-copilot 
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

let g:copilot_filetypes = {
      \ 'markdown': v:false,
      \ 'astro': v:true,
      \ }

"----- PLUGIN: vim-go
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1 
"----- PLUGIN: vim-markdown
let g:vim_markdown_folding_disabled = 1

" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

nnoremap gp :silent %!prettier --stdin-filepath %<CR>

au BufReadPost *.astro set syntax=astro

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <C-g> :Rg<Cr>
