" ===============================
call plug#begin('~/.vim/plugged')

" The NERDTree is a file system explorer
    Plug 'scrooloose/nerdtree' " https://github.com/preservim/nerdtree
    map <C-n> :NERDTreeToggle<CR>
    " autocmd BufEnter * lcd %:p:h
    let NERDTreeMinimalUI=1
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeShowHidden=1
    autocmd VimEnter * NERDTree
    autocmd! VimEnter * NERDTree | wincmd w

" Status line
    Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
    " let g:gotham_airline_emphasised_insert = 0
    " let g:airline#extensions#tabline#left_alt_sep = '|'

" Цветные скобки
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1

" Автозакрытие скобок
    Plug 'Raimondi/delimitMate'

" Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    let g:go_fmt_command = "goimports"
    let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor 
    inoremap <C-Space> <C-x><C-o>
    nnoremap <F12> :GoTest<CR>
    " let g:go_def_mode='gopls'
    " let g:go_info_mode='gopls'
    au FileType go nmap <Leader>ds <Plug>(go-def-split)
    au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
    au FileType go nmap <Leader>dt <Plug>(go-def-tab)

" Отступы
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

" Git
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mhinz/vim-signify'

" Colorschemes
    Plug 'whatyouhide/vim-gotham'
    " Plug 'rakr/vim-two-firewatch'
    " Plug 'arcticicestudio/nord-vim'
    " Plug 'ayu-theme/ayu-vim'
    Plug 'dracula/vim', { 'as': 'dracula' } " https://github.com/dracula/vim
    " Plug 'NLKNguyen/papercolor-theme' " https://github.com/NLKNguyen/papercolor-theme

" Search / fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

" Cassandra CQL Syntax Highlighter
    " Plug (https://github.com/junegunn/vim-plug)
    Plug 'elubow/cql-vim'

" Jenkinsfile DSL vim syntax
    Plug 'martinda/Jenkinsfile-vim-syntax'

" Python
    Plug 'davidhalter/jedi-vim'

" Comments
    Plug 'tpope/vim-commentary'    " https://github.com/tpope/vim-commentary

" Tabs
    Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim

call plug#end()
" ===============================

" ========== Color ==========
set cursorline
set termguicolors     " enable true colors support

" colorschemes:

" dracula ----
colorscheme dracula
set background=dark

" papercolor ----
" colorscheme PaperColor
" set background=dark

" gotham ---
" colorscheme gotham
" colorscheme gotham256
" set background=dark
" let g:airline_theme='gotham' " if you have Airline installed and want the associated theme
" let g:gotham_airline_emphasised_insert = 0

" ayu ----
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" let g:airline_theme='ayu' " if you have Airline installed and want the associated theme

" two ----
" let g:two_firewatch_italics=1
" colorscheme two-firewatch
" set background=dark
" let g:airline_theme='twofirewatch' " if you have Airline installed and want the associated theme

" ========== Color end ==========


" ========== Search ==========
set ignorecase " ics - поиск без учёта регистра символов
set smartcase " - если искомое выражения содержит символы в верхнем регистре - ищет с учётом регистра, иначе - без 
set incsearch " поиск фрагмента по мере его набора

" поиск выделенного текста (начинать искать фрагмент при его выделении)
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>
" ========== Search end ==========


" ========== Seats ==========
" Автозаписть при запуске сборки
set autowrite

" Подсветка синтаксиса
syntax on

" Режим завершения
set completeopt-=preview

" Номера строк
set number

" Выделять строку с курсором
set cursorline

" Вертикальная линия 
set colorcolumn=80

set et " автозамена по умолчанию

" Использовать больше цветов в терминале
set t_Co=256

" показывать первую парную скобку после ввода второй
set showmatch

" подсвечивает все слова, которые совпадают со словом под курсором.
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

" always show signcolumns
set signcolumn=yes

" Always show current position
set ruler
" ============================== Отступы

" использовать tab, а не пробелы
set noexpandtab

" Умные отступы (например, автоотступ после {)
set smartindent

" отступы в стиле Си
set cin
"
" автоотступы для новых строк
set ai

set modeline           " enable vim modelines
set hlsearch           " highlight search items
set incsearch          " searches are performed as you type
set number             " enable line numbers
set confirm            " ask confirmation like save before quit.
set wildmenu           " Tab completion menu when using command mode
set expandtab          " Tab key inserts spaces not tabs
set softtabstop=4      " spaces to enter for each tab
set shiftwidth=4       " amount of spaces for indentation
set shortmess+=aAcIws  " Hide or shorten certain messages
set tabstop=4
set smarttab
set smartindent

let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

" system clipboard (requires +clipboard)
set clipboard^=unnamed,unnamedplus

" shows hidden characters
set invlist
" ========== Seats end ==========
