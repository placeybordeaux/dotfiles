
set clipboard=unnamedplus
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
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

 " language support stuff
 "
 call dein#add('udalov/kotlin-vim')
 call dein#add('fatih/vim-go')
 call dein#add('neovim/nvim-lspconfig')
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

" Go stuff
let g:go_fmt_command = "goimports"    
let g:go_auto_type_info = 1   

" more LSP stuff
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'kotlin_language_server', 'intelephense'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF

" auto reload files
set autoread 
au CursorHold * checktime  

"Enable mouse
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

" for note taking
command Date :read !date

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

" To clear highlighting easily
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
nnoremap <silent> <C-CR> :TREPLSendLine<cr>

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


colorscheme PaperColor
call togglebg#map("<F5>")
