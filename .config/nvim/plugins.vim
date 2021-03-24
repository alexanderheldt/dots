call plug#begin('~/.config/nvim/plugged')
Plug 'alexanderheldt/monokrom.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'maxmellon/vim-jsx-pretty'

Plug 'vimwiki/vimwiki'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'editorconfig/editorconfig-vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()
