
set clipboard=unnamedplus
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('kassio/neoterm')
 call dein#add('tpope/vim-fugitive')
 call dein#add('scrooloose/nerdtree')
 call dein#add('vim-scripts/xoria256.vim')
 call dein#add('altercation/vim-colors-solarized')
 call dein#add('nightsense/snow')
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('NLKNguyen/papercolor-theme')
 call dein#add('motus/pig.vim')
 call dein#add('preservim/nerdtree')
 call dein#end()
 call dein#save_state()
endif
" OSX stuff
"set nocompatible
"set term=builtin_ansi
" Mostly python stuff
" tabs
set expandtab
set shiftwidth=2
set softtabstop=2 expandtab
set tabstop=2

" auto reload files
set autoread 
au CursorHold * checktime  

set mouse=a

" for setting buffer name to termtitle
if has('nvim')
    function TermTitle()
        if exists('b:term_title')
            return b:term_title
        else
            return bufname('%')
        endif
    endfunction
    autocmd TermOpen * setlocal statusline=%{TermTitle()}
endif

" for setting the dir to where I cd'ed
augroup dirchange
    autocmd!
    autocmd DirChanged * let &titlestring=v:event['cwd']
augroup END

" this might be redudant
set title
autocmd BufEnter * let &titlestring = expand("%:t")

command Date :read !date
nmap <F6> 1g?}<CR>V%yGGo<ESC>:read !date<CR>p

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
" easier copy and paste
nnoremap <C-y> "+y
vnoremap <C-y> "+y

" keep the tab mgmt in vim!
nnoremap <C-S-T> :tabe<CR>:term<CR>
vnoremap <C-S-T> :tabe<CR>:term<CR>
tnoremap <C-S-T> <C-\><C-n>:tabe<CR>:term<CR>
inoremap <C-S-T> <C-\>:tabe<CR>:term<CR>

tnoremap <C-a> <C-\><C-n>:split<CR><C-\><C-n>:term<CR>
tnoremap <C-S-s> <C-\><C-n>:vs<CR><C-\><C-n>:term<CR>

" to avoid <Esc>
imap asdf <Esc>
tnoremap asdf <C-\><C-n>
nnoremap <CR> :noh<CR><CR>

" For buffer switching
tnoremap <A-n> <C-\><C-n> :bn<CR>
tnoremap <A-p> <C-\><C-n> :bp<CR>
nnoremap <A-n> :bn<CR>
nnoremap <A-p> :bp<CR>

let g:neoterm_default_mod = 'belowright'
let g:neoterm_autoscroll = 1
let g:terminal_scrollback_buffer_size=1000000
" for moving around
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-,> <C-\><C-n>gT
tnoremap <A-.> <C-\><C-n>gt
nnoremap <A-,> gT
nnoremap <A-.> gt
inoremap <A-,> <Esc>gT
inoremap <A-.> <Esc>gt

inoremap <C-BS> <Esc>dbi

nnoremap <f12> :set scrollback=100<CR>:sleep 1<CR>:set scrollback=10000<CR>

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

nnoremap <silent> <f7> Vi`:TREPLSendSelection<cr>
vnoremap <silent> <f8> Vi{jOk:TREPLSend<cr>
nnoremap <silent> <f8> Vi{jOk:TREPLSend<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

nnoremap U :redo<CR>

" Switch on filetype detection and loads 
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent
syntax on " Turn on syntax highligthing
set showmatch  "Show matching bracets when text indicator is over them

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"Stuff from Vim after 11 years
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
nmap j gj
nmap k gk

" switches between the last buffers with <C-e>
nmap <C-e> :e#<CR>

set incsearch
set ignorecase
set smartcase

"nerdtree stuff
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" Some Linux distributions set filetype in /etc/vimrc.
" " Clear filetype flags before changing runtimepath to force Vim to reload
" them.
" golang stuff


""might be defunct
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || $TERM == "xterm-color"
  set t_Co=256
  set termguicolors
  ""let g:terminal_color_0  = '#2e3436'
  ""let g:terminal_color_1  = '#cc0000'
  ""let g:terminal_color_2  = '#4e9a06'
  ""let g:terminal_color_3  = '#c4a000'
  ""let g:terminal_color_4  = '#3465a4'
  ""let g:terminal_color_5  = '#75507b'
  ""let g:terminal_color_6  = '#0b939b'
  ""let g:terminal_color_7  = '#d3d7cf'
  ""let g:terminal_color_8  = '#555753'
  ""let g:terminal_color_9  = '#ef2929'
  ""let g:terminal_color_10 = '#8ae234'
  ""let g:terminal_color_11 = '#fce94f'
  ""let g:terminal_color_12 = '#729fcf'
  ""let g:terminal_color_13 = '#ad7fa8'
  ""let g:terminal_color_14 = '#00f5e9'
  ""let g:terminal_color_15 = '#eeeeec'
endif

set termguicolors
set t_Co=256
set background=dark
colorscheme PaperColor
call togglebg#map("<F5>")
