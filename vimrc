" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen (http://www.vim.org/scripts/script.php?script_id=2332) for
" easier bundle management
call pathogen#infect()

" Make ',' the personal leader key
let mapleader = ","
let maplocalleader = ","

" Make ' more useful, swap it with `
nnoremap ' `
nnoremap ` '


set backspace=indent,eol,start  " Backspace deletes like most programs in insert mode
set nobackup                    " Don't keep a backup file
set writebackup                 " … but do keep a backup file during writes
set directory-=.                " Don't store swapfiles in the current directory
set makeef=error.err            " When using make, where should it dump the file
set hidden                      " Allow Vim to manage hidden buffers effectively
set history=500                 " Keep 500 lines of command line history
set ruler                       " Show the cursor position all the time
set showcmd                     " Display incomplete commands
set incsearch                   " Do incremental searching
set ruler                       " Show the cursor position all the time
set number                      " Show line numbers
set numberwidth=5               " How many columns to use for the line number
set autowrite                   " Automatically :write before running commands
set laststatus=2                " Always display the status line
set tildeop                     " Make ~ work like a normal operator
set gdefault                    " always apply substitutions globally on a line
set fileformats=unix,dos,mac    " support all three, in this order
set viminfo+=!                  " make sure it can save viminfo
set iskeyword+=_,$,@,%,#,-      " none of these should be word dividers, so make them not be
set title                       " show title in xterm
set scrolloff=3                 " Start scrolling 3 lines before the border
set autoread                    " Automatically reread files that have been changed externally
set shortmess=atI               " shorten command-line text and other info tokens (see :help shortmess)
set winwidth=80                 " Make sure the current split has at least 80 width
set nojoinspaces                " Only use one space after ., ? or ! with a join command
set clipboard=unnamed           " Yank and paste with the system clipboard

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


" Sane searching
set hlsearch                    " Hilight search term
set showmatch                   " Show matching brackets
set incsearch                   " ... dynamically as they are typed


" runtime macros/matchit.vim    " Enable extended % matching


" Syntax highlighting and stuff
syntax on
filetype on                     " detect the type of file
filetype indent on              " Enable filetype-specific indenting
filetype plugin on              " Enable filetype-specific plugins


set wildmenu                    " Make completion useful: show a navigable menu for tab completion
set wildignore+=.svn,CVS,.git,*.pyc,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*/tmp/*,*.zip,log/**,node_modules/**,target/**,tmp/**,*.rbc    " Ignore these files when completing names and in Explorer
set wildmode=list:longest,list:full  " List all matches and complete till longest common string, or complete first match
set complete=.,b,u,]            " Pull from keywords for completion in the current file, other buffers (closed or still open), and from the current tags file.
set suffixes+=.old              " set of file name suffixes that will be given a lower priority when it comes to matching wildcards


" This line will make Vim set out tab characters, trailing whitespace and
" invisible spaces visually, and additionally use the # sign at the end of
" lines to mark lines that extend off-screen. For more info, see :h listchars.
set listchars=tab:▸\ ,eol:¬,trail:▫,extends:#,nbsp:▫
set list


" Specify which keys can move the cursor left/right to move to the
" previous/next line when the cursor is on the first/last character in that
" line
" set whichwrap+=<,>,[,]


" make /-style searches case-sensitive only if there is a capital letter in the search expression
set ignorecase
set smartcase


" save undo information
set undodir=$HOME/.vim-undo
set undofile
set undolevels=1000
set undoreload=10000


" status line
set statusline=
set statusline+=%f\ %2*%m\ %1*%h
set statusline+=%#warningmsg#
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}]\ %12.(%c:%l/%L%)


" tag support
set tags=./tags;


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set formatoptions=tcrqnj        " See Help (complex)
set autoindent                  " autoindent
set nosmartindent               " No smartindent, because…
set cindent                     " C-style indenting is better

set tabstop=2                   " tab spacing (settings below are just to unify it)
set softtabstop=2               " unify
set shiftwidth=2                " unify
set expandtab                   " use spaces instead of tabs
set smarttab                    " use tabs at the start of a line, spaces elsewhere


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256                    " 256 colors
set background=dark             " we are using a dark background

" colorscheme asmdev
" colorscheme github
colorscheme jellybeans

" Highlight trailing whitespace
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
match WhitespaceEOL /\s\+\%#\@<!$/


highlight ColorColumn ctermbg=magenta
" '\%81v' is a regex matching the virtual 81st column
call matchadd('ColorColumn', '\%121v', 100)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
"    Enable folding, but by default make it act like folding is off, because folding is
"    annoying in anything but a few rare cases
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldenable               " Turn on folding
"set foldmethod=indent       " Make folding indent sensitive
set foldmethod=marker        "
set foldlevel=100            " Don't autofold anything (but I can still fold manually)
"set foldopen-=search        " don't open folds when you search into them
"set foldopen-=undo          " don't open folds when you undo stuff


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make ';' an alias for ':'
nnoremap ; :


" Map `kj` to ESC
imap kj <ESC>


" automatically insert a \v before any search string, so search uses normal regexes
nnoremap / /\v
vnoremap / /\v


" Clear search buffer
" nnoremap <leader><leader> :nohlsearch<CR>
nnoremap <leader>l :nohlsearch<CR>


" Make trailing whitespace visible with ,s
nmap <silent> <leader>s :set nolist!<CR>


" Make ^e and ^y scroll 5 lines instead of 1
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>


" Switch to alternate file
nnoremap <leader>. <c-^>


" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap


" Make j and k behave more natural when working with long, wrapped lines
nnoremap j gj
nnoremap k gk


" Make the tab key match bracket pairs
nnoremap <tab> %
vnoremap <tab> %


" Useful trick when I've forgotten to `sudo' before editing a file:
cmap w!! w !sudo tee % >/dev/null


" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <leader>e
" map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>


" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <leader>t
" map <leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>


" Shift-tab to insert a hard tab
" imap <silent> <S-tab> <C-v><tab>


" don't move the cursor after pasting
" (by jumping to back start of previously changed text)
noremap p p`[
noremap P P`[


" Swap v and CTRL-V, because Block mode is more useful that Visual mode
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v


" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv


" Make Y behave like other capitals
map Y y$


" bind Ctrl-l to hashrocket
imap <C-l> <Space>=><Space>


" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>
" map <leader>rt :!ctags --extra=+f -R .<CR><CR>


" Switch between the last two files
" nnoremap <leader><leader> <c-^>


" Easy reloading of vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


" spec just a method/group
" map <leader>s :!bundle exec spec <C-R>=expand("%:p")<CR> --format nested -c -l <C-R>=line(".")<CR><CR>
" spec entire file
" map <leader>S :!bundle exec spec <C-r>=expand("%:p")<CR> --format nested -c<CR>


" Map <leader>ts2 to expand (t)abs to (s)paces with (2) characters indicating a tab
nnoremap <leader>ts2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

" Map <leader>ts4 to expand (t)abs to (s)paces with (4) characters indicating a tab
nnoremap <leader>ts4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>

" Map <leader>tt2 to (t)abs to be treated as (t)ab characters and display as (2) characters
nnoremap <leader>tt2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

" Map <leader>tt4 to (t)abs to be treated as (t)ab characters and display as (4) characters
nnoremap <leader>tt4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>


" Adjust viewports to the same size
noremap <leader>= <C-w>=


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automagically save files when focus is lost, but ignore any warnings, e.g.
" when a buffer doesn't have an associated file
autocmd BufLeave,FocusLost silent! wall


augroup vimrcEx
  autocmd!

  " Inspired by Gary Bernhardt/Destroy All Software
  " Jump to last cursor position unless it's invalid or in an event handler
  " when reopening a file/vim
  autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set autoindent shiftwidth=2 softtabstop=2 expandtab
  autocmd FileType python set shiftwidth=4 softtabstop=4 expandtab
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"map <Left>  :echoe "Use h!"<CR>
"map <Right> :echoe "Use l!"<CR>
"map <Up>    :echoe "Use k!"<CR>
"map <Down>  :echoe "Use j!"<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DELETE AND BACKSPACE KEYS ARE UNACCEPTABLE AS WELL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"inoremap <Del> <Nop>
"inoremap <BS>  <Nop>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between panes
map <leader><up> <C-w><up>
map <leader><down> <C-w><down>
map <leader><left> <C-w><left>
map <leader><right> <C-w><right>

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<CR>
" inoremap <s-tab> <c-n>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename current file
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OmniCompletion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Enable OmniCompletion for Ruby
autocmd FileType ruby set omnifunc=rubycomplete#Complete
" " ... and Rails
" autocmd FileType ruby let g:rubycomplete_rails = 1
" " ... and to include Classes in global completions
" autocmd FileType ruby let g:rubycomplete_classes_in_global = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileType specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Some languages should always use 4-space indent
autocmd FileType python setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType sql setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType htmldjango setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType rust setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType go setlocal autoindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab


" Handy for running go tests
" autocmd FileType go map <leader>t :w<CR> :set makeprg=go\ test<CR> :make<CR>


" .inc files are Django templates
autocmd BufRead,BufNewFile {*.inc} set filetype=htmldjango


" Thorfile, Rakefile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru} setlocal filetype=ruby


" Customize markdown file settings
autocmd FileType *.md set wrap|set linebreak|set nolist
autocmd FileType *.markdown set wrap|set linebreak|set nolist


" Git Commit
autocmd Filetype gitcommit setlocal spell textwidth=72


" Always turn on syntax highlighting for diffs
augroup PatchDiffHighlight
    autocmd!
    autocmd FileType  diff   syntax enable
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-commentary settings
autocmd FileType sql set commentstring=--\ %s
autocmd FileType vim set commentstring=\"\ %s


" tasklist plugin
map <leader>v <Plug>TaskList


" Syntax highlight shell scripts as per POSIX,
" not the original Bourne shell which very few use
let g:is_posix = 1


" Don't conceal things like "->" with their Unicode representation
let g:no_rust_conceal = 1


" Hide .pyc in NetRW
let g:netrw_listhide='.*\.pyc\$'


" Strip trailing whitespace - The Plugin
nmap <leader><space> :call whitespace#strip_trailing()<CR>


" Snippets are activated by Shift+Tab
" let g:snippetsEmu_key = "<S-Tab>"


" Tabularize
" nmap <leader>a= :Tabularize /=<CR>
" vmap <leader>a= :Tabularize /=<CR>
" nmap <leader>a: :Tabularize /:\zs<CR>
" vmap <leader>a: :Tabularize /:\zs<CR>
" nmap <leader>a, :Tabularize /,\zs<CR>
" vmap <leader>a, :Tabularize /,\zs<CR>


" Syntastic
let g:syntastic_python_checkers=['flake8', 'pylama']
let g:syntastic_python_flake8_args='--ignore=E501,E401,E221'
let g:syntastic_python_pylama_args='--ignore E501,E401,E221'

let g:syntastic_javascript_checkers=['jshint']

let g:syntastic_css_checkers=['csslint']

let g:syntastic_html_checkers=[] " ['validator', 'w3']
" Let syntax checking to check on open as well as save
let g:syntastic_check_on_open=1


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>m :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <C-B> :CtrlPBuffer<CR>
nnoremap <leader>o :CtrlPMixed<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :CtrlPTag<CR>


" Let CtrlP use a cache
let g:ctrlp_use_caching = 1


" Keep cache across sessions
let g:ctrlp_clear_cache_on_exit = 1


" Custom caching dir
let g:ctrlp_cache_dir = $HOME.'/.ctrlp-cache'


" Up the number of files ctrlp is allowed to scan
let g:ctrlp_max_files = 50000


" Only update after typing has stopped
" let g:ctrlp_lazy_update = 1


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = {
      \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'],
      \ },
      \ 'fallback': 'ag %s --files-with-matches --nocolor -g ""'
    \ }
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Grepping & searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{
call plug#begin('~/.vim/plugged')                               " start plugin manager
Plug 'kien/ctrlp.vim'                                           " Fuzzy file searcher
Plug 'rking/ag.vim'                                             " Fast grep replacement
Plug 'jiangmiao/auto-pairs'                                     " Automatic bracket closing
Plug 'editorconfig/editorconfig-vim'                            " Settings based on .editorconfig file
Plug 'tpope/vim-fugitive'                                       " GIT integration
Plug 'haya14busa/incsearch.vim'                                 " Improved incremental searching
Plug 'ervandew/supertab'                                        " Tab completion
Plug 'scrooloose/syntastic'                                     " Syntax checking
Plug 'godlygeek/tabular'                                        " Table formatting
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }            " JS code analysis
Plug 'tpope/vim-unimpaired'                                     " Miscellaneous commands
Plug 'tpope/vim-abolish'                                        " Working with variants of a world
Plug 'bling/vim-airline'                                        " Hip status bar
Plug 'tpope/vim-commentary'                                     " (Un)commenting lines
Plug 'Lokaltog/vim-easymotion'                                  " Additional motions
Plug 'justinmk/vim-sneak'                                       " Two-letter alternative to 'f'
Plug 'ajh17/vim-fist'                                           " Easy creation of Github gists
Plug 'airblade/vim-gitgutter'                                   " Column with line changes
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install' } " Context coloring for javascript
Plug 'pangloss/vim-javascript'                                  " Better javascript support
Plug 'mxw/vim-jsx'                                              " Hightlight JSX
Plug 'leshill/vim-json'                                         " Better JSON support
Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }  " Live markdown parsing
Plug 'terryma/vim-multiple-cursors'                             " Sublime-like multiple cursors
Plug 'mustache/vim-mustache-handlebars'                         " Better support for mustache and handlebars files
Plug 'moll/vim-node'                                            " Better support for node modules
Plug 'tpope/vim-repeat'                                         " Use dot operator with plugins
Plug 'tpope/vim-surround'                                       " Commands to work with surroundings
Plug 'tpope/vim-vinegar'                                        " Directory overview in a panel
Plug 'evanmiller/nginx-vim-syntax'                              " Syntax highlighting for nginx files
Plug 'vim-scripts/syntaxudev.vim'                               " Syntax highlighting for udev rules files
call plug#end()

" Local config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
