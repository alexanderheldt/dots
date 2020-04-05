" see https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim for inspiration

" Don't keep netrw history
let g:netrw_dirhistmax=0

" Detect filetype; load plugins and indent for them
filetype plugin indent on

syntax on

" If hidden is not set, TextEdit might fail
set hidden

" Some language servers have issues with backup files
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000
set updatetime=300

" Don't give |ins-completion-menu| messages
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" No beeps on error
set noerrorbells

" Flash on error
set visualbell

" Show line numbers
set number

" Hilight current line
set cursorline

" Line wrapping with margin
set wrap
set wrapmargin=8

" Only wrap on linebreaks
set linebreak

" Don't redraw screen when executing macros
set lazyredraw

" Better indentation
set autoindent
set smartindent

" Inset 4 spaces when pressing tab
set expandtab
set softtabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Show existing tab with 4 spaces width
set tabstop=4

" TODO what does this do?
set backspace=indent,eol,start

" More natural splitting
set splitbelow
set splitright
