"""""""""
" Mro95's Neovim config
"""""""""

call plug#begin()

" UI
Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }

" Syntax
Plug 'rust-lang/rust.vim'

" Language server
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"""""""""""
" Settings
"""""""""""

set cursorline
set hidden
set hlsearch
set ignorecase
set relativenumber
set ruler
set showcmd
set smartcase
set splitbelow
set splitright
set termguicolors
set title
set undofile
set wrap
set wildmenu

set background=dark
set backspace=start,eol,indent
set completeopt=menu,menuone,longest,noselect
set encoding=utf8
set fillchars+=vert:/
set foldcolumn=1
set foldmethod=marker
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set history=1000
set laststatus=0
set listchars+=nbsp:%
set listchars+=tab:]-
set listchars+=trail:#
set mouse=a
set numberwidth=5
set pastetoggle=<F11>
set scrolloff=5
set showtabline=2
set tags+=.tags
set textwidth=120
set timeoutlen=400
set undolevels=1000
set updatetime=1500
set viewoptions=cursor,folds
set wildchar=<Tab>
set wildmode=longest,list
set winminwidth=20
set winwidth=80

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4

colors tomorrow-night

" transparent background
highlight Normal ctermbg=none
highlight NonText ctermbg=none




autocmd BufReadPost *.rs setlocal filetype=rust
autocmd CursorMoved *.rs call CocAction("highlight")
autocmd CursorMovedI *.rs call CocActionAsync("highlight")

let g:LanguageClient_serverCommands = {
\ 'rust': ['ra_lsp_server'],
\ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1



"""""""""""""
"" Mappings
""

" Fix delete in st
map <F1> <Del>

" ^S for save
nnoremap    <silent> <C-s>      :w<CR>
vnoremap    <silent> <C-s>      <C-c>:w<CR>
inoremap    <silent> <C-s>      <C-c>:w<CR>

" ^J/^K for tab switching
nnoremap    <silent> <C-k>      :bn<CR>
nnoremap    <silent> <C-j>      :bp<CR>

" ^X to close the current buffer
nnoremap    <silent> <C-x>      :Bdelete<CR>
vnoremap    <silent> <C-x>      <C-c>:Bdelete<CR>

" <Home> ignores leading whitespace
nnoremap    <silent> <Home>     ^
vnoremap    <silent> <Home>     ^
inoremap    <silent> <Home>     <C-o>^

" ^G to jump to a tag
nnoremap             <C-g>      :tselect /\C^
vnoremap             <C-g>      <C-c>:tselect /\C^
inoremap             <C-g>      <C-c>:tselect /\C^

" Easily jump to command line
nnoremap    <silent> \          :
vnoremap    <silent> \          :

" Make Y consistent with D and C
nnoremap    <silent> Y          y$

" Navigate through quickfix list
nnoremap    <silent> [q         :cp<CR>
nnoremap    <silent> ]q         :cn<CR>

" Remove hlsearch
nnoremap    <silent> <BS>       :nohlsearch<CR>

" Jump to next window
nnoremap    <silent> <Tab>      <C-w><C-w>

" Scroll half pages with pgup/dn
nnoremap    <silent> <PageUp>   <C-u>
nnoremap    <silent> <PageDown> <C-d>

" Language server features
nnoremap    <silent> gd         :<C-u>call CocAction("jumpDefinition")<CR>
nnoremap    <silent> gr         :<C-u>call CocAction("rename")<CR>
 
