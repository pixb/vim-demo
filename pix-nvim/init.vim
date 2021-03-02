" ========================自定义配置=================================
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" disable all keymaps of plugins
let g:thinkvim_disable_mappings = 0
" disable some plugins keymap
let g:thinkvim_disable_pmaping = []

" ==============================dein===============================
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    source $VIM_PATH/plugins.vim
    call dein#end()
    call dein#save_state()
endif

if has('vim-starting')
    call dein#install()
endif

" ===============================plugin keybinds======================
source $VIM_PATH/keybinds.vim

" ==========================通用配置================================
" 修改ESC键位
inoremap jk <ESC>
" 打开行号
set number
set rnu
" 修改Leader键
let g:mapleader="\<Space>"
let g:maplocalleader=";"
" 打开高亮
syntax enable
" 打开256色支持
set t_Co=256
" 打开真色支持
if has('termguicolors')
    set termguicolors
endif

" 文件格式识别支持
filetype plugin indent on
" 不适配低版本，为了有更好的支持
if &compatible
  set nocompatible
endif

" 设置tab缩进
" 是否将tab转换为空格,转换
set expandtab
" TAB转换相当于两个空格
set shiftwidth=4
" 当读到\t会解释空格数
set tabstop=2
" 当编辑动作(backspace)或TAB对空白的解释, -1自动判断
set softtabstop=-1

" 鼠标支持
set mouse=a

" utf-8编码
set encoding=utf-8

" 设置自动折行
set wrap

" 缩进
set smartindent " 只能缩进
set autoindent  " 自动使用上一行的格式

" 空格缩进线
set list
set listchars=trail:▫ ",nbsp:+,extends:→,precedes:← ,tab:▸\  " 这里TAB不设置因为使用了缩进插件 

" 折叠配置
set foldmethod=marker
set foldlevel=99

" 显示状态栏
set laststatus=2

" 自动切换工作目录
set autochdir

" 光标回到上次编辑的地方
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")

" 光标的样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 滚动时光标到顶部和底部的距离
set scrolloff=15

" 不使用自动换行
set textwidth=0

" 高亮当前行
set cursorline
" 浅色显示
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

" 显示命令
set showcmd









