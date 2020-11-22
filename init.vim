call plug#begin('~/.config/nvim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
" Themes
Plug 'ryanoasis/vim-devicons' "Icons for filetypes
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline' "Status bar
Plug 'vim-airline/vim-airline-themes' "Applicable themes
Plug 'ap/vim-css-color' "  color name highlighter
Plug 'airblade/vim-gitgutter' " Gutter git highlighting
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive' " Git Wrapper
Plug 'wesQ3/vim-windowswap' " Window swapper
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
"Plug 'ludovicchabant/vim-gutentags' " Tags
Plug 'terryma/vim-smooth-scroll'
Plug 'puremourning/vimspector' " Debugger
Plug 'prettier/vim-prettier' " Formmater
Plug 'dense-analysis/ale' " Check syntax
call plug#end()
set encoding=UTF-8
" --------- IntelliSense --
" gives you a list for multiple defs and jumps immediately for single def
"noremap <C-]> g<C-]>
let g:gutentags_cache_dir = '~/.devtags'
nmap <silent> gd <Plug>(coc-definition)
map <silent> gy <Plug>(coc-type-definition)
map <silent> gi <Plug>(coc-implementation)
map <silent> gr <Plug>(coc-references)
" coc ignore noise
let g:coc_disable_startup_warning = 1
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-angular',
  \ 'coc-tabnine',
  \ 'coc-flutter',
  \ ]
" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" ---------- Debugger -------
let g:vimspector_enable_mappings = 'HUMAN'
"packadd! vimspector
" ---------- Custom Hotkeys -
let mapleader = ","
:imap jj <Esc>
:nmap <Space><Space> :
" Search directory
" search file names some rules in .zshrc and .rgignore
:nmap ++ :Files<Cr>
" search in files
:nmap -- :Ag<Cr>
" Pulls up opened Buffers
:nmap <leader>b :Buffers<Cr>
:nmap <leader>sa :botright split<Cr>
:nmap <leader>vsa :botright vspli<Cr>
" ---------- Terminal Controls ----
:nmap <leader>vt :vsplit term://zsh<Cr>
:nmap <leader>ht :split term://zsh<Cr>
:tnoremap jj <C-\><C-n> " Exit Insert Mode
" --------- Smooth Scroll ----
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" ---------- Basics ---------
set encoding=utf8
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set clipboard=unnamed
set autoindent
set number
set relativenumber
set incsearch " jump to search match as typing
set nohlsearch " don't highlight my searches
set ignorecase
set smartcase
set noswapfile
set autoread " refreshes changes if buffer opened was changed other places
autocmd BufWritePre * %s/\s\+$//e "Auto-remove trailing whitespace on save
" ================ Git ==============================
" Git Blame
nnoremap <Leader>g :Gblame<Cr>
" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" --------- NERDTree ---------
autocmd vimenter * if !argc() | NERDTree | endif "open NERDTree by default
autocmd VimEnter * wincmd p "change focus away from NERDTree pane
:map <C-n> :NERDTreeFind<Cr>
let NERDTreeShowHidden=1 " show hidden files in NERDTree
set conceallevel=3 " to hide brackets on dev icons
let g:webdevicons_enable_airline_tabline = 1 " adding to vim-airline's tabline
let g:webdevicons_conceal_nerdtree_brackets = 1 " whether or not to show the nerdtree brackets around flags
" ---------- Theme ---------
" Display tabs and trailing spaces visually
colorscheme codedark
" To enable the lightline theme
let g:airline_theme = 'codedark'
" let g:gruvbox_contrast_dark = 'soft'
" adds blue highlight to vim in visual mode selections
hi Visual cterm=bold ctermbg=Yellow ctermfg=NONE
" Search Highlight
hi Search guibg=darkslateblue guifg=wheat
" Enable Rainbow Brackets
" let g:rainbow_active = 1
syntax enable
" Disable arrow keys in normal mode - helps getting used to better movement
" keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" Quicker tab movement
nnoremap <A-¬¨> gt
nnoremap <A-l> gT
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap \| :vsp<CR>
nnoremap _ :sp<CR>
nnoremap ? :vsp<CR>:terminal<CR>A
nnoremap <C-?> :sp<CR>:terminal<CR>A
" Control-T for new tab
nnoremap <C-t> :tabnew<CR>
" Re-bind <C-f> for searching with grep (<C-d> is used for scrolling)
nnoremap <C-f> :FZF<CR>
" Exit terminal mode
tnoremap kj <C-\><C-n>
" prettier config
"
let g:prettier#config#single_quote = 'true'
