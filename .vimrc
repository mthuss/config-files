colorscheme gruvbox
set background=dark
syntax on
set number
set wildmenu
set wildmode=list:longest
set incsearch
set number relativenumber
set undofile
set undodir=$HOME/.vimundo
set hlsearch
set ttyfast

"Keymaps
inoremap jj <esc>
noremap <F5> :w<CR>:!gcc %<CR>:rightb vert term<CR>./a.out<CR>
noremap <C-t> :rightb vert term<CR>

"Functions
function InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\<tab>"
else
return "\<c-p>"
endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ row:\ %l\ col:\ %c

" Show the status on the second to last line.
set laststatus=2

"Statusline color
hi StatusLine ctermbg=white ctermfg=97
" }}}
