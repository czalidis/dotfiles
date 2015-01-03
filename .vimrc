" Enable syntax highlighting
syntax on
syntax enable

" Better command-line completion
set wildmode=longest,list
set wildmenu

set fileformat=unix " file mode is unix
set fileformats=unix,dos,mac " detects unix, dos, mac file formats in that order
set viminfo='20,\"500 " remember copy registers after quitting in the .viminfo
" file -- 20 jump links, regs up to 500 lines'

set history=1000 " remember more commands and search history
set undolevels=1000 " use many levels of undo

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

" Filetype Indentation Mode
filetype plugin indent on

" CLIPBOARD SETTINGS
if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
"set completeopt=menu,menuone,longest
set completeopt=menu,preview " this is the default
set switchbuf=useopen,usetab

" Determines the maximum number of items to show in the popup menu.
" Zero is take as much as possible.
set pumheight=6

" Customize GUI interface
"set guioptions-=m " Turn off GUI menu bar
"set guioptions-=T " Turn off GUI toolbar (icons)
"set guioptions-=r " Turn off GUI right scrollbar
"set guioptions-=L " Turn off GUI left scrollbar

" set vim to 256 colors to work with terminals
set t_Co=256


" EDITOR SETTINGS
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent " smart auto indenting
set copyindent " copy the previous indentation on autoindenting

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" cursor keys cross line boundaries
set whichwrap+=h,l

set smarttab " smart tab handling for indenting
set magic " change the way backslashes are used in search patterns

"set nobackup " no backup~ files.
"set noswapfile " no .swp files.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=80
"this makes the color after the textwidth column highlighted
"set colorcolumn=81

" show whitespace in cpph files
set list listchars=tab:>-,trail:·,extends:>


" enable pathogen
execute pathogen#infect()


" SEARCH SETTINGS
set nohlsearch " do not highlight searched-for phrases
"set hlsearch " the opposite, use :noh to stop highlighting
set incsearch " ...but do highlight-as-I-type the search string
set gdefault " this makes search/replace global by default
if v:version >= 704
  " The new Vim regex engine is currently slooooow as hell which makes syntax
  " highlighting slow, which introduces typing latency.
  " Consider removing this in the future when the new regex engine becomes
  " faster.
  set regexpengine=1
endif


" SPELLCHECKING SETTINGS
" set spell checking for certain filetypes
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell


" FILETYPES SETTINGS
" add custom filetypes
au BufNewFile,BufRead *.launch set filetype=xml " this is probably handled by vim-ros plugin


" CUSTOM MAPPINGS
" <leader>v brings up .vimrc
" <leader>V reloads it and makes all changes active (file has to be saved first)
noremap <leader>v :e! $MYVIMRC<CR>
noremap <silent> <leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" map control-backspace to delete the previous word, works only in gvim
imap <C-BS> <C-W>

" Bind Ctrl+<movement> keys to move around the windows,
" instead of using Ctrl+w + <movement>
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-k> <c-w>k

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv



" PLUGINS

" NERDTree
" toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

"let NERDTreeDirArrows=0 " Use + ~ chars for directories
"let NERDTreeMinimalUI=1 " Remove excess information bars
"let NERDTreeShowBookmarks=1 " Show Bookmarks


" TagBar
" toogle TagBar with <F8>
nmap <F8> :TagbarToggle<CR>


" mini-bufexpl customization
" set minibufexp to split vertically and to the right
let g:miniBufExplBRSplit = 1
let g:miniBufExplVSplit = 1

" set max column size
let g:miniBufExplMaxSize = 30

" use Ctrl+Page Up/Down to change buffers
noremap <C-PageDown> :MBEbn<CR>
noremap <C-PageUp> :MBEbp<CR>

" same as above but in MRU fashion
noremap <C-TAB>   :MBEbb<CR>
noremap <C-S-TAB> :MBEbf<CR>

" should buffer be cycled arround if hits the begining or the endi
let g:miniBufExplCycleArround = 1

" toogle minibufexpl with <F9>
map <F9> :MBEToggle<CR>


" vim-airline customization
" don't show vim's mode, use airline's instead
set noshowmode
" make airline visible without split
set laststatus=2

" remove delay detween insert and normal mode
set ttimeoutlen=50

" change default colors for airline
let g:airline_theme = 'kolor'

" enable powerline symbols, needs powerline fonts installed
let g:airline_powerline_fonts = 1

" change default font for gvim to enable powerline symbols
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif


" indentLine settings
" change default indent character for indentLine
let g:indentLine_char = '┊'
" disable indentLine plugin on startup
let g:indentLine_enabled = 0

" toggle indentLine with <F7>
nmap <F7> :IndentLinesToggle<CR>


" YouCompleteMe SETTINGS
let g:ycm_complete_in_comments_and_strings  = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion=['<tab>', '<Down>']
let g:ycm_key_list_previous_completion=['<s-tab>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
