call plug#begin()

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

set termguicolors

colorscheme NeoSolarized
set background=dark

let g:airline_theme="solarized"

let mapleader = ","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

vnoremap . :normal.<CR>

nmap <leader>o :FZF<CR>

autocmd! bufwritepost init.vim source %
