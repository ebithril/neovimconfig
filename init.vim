call plug#begin()

Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'

Plug 'jeetsukumaran/vim-pythonsense'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set termguicolors

colorscheme NeoSolarized
set background=dark

let g:airline_theme="solarized"
let g:airline_solarized_bg="dark"

let mapleader = ","

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> za

vnoremap . :normal.<CR>

nmap <leader>o :FZF<CR>
nmap <leader>f :ALEFix<CR>

tnoremap <Esc> <C-\><C-n>

autocmd! bufwritepost init.vim source %

au BufNewFile,BufRead *.py
	\ set expandtab 	|" replace tabs with spaces
	\ set autoindent 	|" copy indent when starting a new line
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4

au BufNewFile,Bufread *.py
	\ set foldmethod=indent

let g:ale_linters = {
	\ 'python': ['flake8', 'pylint'],
\}

let g:ale_fixers = {
	\ 'python': ['standardrb']
\}

let g:ale_fix_on_save = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
