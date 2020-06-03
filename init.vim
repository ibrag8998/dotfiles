" ===============
" === Plugins ===
" ===============

call plug#begin()

" Coc completer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Emmet
Plug 'mattn/emmet-vim'

" Django
Plug 'tweekmonster/django-plus.vim'

" TOML
Plug 'cespare/vim-toml'

" Multicursors
Plug 'terryma/vim-multiple-cursors'

" Hoogle search
Plug 'Twinside/vim-hoogle'

" Python indents
Plug 'Vimjas/vim-python-pep8-indent'

" Surrounding brackets quotes etc management
Plug 'tpope/vim-surround'

" Raindow parentheses
Plug 'kien/rainbow_parentheses.vim'

" Haskell indents
Plug 'alx741/vim-hindent'

" ALE - Asynchronous Linting Engine
Plug 'dense-analysis/ale'

" Haskell
Plug 'neovimhaskell/haskell-vim'

" `gcc` to comment line, `gc` to comment selection
Plug 'tpope/vim-commentary'

" Statusline
Plug 'vim-airline/vim-airline'

" Git changes real time in vim
Plug 'airblade/vim-gitgutter'

" Code folding
Plug 'tmhedberg/SimpylFold'

" Ctrl-p
Plug 'kien/ctrlp.vim'

" NERDTree file browser
Plug 'preservim/nerdtree'

" Auto pairs () [] ''
Plug 'jiangmiao/auto-pairs'

" Run git commands in vim
Plug 'tpope/vim-fugitive'

" Colorschemes
Plug 'morhetz/gruvbox'              " Good
Plug 'junegunn/seoul256.vim'        " Best for python, bad for haskell
Plug 'juanpabloaj/vim-pixelmuerto'  " Not so much colors
Plug 'mbbill/vim-seattle'           " Bad for haskell
Plug 'AlessandroYorba/Sierra'       " Bad for haskell, good for others
Plug 'jacoborus/tender.vim'         " Bright

" to pick up new colorscheme
" Plug 'flazz/vim-colorschemes'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-colorscheme-switcher'

call plug#end()

colorscheme tender


" ==========================
" === Plugin Configuring ===
" ==========================

let g:ale_fixers = {
    \ 'python': ['yapf'],
    \ 'haskell': ['hindent'],
    \ 'rust': ['rustfmt'],
    \ 'javascript': ['prettier']
  \ }

let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'haskell': ['hlint']
  \ }

let g:ale_fix_on_save = 1

" idk
let g:airline#extensions#whitespace#enabled = 1

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

" 233 - darkest, 239 - lightest
"let g:seoul256_background = 237

let g:coc_snippet_next = '<tab>'

let g:haskell_classic_highlighting = 1

let g:user_emmet_leader_key = '<leader>'


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

" Column at 80 chars
set colorcolumn=80

" Highlight line where cursor is on
set cursorline

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

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

" Guide on how to disable matching ExtraWhitespace.
" 'onedark': 235
" 'seoul': 237
" 'gruvbox': 235
" highlight ExtraWhitespace ctermbg=236
" match ExtraWhitespace /\s\+$/
" au BufEnter * match ExtraWhitespace /\s\+$/

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

" Format the status line
"set statusline=\ %{HasPaste()}%f%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" ================
" === Mappings ===
" ================

" Moving around splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Folding
nnoremap <space> za

" 0 and home to first non-blank char
map 0 ^
map <home> ^
imap <home> <Esc>I

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" tab for coc completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Enter to select completion or snippet
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
    \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

map ? ddkk

" Toggle NERDTree
map <leader>n :NERDTreeFocus<cr>

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

" GoTo code navigation.
nmap <silent> <F4> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Terminal mode exit shortcut
tnoremap <Esc> <C-\><C-n>


" ======================
" === Language setup ===
" ======================

" Python
au BufNewFile,BufRead *.py call s:python_setup()

" C
au BufNewFile,BufRead *.c call s:c_setup()

" Rust
au BufNewFile,BufRead *.rs call s:rust_setup()

" Haskell
au BufNewFile,BufRead *.hs call s:haskell_setup()

" Languages that uses 4 spaces instead of 2
au BufNewFile,BufRead *.py,*.c,*.rs call s:four_spaces()

" Delete trailing whitespaces on save
au BufWritePre *.py,*.js,*.sh,*.hs,*.c,*.cpp :call CleanExtraSpaces()

" Markdown automatic line breaking
au BufNewFile,BufRead *.md set tw=79


" =============
" === Other ===
" =============

" Remove completion preview
set completeopt-=preview

" Remove trailing whitespaces on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:python_setup()
  " Run current buffer
  map <leader>r :! python %:p<cr>
endfunction

function! s:c_setup()
  " Compile and run current buffer in vim cmd section
  map <leader>r :! gcc %:p<cr>:! ./a.out<cr>
  " Compile and run current buffer in vim embedded terminal
  map <leader>s :! gcc %:p<cr>:terminal<cr>i./a.out<cr>
endfunction

function! s:rust_setup()
  " Run current project
  map <leader>r :! cargo run<cr>
  " Check current project
  map <leader>c :! cargo check<cr>
endfunction

function! s:haskell_setup()
  " Run current buffer in GHCi
  map <leader>r :terminal<cr>ighci<cr>
  " Hoogle
  map <leader>h :Hoogle<space>
endfunction

function! s:four_spaces()
  setlocal ts=4 sts=4 sw=4
endfunction
