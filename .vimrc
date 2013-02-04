"__      _______ __  __ _____   _____ 
"\ \    / /_   _|  \/  |  __ \ / ____|
" \ \  / /  | | | \  / | |__) | |     
"  \ \/ /   | | | |\/| |  _  /| |     
" _ \  /   _| |_| |  | | | \ \| |____ 
"(_) \/   |_____|_|  |_|_|  \_\\_____|
"

" Use Vim settings, rather than Vi settings
set nocompatible

" The text width cannot be mot longer than 100 coloumns
set tw=100

" keep 50 lines of command line history
set history=50		

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show the cursor position all the time
set ruler		

" display incomplete commands
set showcmd		

" Autowrite before changing file or executing external commands
set autowrite

" switch between header and C code with f4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Skeleton
autocmd BufNewFile  *.py	0r ~/.vim/skeleton.py|3
autocmd BufNewFile  *.cpp	0r ~/.vim/skeleton.cpp|7
autocmd BufNewFile  *.h		0r ~/.vim/skeleton.h|7

" Allow to write in root
cmap w!! %!sudo tee > /dev/null %

" Centralise backup files
set backupdir=~/.backup,.,/tmp

"tab = 4 spaces
"set smartindent
set cindent "Better than smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"dinamic search and highlight search
set incsearch
set hlsearch

" Enable the mouse on vim
if has('mouse')
	 set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	 syntax on
	 set background=dark
	 set number
	 set showcmd
endif

"Switch on the next color scheme
"map <silent><f3> :NEXTCOLOR<cr>
"Default color scheme 
colorscheme jellybeans
"colorscheme eclipse
"colorscheme zendnb

" Vundle setup
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundle :
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'

"POWERLINE
"set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

""""""""""""""""
" Don't know really what is it ...
""""""""""""""""
if has("vms")
     set nobackup		" do not keep a backup file, use versions instead
else
	 set backup		" keep a backup file
endif

