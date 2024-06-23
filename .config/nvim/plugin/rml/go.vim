autocmd FileType go nmap <leader>r :GoRun --tags vectors cmd/devserver/devserver.go<CR>
" autocmd FileType go nmap <leader>r :GoRun --tags vectors cmd/poll-cdm/poll-cdm.go<CR>
" autocmd FileType go nmap <leader>r :GoRun --tags vectors cmd/poll-querylib/poll-querylib.go<CR>
" autocmd FileType go nmap <leader>r :GoRun --tags vectors cmd/generate-querylib/generate-querylib.go<CR>
" autocmd FileType go nmap <leader>r :GoRun --tags vectors cmd/index-querylib/index-querylib.go<CR>

autocmd FileType go nmap <leader>t  :GoTest -v --tags vectors ~/chalanding/lib/route/index_test.go<CR>

autocmd BufNewFile,BufRead *.go setlocal noexpandtab
autocmd BufNewFile,BufRead *.go setlocal foldmethod=syntax

autocmd FileType go nmap <leader>h  :call go#lsp#Exit()
autocmd FileType go nmap  <leader>p ofmt.Printf("====== %+v\n", )<Esc>$
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_fmt_experimental = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0
let g:go_term_reuse = 1


