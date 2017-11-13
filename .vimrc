"enable line numbers
set number

syntax on
"try to have vim recognize type of file and format accordingly
filetype indent plugin on

"case insensitive search (unless capitals used)
set ignorecase
set smartcase

"enable backspacing of different characters
set backspace=indent,eol,start
"set whichwrap+=<,>,h,l

"keep same indent of current line for different file types
set autoindent
"doesn't automatically put at start of line, not sure if I like this yet
"set nostartofline
"display cursor position
set ruler

"ask me to save changes if I mess up
set confirm

"if file is changed from outside, set to read only
set autoread

"to not have press <Enter> to continue
set cmdheight=2

"toggle paste mode with F11
set pastetoggle=<F11>

"expand tabs to spaces, convert a tab to 4 spaces
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

"indentation
set ai "auto indent
set si "smart indent
set wrap "wrapping siles

"useful for making commands quicker
let mapleader = ","
"let g:mapleader = ","

"fast save
nmap <leader>w :w!<cr>
"fast save and quit
nmap <leader>q :wq<cr>

"7 lines to the cursor for moving vertically h/j
set so=7

"disable arrow keys in command more, still learning
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"highligh search results
set hlsearch

"search QoL improvement
set incsearch

"don't redo animations during macros
set lazyredraw

"show matching brackets when hovered over
set showmatch

syntax enable

"set backup stuff off, don't like swap files etc
set nobackup
set nowb
set noswapfile

"linebreak on 120 chars
set lbr
set tw=120

"turn off highlighting on leader space
map <silent> <leader><cr> :noh<cr>

"Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"always show last status
set laststatus=2
   
"Move a line of text using ALT+[jk]
"doesn't currently work, not sure why
nnoremap <C-j> :m+<CR>==
nnoremap <C-k> :m-2<CR>==

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

"add file types as needed
if has("autocmd")
    autocmd BufWritePre *.txt,*.c,*.h,*.sh,*.git :call CleanExtraSpaces()
endif

"colorscheme
colorscheme zellner 

"menu for manouvering around fs
set wildmenu
