"make Y consistent with C and D. Yank till the end of line.
nnoremap Y y
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" Make 0 go to the first character rather than the beginning of the line.
" If you want the traditional beginning of line, use ^.
nnoremap 0 ^
nnoremap ^ 0

"Go to last edit location with ,.
nnoremap ,. '.

" Create window splits easier.
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" Absolute path
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
" Relative path
nnoremap <silent> ,cr :let @* = expand("%")<CR>
" Just filename
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

" Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Auto indent pasted text
" ":nnoremap p ]p
nnoremap P P=`[
nnoremap p p=`]
nnoremap <c-p> p

" move up/down quickly by using Cmd-j, Cmd-k which will move us around by functions
" try out z/x
" nnoremap ] <S-}>
" nnoremap [ <S-{>


" autocmd FileType ruby map <buffer> ] ]m
" autocmd FileType ruby map <buffer> [ [m
" autocmd FileType rspec map <buffer> ] }
" autocmd FileType rspec map <buffer> [ {
" autocmd FileType javascript map <buffer> ] }
" autocmd FileType javascript map <buffer> [ {
