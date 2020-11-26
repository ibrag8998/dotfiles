" ===============
" === Plugins ===
" ===============

call plug#begin()

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Surround plugin
Plug 'tpope/vim-surround'

" Ripgrep in vim
Plug 'jremmen/vim-ripgrep'

" Multicursors
Plug 'terryma/vim-multiple-cursors'

" Python indents
Plug 'Vimjas/vim-python-pep8-indent'

" Raindow parentheses
Plug 'kien/rainbow_parentheses.vim'

" `gcc` to comment line, `gc` to comment selection
Plug 'tpope/vim-commentary'

" Statusline
Plug 'vim-airline/vim-airline'

" FZF searcher
Plug 'junegunn/fzf'

" Git changes real time in vim
Plug 'airblade/vim-gitgutter'

" Code folding
Plug 'tmhedberg/SimpylFold'

" NERDTree file browser
Plug 'preservim/nerdtree'

" Run git commands in vim
Plug 'tpope/vim-fugitive'


" ====================
" === Colorschemes ===
" ====================

" codedark
Plug 'tomasiser/vim-code-dark'

" gruvbox
" Plug 'morhetz/gruvbox'

" seoul256
" Plug 'junegunn/seoul256.vim'

" pixelmuerto
" Plug 'juanpabloaj/vim-pixelmuerto'

" seattle
" Plug 'mbbill/vim-seattle'

" sierra
" Plug 'AlessandroYorba/Sierra'

" tender
" Plug 'jacoborus/tender.vim'

call plug#end()

colorscheme codedark


" ==========================
" === Plugin Configuring ===
" ==========================

" Show hidden files in directory tree
let g:NERDTreeShowHidden=1

" codedark theme for airline
let g:airline_theme = 'codedark'

" dope powerline fonts
let g:airline_powerline_fonts = 1

" disable section about fileformat
let g:airline_section_y = ''

" Configure bloated section about current position
let g:airline_section_z = '%p%% %#__accent_bold#%l/%L%#__restore__# %c'

" disable filetype section
let g:airline_section_x = ''

" this is the default airline_section_c, but i removed some unneeded stuff.
let g:airline_section_c = '%<%<%{airline#extensions#fugitiveline#bufname()}%m
\ %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'


" ===================
" === Configuring ===
" ===================

set history=500

filetype plugin on
filetype indent on

" Autoread when file changes from the outside
set autoread

au FocusGained,BufEnter * checktime

" :W sudo save
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set encoding=UTF-8

set fileformat=unix

set updatetime=100

set hidden

" coc
set shortmess+=c

set clipboard+=unnamedplus


" ==========
" === UI ===
" ==========

" Highlight line where cursor is on
set cursorline

" Set 12 lines to the cursor
set so=12

" Idk
set ruler

" Command line height
set cmdheight=2

set backspace=eol,start,indent

set whichwrap=<,>,h,l

" When searching
set ignorecase

" Try to be smart about cases when searching
set smartcase

" Highlight search results
set hlsearch

" Makes search act like in browser
set incsearch

" Don't redraw when executing macros
set lazyredraw

" For regex
set magic

" Show matching brackets
set showmatch

" No sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Line numeraions
set nu

" Relative numbers
set relativenumber

set foldmethod=indent
set foldlevel=99

" Side column for linters and git difference
set signcolumn=yes

" Rainbow Parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ========================
" === Colors and fonts ===
" ========================

syntax enable
syntax on

" ====================
" === Backup, Undo ===
" ====================

" It is all in git
set nobackup
set nowb
set noswapfile


" ===================
" === Indentation ===
" ===================

set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set wrap


" ===================
" === Visual Mode ===
" ===================

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Fast  comment selection
vmap / gc


" ===================
" === Status line ===
" ===================

" Always show the status line
set laststatus=2


" ================
" === Mappings ===
" ================

" Moving around splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Code movements
map <C-A-Right> <C-i>
map <C-A-Left> <C-o>

" FZF search ctrl-p
map <C-p> :FZF<cr>

" Folding
nnoremap <space> za

" home to first non-blank char
map <home> ^
imap <home> <Esc>I

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Toggle NERDTree
map <leader>n :NERDTreeFocus<cr>:NERDTreeRefreshRoot<cr>

" Open terminal in vim
map <leader>t :terminal<cr>

" Disable highlights
map <leader><space> :noh<CR>

" Echo current buffer (relative path)
map <leader>f :echo @%<cr>

" Quick Git commands (vim-fugitive plugin required)
map <leader>g :Git<space>

" Quick save
map <leader>w :w<cr>

" Quick open
map <leader>e :e<space>

" Quick quit
map <leader>q :q<cr>

" Quick comment one line
map <leader>/ gcc

" Quick open buffer
map <leader>b :ls<cr>:b<space>

" Terminal mode exit shortcut
tnoremap <Esc> <C-\><C-n>


" ======================
" === Language setup ===
" ======================

" Python
au BufNewFile,BufRead *.py call s:python_setup()

" Languages that uses 4 spaces instead of 2
au BufNewFile,BufRead *.py call s:four_spaces()

" Markdown automatic line breaking
au BufNewFile,BufRead *.md set tw=120

" JSONC comment matching
au FileType json syntax match Comment +\/\/.\+$+


" =============
" === Other ===
" =============

" Remove completion preview
set completeopt-=preview

" Used for some visual mode mappings
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! s:python_setup()
  " Run current buffer
  map <leader>r :! python %:p<cr>
endfunction

function! s:four_spaces()
  setlocal ts=4 sts=4 sw=4
endfunction
