colorscheme gruvbox
set background=dark
syntax on
set number
set wildmenu
set wildmode=list:longest
set incsearch
set number relativenumber
set undofile
set undodir=$HOME/.vimundo/
set hlsearch
set ttyfast

"Misc Keymaps
inoremap jj <esc>
noremap <F3> :set hlsearch!<CR>	
noremap <F5> :w<CR>:!gcc % -o %< && ./%<<CR>
noremap c 0i//<esc>

"Open terminal in specific directions
noremap <C-t>l :rightb vert term<CR>
noremap <C-t>h :vert term<CR>
noremap <C-t>j :below term<CR>
noremap <C-t>k :term<CR>
noremap <C-t>t :botright term<CR>

"Keymaps for managing windows
noremap <C-n> :rightb vert split<CR>
noremap - <C-w><
noremap = <C-w>>
noremap + <C-w>-
noremap _ <C-w>+
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

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
