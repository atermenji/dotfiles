" ================ General Config ====================
set nocompatible            " disable compatibility to old-time vi
set number                  " add line numbers
set showmatch               " show matching
syntax on                   " syntax highlighting
set history=1000            " store lots of :cmdline history
set autoread                " Reload files changed outside vim
" Reload changed files - https://github.com/qvacua/vimr/issues/242
au FocusGained * checktime

" Change leader to a comma
let mapleader=","

:source ~/.config/nvim/plugins.vim
" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype indent on   "allow auto-indenting depending on file type
filetype plugin on

set list listchars=tab:\ \ ,trail:· " Display tabs and trailing spaces visually
set nowrap                          " Don't wrap lines
set linebreak                       " Wrap lines at convenient points

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
runtime macros/matchit.vim " make % smarter

" ================ Folds ============================
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
" fold/unfold with Space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" ================ Security ==========================
set modelines=0
set nomodeline

" ================ Splits ==========================
" open new split panes to right and below
set splitright
set splitbelow
" navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ================ Executables ==============
" ruby path for NeoVim on OSX and rbenv
let g:ruby_path = system('echo $HOME/.rbenv/shims')

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" ================ Sessions ==============
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" ================ UI ==============
set termguicolors

" colorscheme onedark
colorscheme gruvbox

" ================ Common ==============
set shell=/bin/bash

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

:au FocusLost * silent! wa "Auto-save on focus lost except unnamed buffers =======
autocmd Filetype gitcommit setlocal spell textwidth=72

" reload init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>

" ================ Vim Rspec ============================
" RSpec.vim mappings
map <Leader>rs :call RunCurrentSpecFile()<CR>
map <Leader>rl :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
" let g:rspec_runner = "os_x_iterm2"
" let g:rspec_command = "bundle exec rspec {spec}"

if has("gui_vimr")
	let g:rspec_runner = "os_x_iterm2_vimr"
endif

" ================ Development ============================
nmap <leader>b ibinding.pry<CR><Esc>

" ================ Custom Settings ============================
:source ~/.config/nvim/settings.vim
:source ~/.config/nvim/settings/shortcuts.vim
:source ~/.config/nvim/settings/plugin_configs.vim
:source ~/.config/nvim/settings/lightline.vim
:source ~/.config/nvim/settings/rails.vim
