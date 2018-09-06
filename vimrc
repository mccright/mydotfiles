" Line numbers
set number " Set the line number

set ruler
set history=1000

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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

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

" * Text Formatting -- Specific File Formats
" enable filetype detection:
filetype on

" recognize anything in my .Postponed directory as a news article, and
" anything at all with a .txt extension as being human-language
" text [this clobbers the `help' filetype, but that doesn't seem
" to prevent help from working properly]:
augroup filetype
  autocmd BufNewFile,BufRead *.txt set filetype=human
  autocmd BufNewFile,BufRead *.tmpl set filetype=html
  autocmd BufNewFile,BufRead *.tt set filetype=html
  autocmd BufNewFile,BufRead *.pod set filetype=human
  autocmd BufNewFile,BufRead *.wsgi set filetype=python
augroup END

" in human-language files, automatically format everything at
" 72 chars:
autocmd FileType human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have
" explicit end
" characters, if starting a new line in the middle of a
" comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been
" created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for
" indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=4


" apply the color scheme before hightlight settings
" The options include:
" /usr/share/vim/vim<ver>/colors/blue.vim
" /usr/share/vim/vim<ver>/colors/darkblue.vim
" /usr/share/vim/vim<ver>/colors/default.vim
" /usr/share/vim/vim<ver>/colors/delek.vim
" /usr/share/vim/vim<ver>/colors/desert.vim
" /usr/share/vim/vim<ver>/colors/elflord.vim
" /usr/share/vim/vim<ver>/colors/evening.vim
" /usr/share/vim/vim<ver>/colors/koehler.vim
" /usr/share/vim/vim<ver>/colors/morning.vim
" /usr/share/vim/vim<ver>/colors/murphy.vim
" /usr/share/vim/vim<ver>/colors/pablo.vim
" /usr/share/vim/vim<ver>/colors/peachpuff.vim
" /usr/share/vim/vim<ver>/colors/ron.vim
" /usr/share/vim/vim<ver>/colors/shine.vim
" /usr/share/vim/vim<ver>/colors/slate.vim
" /usr/share/vim/vim<ver>/colors/torte.vim
" /usr/share/vim/vim<ver>/colors/zellner.vim
colorscheme desert

"               " trailing whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red

" ref: http://stackoverflow.com/questions/158968/changing-vim-indentation-behavior-by-file-type
autocmd FileType html set shiftwidth=2|set expandtab
autocmd FileType htmljinja setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType py setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType vim setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
