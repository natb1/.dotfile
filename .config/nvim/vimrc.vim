set expandtab
set shiftwidth=2
set tabstop=2
set autoindent 

set number
set relativenumber
set foldmethod=indent
set foldcolumn=4

" bufdo :args % ##

map <leader>s :source %<CR>

inoremap <leader><leader> <Esc>
inoremap $$ <Esc>$
inoremap OO <Esc>O
inoremap jj <Esc>j

noremap <leader>w :wa<CR>
imap <leader>w <Esc><leader>w
inoremap <leader>x <C-x><C-o>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

map <leader>n :lnext<CR>
map <leader>m :lprevious<CR>
map <leader>1 :ll 1<CR>
map <leader>2 :ll 2<CR>
map <leader>3 :ll 3<CR>
map <leader>4 :ll 4<CR>
map <leader>5 :ll 5<CR>
map <leader>6 :ll 6<CR>

map <leader>o :only<CR>
