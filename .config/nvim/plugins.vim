call plug#begin()

" languages & frameworks
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'thoughtbot/vim-rspec'

" UI
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

" general text edit
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'skwp/greplace.vim' " global search-replace
Plug 'vim-scripts/camelcasemotion' " CamelCase words support
Plug 'matze/vim-move' " Move text up/down with Option key

" textobjects.
Plug 'kana/vim-textobj-user' " custom textobjects support
Plug 'nelstrom/vim-textobj-rubyblock' " 'var' stands for Visual Around Ruby.
Plug 'michaeljsmith/vim-indent-object' " indentation based textobjects - vii/vai

" non important, small improvements
Plug 'chrisbra/Colorizer' " color hex codes and color names
Plug 'xsunsmile/showmarks' " visually show marks on the left
Plug 'Raimondi/delimitMate' " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides' " visually display indent levels

"Bundle "Lokaltog/vim-easymotion"

" Bundle "godlygeek/tabular"

" Coersion, smart search
" Bundle "tpope/vim-abolish"

call plug#end()
