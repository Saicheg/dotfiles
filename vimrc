set nocompatible                  " Must come first because it changes other options.
filetype off                       " required by Vundler

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rails'
" Plug 'vim-ruby/vim-ruby'
" Plug 'tpope/vim-rvm'
" Plug 'slim-template/vim-slim'
" Plug 'tpope/vim-haml'
" Plug 'tpope/vim-git'
" Plug 'tpope/vim-bundler'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/number-marks'
" Plug 'vim-scripts/matchit.zip'
" Plug 'vim-scripts/ruby-matchit'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/bufkill.vim'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/tComment'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
" Plug 'mattn/emmet-vim'
" Plug 'vim-scripts/taglist.vim'
Plug 'mileszs/ack.vim'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'thoughtbot/vim-rspec'
" Plug 'Chiel92/vim-autoformat'
" Plug 'majutsushi/tagbar'
" Plug 'briancollins/vim-jst'
" Plug 'digitaltoad/vim-pug'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'github/copilot.vim'
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'jparise/vim-graphql'

" Colorschemes
Plug 'flazz/vim-colorschemes'

call plug#end()

"
" General settings
"
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

let g:editorconfig = v:false

set nobackup  " Don't make a backup before overwriting a file.
set nowritebackup " And again
set noswapfile  " Don't create swap file
set directory=$HOME/.vim/tmp " Keep swap files there
set ignorecase  " Case-insensitive search
set smartcase  " Case-sensitive search if expression contains a capital letter
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
set updatetime=300
set history=1000
set shortmess+=c
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
set number 			      " Show line numbers
set laststatus=2		  " Show the status line all the time
set showtabline=2		  " Show tabs bar
set incsearch			    " Highlight matches as you type
set nohlsearch			  " Highlight matches

set showcmd 			  " Display incomplete commands
set showmode 			  " Display the mode

set visualbell			  " No beeping

set wildmenu			  " Enhanced command line completion
set wildmode=list:longest 	  " Complete files like a shell
set wildignore+=*/.git/*,*/tmp/*,*/log/*,*/images/*,*/coverage/*,*/node_modules/*,*/public/assets/*,*/public/packs/*,*/public/uploads/*,*/public/cache/*

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

"
" Plugin settings
"

"
" COC
"
let g:coc_global_extensions = [
\   'coc-solargraph',
\   'coc-spell-checker',
\   'coc-clangd',
\   'coc-rls',
\   'coc-metals',
\   'coc-docker',
\   'coc-phpls',
\   'coc-java',
\   'coc-groovy',
\   'coc-java-debug',
\   'coc-scssmodules',
\   'coc-css',
\   'coc-html',
\   'coc-webpack',
\   'coc-flow',
\   'coc-styled-components',
\   'coc-jest',
\   'coc-inline-jest',
\   'coc-import-cost',
\   'coc-prettier',
\   'coc-tsserver',
\   'coc-eslint',
\   'coc-snippets',
\   'coc-json',
\   'coc-github'
\ ]



" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Install prettier
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" SplitJoin
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" NERDTree
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let NERDTreeMinimalUI = 1
let NERDTreeWinSize = 35
let NERDTreeDirArrows = 0
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.git$', '\.DS_Store$', '\.bundle$']

map <Leader>n :NERDTreeToggle<CR>

" vim-nerdtree-tabs.vim
" let g:nerdtree_tabs_autoclose=1

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
" au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" bufkill.vim
cnoreabbrev bd BD



" splitjoin
nmap sjj :SplitjoinJoin<CR>
nmap sjs :SplitjoinSplit<CR>

" vim-airline
let g:airline_theme='powerlineish'

" Ack
set grepprg=ack
nnoremap <leader>fw :Ack <c-r><c-w><CR>

" Run ruby files
function RunWith (command)
  execute "w"
  execute "!clear;" . a:command . " " . expand("%")
endfunction

autocmd FileType ruby nmap <Leader>e :call RunWith("ruby")<cr>

if has("syntax")
  au BufNewFile,BufRead *.jsonify  set filetype=ruby
  au BufNewFile,BufRead *.decorate set filetype=ruby
  au BufNewFile,BufRead *.skim     set filetype=slim
  au BufNewFile,BufRead *.ast      set filetype=slim
endif

" Go plugin configuration
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
