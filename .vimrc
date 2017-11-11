""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Version:
"   1.2 - 2017 / 10 / 05
"
"  Build_with:
"    - Of course the VIM editor :-)
"
"    http://www.vim.org/
"    https://vim.sourceforge.io/ (for ssl connection, at the moment)
"
"    - Many tutorials and vimrc's files
"
"    https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
"    by Amir Salihefendic ( https://github.com/amix/vimrc )
"    
"    https://github.com/romainl/minivimrc
"    https://github.com/romainl/idiomatic-vimrc 
"    https://github.com/romainl/the-patient-vimmer
"    ( This guide is currently a work in progress )
"    by Romain Lafourcade ( https://github.com/romainl )
"    
"    http://learnvimscriptthehardway.stevelosh.com/
"    by Steve Losh ( https://github.com/sjl/ )
"
"    http://vim.wikia.com/wiki/Vim_Tips_Wiki
"    Lots of tips here come from there
"
"    - The community of #vim on Freenode IRC network
"
"  Sections:
"    > Init
"    > General 
"     - Minimal
"     - Better
"     - Statusline
"    > OS Based Options
"    > Mappings (shortcuts)
"    > Auto Commands
"    > Plugins and Helpers Mappings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"  INIT ------------------------------------------------------------------ {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Call Pathogen, one plugin to rule them all
silent! call pathogen#infect()
silent! call pathogen#helptags()

" Enable filetype plugin
filetype plugin indent on

" Enable syntax highlighting to work with filetype plugin
syntax on

" Loading Helpers 
" source $VIMRUNTIME/helpers/functions.vim

" Loading MatchIt
silent! runtime macros/matchit.vim


" }}}

" GENERAL ---------------------------------------------------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MINIMAL ---------------------------------------------------------------- {{{

" Backspace Normal behaviour
set backspace=indent,eol,start

" Hidde buffer when it is abandonned than VIM can open a new one
set hidden

" Enable Incremental search
set incsearch

" Status line is permanently displayed
set laststatus=2

" Better behaviour when switching between buffers
set switchbuf=useopen,usetab

" Enable the tag search in current file's repertory
set tags=./tags;/,tags;/

"Enable WildMenu
set wildmenu

" Sets how many lines of history VIM has to remember
set history=700

" Sets how many time of UNDO command you can go back
set undolevels=700

" Sets tags files
set tags=./tags;,tags;

" }}}

" BETTER ----------------------------------------------------------------- {{{

" Enable auto indenting
set autoindent

" Use 'space's in place of 'tab's
set expandtab

" 1 Tab = 2 Spaces
set shiftround
set shiftwidth=2
set tabstop=2

" Smart behaviour when deleting Space 
set smarttab

" Smart default settings when searching 
set gdefault
set ignorecase
set smartcase

" Enable omni-completion
set omnifunc=syntaxcomplete#Complete

" UTF-8 for all!
set encoding=utf-8
set termencoding=utf-8

" Set how wildmenu list should be displayed
set wildmode=list:full

" Wildmenu ignore files
set wildignore=*.o,*~,*.pyc,*.tar,*.tgz,*.rar,*.zip,*.so,*.sl
set wildignore+=*.swp,*.bak,*.pyc,*.class,*/.git/**/*,*/.hg/**/*,*/.svn/**/*,*/node_modules/**/*

" Sets Folds behaviour
set foldenable
set foldlevelstart=99
set foldmethod=indent
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Getting rid of the annoying bell
set noerrorbells
set t_vb=
set visualbell

"  It will open splitted windows at right and bellow
set splitbelow
set splitright

" It synchronise the unnamed buffer ( @" ) with system's clipboard
set clipboard^=unnamed

" Longest line for autocompletion suggestions
set completeopt+=longest

" Always show current position
set ruler

" Highlight the cursor line
set cursorline

" Height of the command bar
set cmdheight=2

" Allow <LEFT> and <RIGHT> to go next or previous line in all modes
set whichwrap+=<,>,[,]

" File system priority for end of line
set fileformats="unix,dos,mac"

" Don't cut a line after a word of one character
set formatoptions+=1

" Don't redraw screen 
set lazyredraw

" Use mouse in most possible contexts
set mouse=a

" No swap, no backup
set noswapfile
set nobackup

" No octal format when using <C-a> and <C-x> on number starting with 0
set nrformats-=octal

" Preview window
set previewheight=4

" Display lines relative number
set relativenumber

" Marging lines at top and bottom
set scrolloff=4

" 'Rodolex' mode
set winheight=999

" }}}

" Statusline ------------------------------------------------------------- {{{
set statusline=                " begining
set statusline+=%1*
set statusline+=%<\            " whitespace
" fugitive git status
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ %t           " filename
set statusline+=\              " whitespace
set statusline+=%m             " modified
set statusline+=%r             " read-only
set statusline+=%y             " filetype
" encoding
set statusline+=\[%{strlen(&fenc)?&fenc:&enc}\]
" fileformat
set statusline+=\[%{&fileformat}\]
set statusline+=%w             " preview
set statusline+=%=             " split
set statusline+=%2*
set statusline+=\ Col:\%c      " column number
set statusline+=\              " whitespace
set statusline+=Lin:\%l\/\%L   " line number/total
set statusline+=\ [%P]
set statusline+=\              " ends with whitespace

" }}}

" }}}

" OS BASED OPTIONS ------------------------------------------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets variable for OS
let os=substitute(system('uname'), '\n', '', '')

if has ('gui_running')

  " /!\ tryed to put the line at start of vimrc file
  "  but expected issues with Pathogen plugin
  set nocompatible

  " Disable Bell
  autocmd! GUIEnter * set vb t_vb=

  " Setscolor scheme
  colorscheme jellybeans

  " No tool bar
  set guioptions-=T

  " No Scrollbar
  set guioptions-=L
  set guioptions-=r

  " Default window size
  set lines=40
  set columns=120

  " Options for MacVim
  if os == 'Darwin' || os == 'Mac'
    set guifont=Incosolata-g:h13
    "set fuoptions=maxvert,maxhorz  
    
  " Options for Linux 
  elseif os == 'Linux'
    set guifont=Hack\ 7

  " Options for Win32
  elseif has('WIN32')
    set guifont=ProFontWindows:h8:cANSI
    "source $VIM/functions.vim
   	"source $VIMRUNTIME/vimrc_example.vim
	  "source $VIMRUNTIME/mswin.vim
  endif

else
  
  " Sets the right colorscheme to the environment that allows it
  if &t_Co >= 256
    colorscheme jellybeans
  elseif &t_Co < 256
    colorscheme jellybeans
  endif

endif

"define 3 custom highlight groups
hi User1 ctermbg=yellow ctermfg=black   guibg=yellow guifg=brown
hi User2 ctermbg=brown   ctermfg=yellow  guibg=DarkYellow   guifg=blue
hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green

" }}}

" MAPPINGS --------------------------------------------------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets the Leader Character
let mapleader=','

" Edit vimrc in a new tab
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" ESC replaced by 'jk' combination
inoremap jk <esc>
inoremap <esc> <nop>

" Highlights trailing whitespace at end of lines
nnoremap <leader>ws :match Error /\v\s+$/<cr>

" Clear matches
nnoremap <leader>cm :match none<cr>

" Shortcuts fot browsing quickfix window entries
nnoremap pp :cprevious<cr>
nnoremap nn :cnext<cr>

" 'grep' command returns results to the quickfix window
nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Autocompletion for Methods, Files and Lines
inoremap <leader>, <C-x><C-o>
inoremap <leader>: <C-x><C-f>
inoremap <leader>= <C-x><C-l>

" Makes',d'' act as real deletion
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" 
vnoremap <leader>p "_dP

"Fast saving
nnoremap <leader>w :w!<CR>
nnoremap <leader>wa :wa!<CR>
inoremap <C-S>w <C-O>:w!<CR>

" Bind 'Very Magic' option by default to '/'
nnoremap / /\v

" Maintain the visual selection after manual indentation
vnoremap > >gv
vnoremap < <gv

" Treat long lines as break lines (useful when moving around them)
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <up>   gk

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Inspired by 'Reddit' a nice way to switch between buffers
nnoremap <leader>gb :buffers<CR>:sb<Space>

" Adds a ';' at end of the cursor line
inoremap <leader>; <C-o>m`<C-o>A;<C-o>``
nnoremap <silent> <leader>; :s/$/;<CR>

" Isolate one line creating by two empty lines above and bellow
nnoremap <leader><Space><Space> O<C-o>j<C-o>o<C-o>k<Esc>

" Select the word under the cursor and all others matching the selected one
nnoremap <leader>s *N

" Toggle highlighting on/off, and show current value.
noremap <leader>hl :set hlsearch! hlsearch?<CR>

" Remove the Windows ^M - when the encoding get messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
nnoremap <leader>pp :setlocal paste!<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>
 
" :ls Than Choose your buffer
nnoremap <leader>sl :ls<CR>:b<space>

" }}}

" AUTO COMMANDS ---------------------------------------------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vimscript file settings
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim :normal zM
augroup END

" }}}

" PLUGINS AND HELPER MAPPINGS -------------------------------------------- {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" }}}
