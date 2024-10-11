inoremap jk <Esc>
nnoremap j jzz
nnoremap k kzz

" Select entire file
nnoremap <space>aa ggVG

" Make clipboard keep content when pasting
vnoremap p P

" Map Alt+Up to move the current line up
nnoremap <M-Up> :m .-2<CR>==
inoremap <M-Up> <Esc>:m .-2<CR>==gi
vnoremap <M-Up> :m '<-2<CR>gv=gv

" Map Alt+Down to move the current line down
nnoremap <M-Down> :m .+1<CR>==
inoremap <M-Down> <Esc>:m .+1<CR>==gi
vnoremap <M-Down> :m '>+1<CR>gv=gv

" Map Alt+k to move the current line up
" nnoremap <M-k> :m .-2<CR>==
" inoremap <M-k> <Esc>:m .-2<CR>==gi
" vnoremap <M-k> :m '<-2<CR>gv=gv

" Map Alt+j to move the current line down
" nnoremap <M-j> :m .+1<CR>==
" inoremap <M-j> <Esc>:m .+1<CR>==gi
" vnoremap <M-j> :m '>+1<CR>gv=gv

nnoremap J 15j
nnoremap K 15k

" nnoremap s <Plug>(easymotion-bd-f)
nnoremap s <leader><leader>s

set clipboard=unnamedplus
