set nocompatible                  " Must come first because it changes other options.
filetype off                       " required by Vundler

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins

Plugin 'rails.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rvm'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-bundler'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/number-marks'
Plugin 'msanders/snipmate.vim'
Plugin 'matchit.zip'
Plugin 'ruby-matchit'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'ZenCoding.vim'
Plugin 'taglist.vim'
Plugin 'Syntastic'
Plugin 'ack.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'thoughtbot/vim-rspec'
Plugin 'Chiel92/vim-autoformat'
Plugin 'briancollins/vim-jst'
Plugin 'jade.vim'
Plugin 'greplace.vim'
Plugin 'fatih/vim-go'
Plugin 'git://github.com/leafgarland/typescript-vim'

" Colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'Solarized'
Plugin 'ColorSchemeMenuMaker'
Plugin 'desert-warm-256'
Plugin 'darkspectrum'
Plugin 'tomasr/molokai'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'croaker/mustang-vim'

call vundle#end()            " required
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
set clipboard=unnamed
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

" set list listchars=trail:.,extends:>
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
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

" resize current buffer by +/- 5
nnoremap <C-left> :vertical resize +3<cr>
nnoremap <C-down> :resize +3<cr>
nnoremap <C-up> :resize -3<cr>
nnoremap <C-right> :vertical resize -3<cr>
" Plugin settngs
"

" Zen coding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1

" SplitJoin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 40
let g:NERDTreeDirArrows = 0
let NERDTreeShowHidden=1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']
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

" vim-rspec
map <Leader>rs :call RunCurrentSpecFile()<CR>

" coffeescript.vim
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" bufkill.vim
cnoreabbrev bd BD

" splitjoin
nmap sjj :SplitjoinJoin<CR>
nmap sjs :SplitjoinSplit<CR>

" vim-powerline.vim
" let g:Powerline_symbols='skwp'

" Ack
set grepprg=ack
nnoremap <leader>fw :Ack <c-r><c-w><CR>

" Syntastic
let g:syntastic_ruby_exec = "/Users/sai/.rvm/rubies/ruby-2.4.0/bin/ruby"
let g:syntastic_eruby_checkers=['mri']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" run ruby files
function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby nmap <Leader>e :call RunWith("ruby")<cr>

if has("syntax")
  au BufNewFile,BufRead *.jsonify set filetype=ruby
  au BufNewFile,BufRead *.skim    set filetype=slim
  au BufNewFile,BufRead *.ast     set filetype=slim
endif

" Go plugin configuration
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
