" =============================== Плагины
call plug#begin('~/.vim/plugged')

    " Дерево каталогов
    Plug 'scrooloose/nerdtree'
    map <C-n> :NERDTreeToggle<CR>
    " autocmd BufEnter * lcd %:p:h
    let NERDTreeMinimalUI=1
    autocmd StdinReadPre * let s:std_in=1
                    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let NERDTreeShowHidden=1

    " Строка статуса
    Plug 'vim-airline/vim-airline'

    " Цветные скобки
    Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1

    " Автозакрытие скобок
    Plug 'Raimondi/delimitMate'

    " Поддержка golang
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Поддержка Python
    Plug 'davidhalter/jedi-vim'
    let g:pymode_rope = 0
    let g:pymode_python = 'python3'

    Plug 'Glench/Vim-Jinja2-Syntax'

    Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
    let g:pymode_lint_on_write = 1
    let g:pymode_lint_unmodified = 0
    let g:pymode_lint_on_fly = 0

    " Отступы
    Plug 'Yggdroot/indentLine'


    " Подсветка синтаксиса Dockerfile
    Plug 'ekalinin/dockerfile.vim'
    Plug 'skanehira/docker-compose.vim'

    " Автодополнение
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " Автозаписть при запуске сборки
    set autowrite
    "Plug 'AndrewRadev/splitjoin.vim'

    " Цветовая схема
    " Plug 'joshdick/onedark.vim'
    " Plug 'dracula/vim'
    " Plug 'morhetz/gruvbox'
    " Plug 'tyrannicaltoucan/vim-deep-space'
    " Plug 'ajmwagar/vim-deus'
    Plug 'whatyouhide/vim-gotham'

    " Анализатор кода
    Plug 'w0rp/ale'

    " Поддержка C
    Plug 'vim-scripts/c.vim'

    " Plug 'chase/vim-ansible-yaml'
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    filetype on
    Plug 'pearofducks/ansible-vim'
    let g:ansible_extra_keywords_highlight = 1
    let g:ansible_name_highlight = 'b'
    let g:ansible_template_syntaxes = { '*.yml.j2': 'yaml' }
    let g:ansible_template_syntaxes = { '*.yaml.j2': 'yaml' }

    Plug 'neomake/neomake'

    " Функционал git
    "Plug 'airblade/vim-gitgutter'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'mhinz/vim-signify'

    " Поиск кода
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Nicer scrolling
    Plug 'psliwka/vim-smoothie'

    " Split and join programming lines
    Plug 'AndrewRadev/splitjoin.vim'

    " Startup screen
    Plug 'mhinz/vim-startify'


call plug#end()

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

" tab
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

" =============================== Клавиши

" exit to normal mode with 'jj'
inoremap jj <ESC>


" =============================== Настройки поиска
set ignorecase " ics - поиск без учёта регистра символов
set smartcase " - если искомое выражения содержит символы в верхнем регистре - ищет с учётом регистра, иначе - без 
set incsearch " поиск фрагмента по мере его набора

" поиск выделенного текста (начинать искать фрагмент при его выделении)
vnoremap <silent>* <ESC>:call VisualSearch()<CR>/<C-R>/<CR>
vnoremap <silent># <ESC>:call VisualSearch()<CR>?<C-R>/<CR>


" Sane vim defaults for ArchLabs

scriptencoding utf8

" Arch defaults
runtime! archlinux.vim

" system clipboard (requires +clipboard)
set clipboard^=unnamed,unnamedplus

" additional settings
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

let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

" ------ leader mapping ------

let g:mapleader = "\<Space>"

" ------ enable additional features ------

" enable mouse
set mouse=a
if has('mouse_sgr')
    " sgr mouse is better but not every term supports it
    set ttymouse=sgr
endif

" syntax highlighting
syntax enable

set linebreak breakindent
set list listchars=tab:>>,trail:~

" midnight, night, or day
"let g:jinx_theme = 'midnight'

"try
""    colorscheme jinx
"catch
""    colorscheme slate
"endtry

if $TERM !=? 'linux'
    set termguicolors
    " true colors in terminals (neovim doesn't need this)
    if !has('nvim') && !($TERM =~? 'xterm' || &term =~? 'xterm')
        let $TERM = 'xterm-256color'
        let &term = 'xterm-256color'
    endif
    if has('multi_byte') && $TERM !=? 'linux'
        set listchars=tab:»»,trail:•
        set fillchars=vert:┃ showbreak=↪
    endif
endif

" change cursor shape for different editing modes, neovim does this by default
if !has('nvim')
    if exists('$TMUX')
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
        let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
    else
        let &t_SI = "\e[6 q"
        let &t_SR = "\e[4 q"
        let &t_EI = "\e[2 q"
    endif
endif

" ------ commands ------

command! D Explore
command! R call <SID>ranger()
command! Q call <SID>quitbuffer()
command! -nargs=1 B :call <SID>bufferselect("<args>")
command! W execute 'silent w !sudo tee % >/dev/null' | edit!

" ------ basic maps ------

" run python code
" nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
autocmd BufWinEnter *.py nnoremap <F9> :w<CR>:!python3 %:p<CR>

" Autofix PEP8 errors
nnoremap <leader>pp :PymodeLintAuto<CR>

" open ranger as a file chooser using the function below
nnoremap <leader>r :call <SID>ranger()<CR>

" match string to switch buffer
nnoremap <Leader>b :let b:buf = input('Match: ')<Bar>call <SID>bufferselect(b:buf)<CR>

" change windows with ctrl+(hjkl)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" alt defaults
nnoremap 0 ^
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Tab> ==1j

" re-visual text after changing indent
vnoremap > >gv
vnoremap < <gv

" toggle line numbers, nn (no number)
nnoremap <silent> <Leader>nn :set number!

" gj/k but preserve numbered jumps ie: 12j or 45k
nmap <buffer><silent><expr>j v:count ? 'j' : 'gj'
nmap <buffer><silent><expr>k v:count ? 'k' : 'gk'

" open a terminal in $PWD
nnoremap <silent> <Leader>tt :terminal<CR>

" tab control
nnoremap <silent> <M-j> :tabmove -1<CR>
nnoremap <silent> <M-k> :tabmove +1<CR>
nnoremap <silent> <Leader>te :tabnew<CR>
nnoremap <silent> <Leader>tn :tabnext<CR>
nnoremap <silent> <Leader>tf :tabfirst<CR>
nnoremap <silent> <Leader>tp :tabprevious<CR>

" close current buffer and/or tab
nnoremap <silent> <Leader>q :B<CR>:silent tabclose<CR>gT

" open a new tab in the current directory with netrw
nnoremap <silent> <Leader>- :tabedit <C-R>=expand("%:p:h")<CR><CR>

" split the window vertically and horizontally
nnoremap _ <C-W>s<C-W><Down>
nnoremap <Bar> <C-W>v<C-W><Right>

" new tab
nnoremap ,t :tabnew<CR>

" ------ autocmd ------

" Reload changes if file changed outside of vim requires autoread
augroup load_changed_file
    autocmd!
    autocmd FocusGained,BufEnter * if mode() !=? 'c' | checktime | endif
    autocmd FileChangedShellPost * echo "Changes loaded from source file"
augroup END

" when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" when not running in a console or a terminal that doesn't support 256 colors
" enable cursorline in the currently active window and disable it in inactive ones
if $DISPLAY !=? '' && &t_Co == 256
    augroup cursorline
        autocmd!
        autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline
    augroup END
endif

" ------ adv maps ------


" strip trailing whitespace, ss (strip space)
nnoremap <silent> <Leader>ss
    \ :let b:_p = getpos(".") <Bar>
    \  let b:_s = (@/ != '') ? @/ : '' <Bar>
    \  %s/\s\+$//e <Bar>
    \  let @/ = b:_s <Bar>
    \  nohlsearch <Bar>
    \  unlet b:_s <Bar>
    \  call setpos('.', b:_p) <Bar>
    \  unlet b:_p <CR>

" global replace
vnoremap <Leader>sw "hy
    \ :let b:sub = input('global replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
    \   execute '%s/'.b:rep."/".b:sub.'/g' <Bar>
    \   unlet b:sub b:rep <Bar>
    \ endif <CR>
nnoremap <Leader>sw
    \ :let b:sub = input('global replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   execute "%s/<C-r><C-w>/".b:sub.'/g' <Bar>
    \   unlet b:sub <Bar>
    \ endif <CR>

" prompt before each replace
vnoremap <Leader>cw "hy
    \ :let b:sub = input('interactive replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   let b:rep = substitute(getreg('h'), '/', '\\/', 'g') <Bar>
    \   execute '%s/'.b:rep.'/'.b:sub.'/gc' <Bar>
    \   unlet b:sub b:rep <Bar>
    \ endif <CR>

nnoremap <Leader>cw
    \ :let b:sub = input('interactive replacement: ') <Bar>
    \ if b:sub !=? '' <Bar>
    \   execute "%s/<C-r><C-w>/".b:sub.'/gc' <Bar>
    \   unlet b:sub <Bar>
    \ endif <CR>

" highlight long lines, ll (long lines)
let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth)
nnoremap <silent> <Leader>ll
    \ :if exists('w:longlines') <Bar>
    \   silent! call matchdelete(w:longlines) <Bar>
    \   echo 'Long line highlighting disabled'
    \   <Bar> unlet w:longlines <Bar>
    \ elseif &textwidth > 0 <Bar>
    \   let w:longlines = matchadd('ColorColumn', '\%'.&textwidth.'v', &textwidth) <Bar>
    \   echo 'Long line highlighting enabled'
    \ <Bar> else <Bar>
    \   let w:longlines = matchadd('ColorColumn', '\%80v', 81) <Bar>
    \   echo 'Long line highlighting enabled'
    \ <Bar> endif <CR>

" local keyword jump
nnoremap <Leader>fw
    \ [I:let b:jump = input('Go To: ') <Bar>
    \ if b:jump !=? '' <Bar>
    \   execute "normal! ".b:jump."[\t" <Bar>
    \   unlet b:jump <Bar>
    \ endif <CR>


" quit the current buffer and switch to the next
" without this vim will leave you on an empty buffer after quiting the current
function! <SID>quitbuffer() abort
    let l:bf = bufnr('%')
    let l:pb = bufnr('#')
    if buflisted(l:pb)
        buffer #
    else
        bnext
    endif
    if bufnr('%') == l:bf
        new
    endif
    if buflisted(l:bf)
        execute('bdelete! ' . l:bf)
    endif
endfunction

" switch active buffer based on pattern matching
" if more than one match is found then list the matches to choose from
function! <SID>bufferselect(pattern) abort
    let l:bufcount = bufnr('$')
    let l:currbufnr = 1
    let l:nummatches = 0
    let l:matchingbufnr = 0
    " walk the buffer count
    while l:currbufnr <= l:bufcount
        if (bufexists(l:currbufnr))
            let l:currbufname = bufname(l:currbufnr)
            if (match(l:currbufname, a:pattern) > -1)
                echo l:currbufnr.': '.bufname(l:currbufnr)
                let l:nummatches += 1
                let l:matchingbufnr = l:currbufnr
            endif
        endif
        let l:currbufnr += 1
    endwhile

    " only one match
    if (l:nummatches == 1)
        execute ':buffer '.l:matchingbufnr
    elseif (l:nummatches > 1)
        " more than one match
        let l:desiredbufnr = input('Enter buffer number: ')
        if (strlen(l:desiredbufnr) != 0)
            execute ':buffer '.l:desiredbufnr
        endif
    else
        echoerr 'No matching buffers'
    endif
endfunction

" open ranger as a file chooser
function! <SID>ranger()
    let l:temp = tempname()
    execute 'silent !xterm -e ranger --choosefiles='.shellescape(l:temp).' $PWD'
    if !filereadable(temp)
        redraw!
        return
    endif
    let l:names = readfile(l:temp)
    if empty(l:names)
        redraw!
        return
    endif
    execute 'edit '.fnameescape(l:names[0])
    for l:name in l:names[1:]
        execute 'argadd '.fnameescape(l:name)
    endfor
    redraw!
endfunction

"Цветовая схема
set cursorline
set background=dark
set termguicolors
" colorscheme deep-space
" colorscheme deus
" let g:deepspace_italics=1
" let g:airline_theme='deep_space'
" colorscheme onedark
" colorscheme gotham
colorscheme gotham256
let g:gotham_airline_emphasised_insert = 0
let g:airline_theme='gotham'
