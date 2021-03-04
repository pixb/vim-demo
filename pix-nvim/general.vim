"通用配置================================================

" 修改ESC键位
inoremap jk <ESC>
" 打开高亮
" syntax enable
" 打开256色支持
set t_Co=256

" 文件格式识别支持
" filetype plugin indent on

" 设置tab缩进
" 是否将tab转换为空格,转换
set expandtab

" 设置自动折行
set wrap

" 自动切换工作目录
set autochdir

" 光标回到上次编辑的地方
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")

" 光标的样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 高亮当前行
set cursorline
" 浅色显示
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" 临时关闭高亮
" exec "nohlsearch"

set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
" 自动缩进
set ai

set autowrite  " 自动保存

"General settins{{{
" 鼠标支持
set mouse=nv                 " Disable mouse in command-line mode
set report=0                 " Don't report on line changes
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
" 允许在不保存时切换缓存区
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set magic                    " For regular expressions turn magic on
set path+=**                 " Directories to search when using gf and friends
set isfname-==               " Remove =, detects filename in var=/foo/bar
set virtualedit=block        " Position cursor anywhere in visual block
set synmaxcol=2500           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set formatoptions-=o         " Disable comment-continuation (normal 'o'/'O')
if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8
endif

" What to save for views and sessions:
set viewoptions=folds,cursor,curdir,slash,unix
set sessionoptions=curdir,help,tabpages,winsize

if has('mac')
	let g:clipboard = {
		\   'name': 'macOS-clipboard',
		\   'copy': {
		\      '+': 'pbcopy',
		\      '*': 'pbcopy',
		\    },
		\   'paste': {
		\      '+': 'pbpaste',
		\      '*': 'pbpaste',
		\   },
		\   'cache_enabled': 0,
		\ }
endif

if has('clipboard')
	set clipboard& clipboard+=unnamedplus
endif

" Wildmenu {{{
" 命令模式自动补全
" --------
if has('wildmenu')
	if ! has('nvim')
		set wildmode=list:longest
	endif

	" if has('nvim')
	" 	set wildoptions=pum
	" else
	" 	set nowildmenu
	" 	set wildmode=list:longest,full
	" 	set wildoptions=tagfile
	" endif
	set wildignorecase
" 如下文件不会参与自动补全
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
	set wildignore+=*.so,*~,*/.git/*,*/.svn/*,*/.DS_Store,*/tmp/*
	set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif
" }}}

" Vim Directories {{{
" 目录设置
" 不生成备份文件
" ---------------
set nobackup
set nowritebackup
set undofile noswapfile
set directory=$DATA_PATH/swap//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set undodir=$DATA_PATH/undo//,$DATA_PATH,~/tmp,/var/tmp,/tmp
set backupdir=$DATA_PATH/backup/,$DATA_PATH,~/tmp,/var/tmp,/tmp
set viewdir=$DATA_PATH/view/
" Use the coc-spell-checker to do this
" set spellfile=$VIM_PATH/spell/en.utf-8.add

" History saving
" 历史条数
set history=2000

if has('nvim') && ! has('win32') && ! has('win64')
	set shada=!,'300,<50,@100,s10,h
else
	set viminfo='300,<10,@50,h,n$DATA_PATH/viminfo
endif

augroup user_persistent_undo
	autocmd!
	au BufWritePre /tmp/*          setlocal noundofile
	au BufWritePre COMMIT_EDITMSG  setlocal noundofile
	au BufWritePre MERGE_MSG       setlocal noundofile
	au BufWritePre *.tmp           setlocal noundofile
	au BufWritePre *.bak           setlocal noundofile
augroup END

" If sudo, disable vim swap/backup/undo/shada/viminfo writing
if $SUDO_USER !=# '' && $USER !=# $SUDO_USER
		\ && $HOME !=# expand('~'.$USER)
		\ && $HOME ==# expand('~'.$SUDO_USER)

	set noswapfile
	set nobackup
	set noundofile
	if has('nvim')
		set shada="NONE"
	else
		set viminfo="NONE"
	endif
endif

" Secure sensitive information, disable backup files in temp directories
if exists('&backupskip')
	set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*
	set backupskip+=.vault.vim
endif

" Disable swap/undo/viminfo/shada files in temp directories or shm
augroup user_secure
	autocmd!
	silent! autocmd BufNewFile,BufReadPre
		\ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim
		\ setlocal noswapfile noundofile nobackup nowritebackup viminfo= shada=
augroup END

" }}}

" Tabs and Indents {{{
" ----------------
" 不使用自动换行
set textwidth=80    " Text width maximum chars before wrapping
set noexpandtab     " Don't expand tabs to spaces
" 当读到\t会解释空格数
set tabstop=2       " The number of spaces a tab is
" TAB转换相当于两个空格
set shiftwidth=2    " Number of spaces to use in auto(indent)
" 当编辑动作(backspace)或TAB对空白的解释, -1自动判断
set softtabstop=-1  " Automatically keeps in sync with shiftwidth
set smarttab        " Tab insert blanks according to 'shiftwidth'
" 自动使用上一行的格式
set autoindent      " Use same indenting on new lines
" 智能缩进
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'

if exists('&breakindent')
	set breakindentopt=shift:2,min:20
endif

" }}}

" Timing {{{
" ------
set timeout ttimeout
set timeoutlen=500   " Time out on mappings
set ttimeoutlen=10   " Time out on key codes
set updatetime=100   " Idle time to write swap and trigger CursorHold
set redrawtime=1500  " Time in milliseconds for stopping display redraw

" }}}

" Searching {{{
" ---------
"忽略大小写
set ignorecase    " Search ignoring case
" 智能忽略大小写
set smartcase     " Keep case when searching with *
set infercase     " Adjust case in insert completion mode
" 搜索匹配自动跳转
set incsearch     " Incremental search
" 设置搜索在文件尾时折回文件头
set wrapscan      " Searches wrap around the end of the file
" 搜索时高亮
set hlsearch      " Highlight search results

set complete=.,w,b,k  " C-n completion: Scan buffers, windows and dictionary

if exists('+inccommand')
	set inccommand=nosplit
endif

if executable('rg')
	set grepformat=%f:%l:%m
	let &grepprg = 'rg --vimgrep' . (&smartcase ? ' --smart-case' : '')
elseif executable('ag')
	set grepformat=%f:%l:%m
	let &grepprg = 'ag --vimgrep' . (&smartcase ? ' --smart-case' : '')
endif

" }}}

" Behavior {{{
" --------
" 打开文件监视
set autoread                    " Auto readfile
set nowrap                      " No wrap by default
set linebreak                   " Break long lines at 'breakat'
set breakat=\ \	;:,!?           " Long lines break chars
set nostartofline               " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~    " Move to following line on certain keys
set splitbelow splitright       " Splits open bottom right
set switchbuf=useopen,vsplit    " Jump to the first open window
" backspace修复
set backspace=indent,eol,start  " Intuitive backspacing in insert mode
set diffopt=filler,iwhite       " Diff mode: show fillers, ignore whitespace
set completeopt=menu,menuone    " Always show menu, even for one item
set completeopt+=noselect,noinsert

if exists('+completepopup')
	set completeopt+=popup
	set completepopup=height:4,width:60,highlight:InfoPopup
endif

if has('patch-8.1.0360') || has('nvim-0.4')
	set diffopt+=internal,algorithm:patience
	" set diffopt=indent-heuristic,algorithm:patience
endif
" }}}

" Editor UI {{{
" 打开真色支持
if has('termguicolors')
    set termguicolors  " Enable true color
endif
set number              " Show number
set relativenumber      " Show relative number
set noshowmode          " Don't show mode on bottom
set noruler             " Disable default status ruler
set shortmess=aFc
" 滚动时光标到顶部和底部的距离
set scrolloff=2         " Keep at least 2 lines above/below
set fillchars+=vert:\|  " add a bar for vertical splits
set fcs=eob:\           " hide ~ tila
" 空格缩进线
set list
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring="
      \ %{expand('%:p:~:.')}%(%m%r%w%)
      \ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

" 括号配对显示
set showmatch           " Jump to matching bracket
" 增加html字符匹配
set matchpairs+=<:>     " Add HTML brackets to pair matching
" 显示匹配括号的时间
set matchtime=1         " Tenths of a second to show the matching paren

set showtabline=2       " Always show the tabs line
set winwidth=30         " Minimum width for active window
set winminwidth=10      " Minimum width for inactive windows
" set winheight=4         " Minimum height for active window
set winminheight=1      " Minimum height for inactive window
set pumheight=15        " Pop-up menu's line height
set helpheight=12       " Minimum help window height
set previewheight=12    " Completion preview height

" 显示命令
set showcmd             " Show command in status line
set cmdheight=2         " Height of the command line
set cmdwinheight=5      " Command-line lines
set noequalalways       " Don't resize windows on split or close
" 显示状态栏
set laststatus=2        " Always show a status line
"set colorcolumn=+0      " Column highlight at textwidth's max character-limit
set display=lastline

if has('folding') && has('vim_starting')
	set foldenable
" 折叠配置
	set foldmethod=indent
	set foldlevelstart=99
endif

" 增加符号列
if has('nvim-0.4')
	set signcolumn=yes:1
else
	set signcolumn=yes           " Always show signs column
endif

" 显示可隐藏字符
if has('conceal') && v:version >= 703
	" For snippet_complete marker
	set conceallevel=2 concealcursor=niv
endif

if exists('+previewpopup')
	set previewpopup=height:10,width:60
endif

" Pseudo-transparency for completion menu and floating windows
if &termguicolors
	if exists('&pumblend')
		set pumblend=10
	endif
	if exists('&winblend')
		set winblend=10
	endif
endif

" }}}

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
