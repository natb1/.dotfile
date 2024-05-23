set expandtab
set shiftwidth=2
set tabstop=2
set autoindent 

set number
set relativenumber
set foldmethod=indent
set foldcolumn=4

" bufdo :args % ##

autocmd BufNewFile,BufRead *.go setlocal noexpandtab
autocmd BufNewFile,BufRead *.go setlocal foldmethod=syntax

autocmd FileType go nmap <leader>h  :call go#lsp#Exit()
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap  <leader>p ofmt.Printf("====== %+v\n", )<Esc>$
let g:go_fmt_command = "goimports"
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" TODO remap this more more info
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_fmt_experimental = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0
let g:go_term_reuse = 1

map <leader>s :source ~/.config/nvim/vimrc.vim \| :source ~/.config/nvim/init.lua<CR>

inoremap <leader><leader> <Esc>
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

map <leader>a :cclose \| :pclose \| :lclose<CR>
