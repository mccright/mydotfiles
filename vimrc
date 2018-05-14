" Line numbers
set number " Set the line number

" search as characters are entered
set incsearch  " Real-time search
set ignorecase
set smartcase
set hlsearch  " Highlight the search result
hi Search cterm=NONE ctermfg=black ctermbg=blue
hi Visual cterm=NONE ctermfg=black ctermbg=brown
set showmatch  " When a bracket is inserted, briefly jump to the matching one
" saw showmatch at: https://github.com/tankywoo/dotfiles/blob/master/.vimrc

" Highlight current line
set cursorline       " Highlight the line the cursor is on

syntax on " Syntax highlighting

filetype on  " File type detection
filetype plugin on  " Loading the plugin files for specific file types
filetype indent on  " Loading the indent file for specific file types with

" Tab and Indent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set smarttab
set autoindent  " Copy indent from current line when starting a new line
set smartindent
set cindent

" ref: http://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
autocmd FileType html set shiftwidth=2|set expandtab
autocmd FileType htmljinja setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
