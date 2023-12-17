" ===============================
" Plugin Manager
call plug#begin('~/.vim/plugged')

" File System Explorer
Plug 'scrooloose/nerdtree'
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Status Line
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Colorful Brackets
Plug 'luochen1990/rainbow'

" Autoclose Brackets
Plug 'Raimondi/delimitMate'

" Golang Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
inoremap <C-Space> <C-x><C-o>
nnoremap <F12> :GoTest<CR>
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>r  <Plug>(go-run)

" Indentation Lines
Plug 'Yggdroot/indentLine'

" Dockerfile
Plug 'ekalinin/dockerfile.vim'
Plug 'skanehira/docker-compose.vim'

" Ansible
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
filetype on
Plug 'pearofducks/ansible-vim'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_name_highlight = 'b'
let g:ansible_template_syntaxes = { 'yml.j2': 'yaml' }
let g:ansible_template_syntaxes = { 'yaml.j2': 'yaml' }

" Git Plugins
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'

" Color Schemes
Plug 'whatyouhide/vim-gotham'
Plug 'rakr/vim-two-firewatch'
Plug 'ayu-theme/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'folke/tokyonight.nvim'
" Plug 'ellisonleao/gruvbox.nvim'
Plug 'morhetz/gruvbox'

" Search and FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Cassandra CQL Syntax Highlighter
Plug 'elubow/cql-vim'

" Jenkinsfile DSL Vim Syntax
Plug 'martinda/Jenkinsfile-vim-syntax'

" Python
Plug 'davidhalter/jedi-vim'

" Comments
Plug 'tpope/vim-commentary'

" Tabs
Plug 'mkitt/tabline.vim'

Plug 'hashivim/vim-terraform'

call plug#end()
" ===============================

" ========== Color ==========
set cursorline
set termguicolors

" Color Scheme
" colorscheme ayu
" let ayucolor = "dark"
" let g:airline_theme = 'ayu'

" colorscheme PaperColor
" set background=dark
set number
set laststatus=2
" let g:airline_theme='papercolor'
" let g:airline_theme='gotham256' " if you have Airline installed and want the associated theme

" colorscheme tokyonight-night

" gruvbox
set background=dark " or light if you want light mode
colorscheme gruvbox

" ========== Color end ==========

" ========== Search ==========
set ignorecase
set smartcase
set incsearch
" Search Selected Text
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>
" ========== Search end ==========


" ========== Seats ==========
set autowrite             " Automatically save files before running commands
syntax on                 " Enable syntax highlighting
set completeopt-=preview  " Disable completion preview window
set number                " Show line numbers
set cursorline            " Highlight the current line
set colorcolumn=80        " Display a vertical line at column 80
set et                    " Use expandtab (replace tabs with spaces)
set t_Co=256              " Enable 256-color support
set invlist               " Show invisible characters (e.g., tabs and line endings)
set hlsearch              " Highlight the current word under the cursor
set clipboard^=unnamed,unnamedplus  " Use system clipboard for copy and paste
" ========== Seats end ==========
