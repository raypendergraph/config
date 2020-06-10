"vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'nvie/vim-flake8'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
call plug#end()

"-------------------
"---------- Settings
"-------------------
syntax on
set colorcolumn=120
set cursorline
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set nobackup
set noswapfile
set nowritebackup
set nowrap
set relativenumber
set shiftwidth=4
set showmatch
set smartcase
set smartindent
set tabstop=4 softtabstop=4
set undodir=~/.vimundo
set undofile

if executable('rg')
    let g:rg_derive_root='true'
endif

let ideleader = " "
"gruvbox==============================================================
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

"fzf==================================================================
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

"vimdiff==============================================================
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red:w


"Flake================================================================
let python_highlight_all=1

"vim-go================================================================
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_bin_path = expand("$GOROOT/bin")
let g:go_code_completion_enabled = 0


"coc===================================================================
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=auto:2

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <ideleader> pi <Plug>(coc-diagnostic-prev)
nmap <silent> <ideleader> ni <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <ideleader> jd <Plug>(coc-definition)
nmap <silent> <ideleader> jt <Plug>(coc-type-definition)
nmap <silent> <ideleader> ji <Plug>(coc-implementation)
nmap <silent> <ideleader> jr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
" Symbol renaming.
nmap <ideleader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <ideleader>fm  <Plug>(coc-format-selected)
nmap <ideleader>fm <Plug>(coc-format-selected)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <ideleader>a  <Plug>(coc-codeaction-selected)
nmap <ideleader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <ideleader>ab  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <ideleader>qf  <Plug>(coc-fix-current)
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <ideleader> ld  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <ideleader> le  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <ideleader> lc  :<C-u>CocList commands<cr>
" Find symbol of  document.
nnoremap <silent> <ideleader> lo  :<C-u>CocList outline<cr>
" Search workspaces.
nnoremap <silent> <ideleader> ls  :<C-u>CocList -I symbols<cr>
" Do default action next item.
nnoremap <silent> <ideleader> j  :<C-u>CocNext<CR>
" Do default action previous item.
nnoremap <silent> <ideleader> k  :<C-u>CocPrev<CR>
" Resume latest co 
nnoremap <silent> <ideleader> rs  :<C-u>CocListResume<CR>

