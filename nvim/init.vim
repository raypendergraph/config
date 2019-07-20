"vim-plug
call plug#begin('~/.config/nvim/plugged')
" Environment plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Python

Plug 'nvie/vim-flake8'

let NERDTreeIgnore=['\.pyc$', '\~$']
" git 
Plug 'tpope/vim-fugitive'

" syntastic - General syntax highlighting
Plug 'vim-syntastic/syntastic'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()


"-------------------
"---------- Settings
"-------------------

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

" vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red:w


" nvim
" -- Whitespace
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set si
set laststatus=2
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

" -- Searching
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase

" -- Status
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set number
set statusline=0


syntax on
filetype plugin indent on

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Flake    
let python_highlight_all=1

" airline
let g:bufferline_echo = 0
let s:hidden_all = 1
highlight LineNr ctermfg=grey ctermbg=black
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1


" ----- Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" ----- Enable integration with airline.
let g:airline#extensions#ale#enabled = 1


" =========
" Mappings
" =========
map <C-\> :NERDTreeToggle<CR>
