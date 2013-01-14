"
" Vundle setup
"
set nocompatible                  " Must come first because it changes other options.

filetype off                       " required by Vundler

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Plugins

Bundle 'rails.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rvm'
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-bundler'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/number-marks'
Bundle 'msanders/snipmate.vim'
Bundle 'matchit.zip'
Bundle 'ruby-matchit'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'ZenCoding.vim'
Bundle 'taglist.vim'
Bundle 'Syntastic'

" Colorschemes
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ColorSchemeMenuMaker'
Bundle 'desert-warm-256'
Bundle 'darkspectrum'
Bundle 'tomasr/molokai'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'croaker/mustang-vim'
"
" General settings
"
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.
set nobackup  " Don't make a backup before overwriting a file.
set nowritebackup " And again
set noswapfile  " Don't create swap file
set directory=$HOME/.vim/tmp " Keep swap files there
set ignorecase  " Case-insensitive search
set smartcase  " Case-sensetive search if expression contains a capital letter
set backspace=indent,eol,start    " Intuitive backspacing
set clipboard=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab
set secure  " Allow to write files without permissions?
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set history=1000
au FocusLost * :wa " Autosave everything
set autowriteall
" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

set list listchars=trail:.,extends:>
autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

"
" View
"
set number 			  " Show line numbers
set laststatus=2		  " Show the status line all the time
set showtabline=2		  " Show tabs bar
set incsearch			  " Highlight matches as you type
set nohlsearch			  " Highlight matches

set showcmd 			  " Display incomplete commands
set showmode 			  " Display the mode

set visualbell			  " No beeping

set wildmenu			  " Enhanced command line completion
set wildmode=list:longest 	  " Complete files like a shell
set wildignore+=*/.git/*,*/tmp/*,*/log/*,*/app/assets/images/*,*/vendor/assets/images/*,*/coverage/*

set t_Co=256
colorscheme mustang

"
" Maps
"
map <S-right> <ESC>
" Forcing myself to stop using arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>"
map <Leader>sp :set paste<CR>
map <Leader>snp :set nopaste<CR>
" Plugin settngs
"

" SplitJoin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
map <Leader>n :NERDTreeTabsToggle<CR>

" vim-nerdtree-tabs.vim
let g:nerdtree_tabs_autoclose=1

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = '\.git$'
map <C-T> :CtrlPBuffer<CR>

" coffeescript.vim
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" bufkill.vim
cnoreabbrev bd BD

" splitjoin
nmap sjj :SplitjoinJoin<CR>
nmap sjs :SplitjoinSplit<CR>

" vim-powerline.vim
" let g:Powerline_symbols='skwp'
