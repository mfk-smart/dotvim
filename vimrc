if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

packadd minpac

call minpac#init({"package_name":"plugins"})

call minpac#add('k-takata/minpac', {'type': 'opt'})

command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()
command! PackStatus call minpac#status()

" Plugins
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('jeetsukumaran/vim-filebeagle')
call minpac#add('junegunn/fzf.vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tpope/vim-surround')
call minpac#add('preservim/vim-markdown')
call minpac#add('github/copilot.vim')
call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})
call minpac#add('itchyny/lightline.vim')
call minpac#add('mengelbrecht/lightline-bufferline')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('prettier/vim-prettier')
call minpac#add('tpope/vim-fugitive')
call minpac#add('christoomey/vim-tmux-navigator')
call minpac#add('wuelnerdotexe/vim-astro')
call minpac#add('preservim/vim-indent-guides')

set number
set shell=/bin/bash
set termguicolors
set clipboard=unnamed
set encoding=utf-8
set hidden
set lazyredraw
set backspace=indent,eol,start
set complete-=i
set ruler
set wildmenu
set formatoptions+=j
set autoread
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
set showtabline=2
set list
set listchars=tab:→\ ,nbsp:•,trail:•,extends:⟩,precedes:⟨

" Essentials
inoremap jk <ESC>
let mapleader = "\<space>"
map <leader>sp :set paste<cr>p<esc>:set nopaste<cr>
noremap j gj
noremap k gk

" Search Settings
set ignorecase
set incsearch
set showmatch
set hlsearch
nnoremap <leader>, :noh<cr>
autocmd BufWinLeave * call clearmatches()

nmap <silent> <leader>nw :set wrap!<CR>

" Edit/Reload .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>

" Undo/Swap/Backup directories
set undofile
set undodir=~/.vim/.undo//
set directory=~/.vim/.swp//
set backupdir=~/.vim/.backup//

filetype plugin indent on
syntax enable

" Buffer Navigation
nmap <leader>h :bprevious<cr>
nmap <leader>l :bnext<cr>
nmap <leader>q :bdelete<cr>

" Theme
set background=dark
colorscheme solarized8

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

source $HOME/.vim/rcs/lightline.vim

" Move Around
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>


" Split Screen
nnoremap <silent> vv <C-w>v
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

vnoremap // y/<C-R>"<CR>

" Github Co-pilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Search - FZF
set rtp+=/opt/homebrew/opt/fzf

nnoremap <silent> <C-p> :Files<cr>

nnoremap <leader>rg expand('<cword>')<CR>

function! s:RgUnderCursor() abort
  let search_term = )
  execute 'Rg ' . search_term
endfunction

" Comments
noremap <silent> <Leader>cc :TComment<CR>

" GitGutter
let g:gitgutter_map_keys = 0
nmap ghp <Plug>(GitGutterPreviewHunk)
autocmd BufWritePost * GitGutter

" Indent Guides
let g:indent_guides_guide_size = 1

" CoC
" always show signcolumns
set signcolumn=yes

" coc-css
autocmd FileType scss setl iskeyword+=@-@

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
