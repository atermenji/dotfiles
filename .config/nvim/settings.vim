" These keys are easier to type than the default set
" We exclude semicolon because it's hard to read and
" i and l are too easy to mistake for each other slowing
" down recognition. The home keys and the immediate keys
" accessible by middle fingers are available 
let g:EasyMotion_keys='asdfjkoweriop'
nmap ,<ESC> ,,w
nmap ,<S-ESC> ,,b
" Automatically treat .es6 extension files as javascript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

"Use the silver searcher for lightning fast Gsearch command
set grepprg=git\ grep
let g:grep_cmd_opts = '--line-number'

nnoremap ,rs :RunItermSpec<cr>
nnoremap ,rl :RunItermSpecLine<cr>
nnoremap ,ss :RunItermSpringSpec<cr>
nnoremap ,sl :RunItermSpringSpecLine<cr>


" ========================================
" General vim sanity improvements
" ========================================
"
" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" Use numbers to pick the tab you want (like iTerm)
map <silent> <-1> :tabn 1<cr>
map <silent> <-2> :tabn 2<cr>
map <silent> <-3> :tabn 3<cr>
map <silent> <-4> :tabn 4<cr>
map <silent> <-5> :tabn 5<cr>
map <silent> <-6> :tabn 6<cr>
map <silent> <-7> :tabn 7<cr>
map <silent> <-8> :tabn 8<cr>
map <silent> <-9> :tabn 9<cr>
