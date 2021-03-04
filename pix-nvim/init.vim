" 修改Leader键
let g:mapleader="\<Space>"
let g:maplocalleader=";"
" ========================自定义配置=================================
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" disable all keymaps of plugins
let g:thinkvim_disable_mappings = 0
" disable some plugins keymap
let g:thinkvim_disable_pmaping = []
let g:thinkvim_version="2.6.5"
" ===================================================================
" 不适配低版本，为了有更好的支持
if &compatible
    set nocompatible
endif
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

"================================plugin settings=====================
"oceanic-material
set background=dark
colorscheme oceanic_material

" ==========================通用配置================================
source $VIM_PATH/general.vim
