inoremap jk <Esc>
nnoremap j jzz
nnoremap k kzz

" Make yanked text stay in system clipboard
nnoremap yy "+yy 

" Make yanked lines stay in system clipboard
nnoremap Y "+Y 

" Make deleted lines stay in system clipboard
nnoremap dd "_dd 
nnoremap D "_D 

" Make deleted characters stay in system clipboard
nnoremap x "_x 
nnoremap X "_X 

" Select entire file
nnoremap <space>aa ggVG
