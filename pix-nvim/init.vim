inoremap jk <ESC>
set number
let g:mapleader="\<Space>"
let g:maplocalleader=";"

let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" disable all keymaps of plugins
let g:thinkvim_disable_mappings = 0
" disable some plugins keymap
let g:thinkvim_disable_pmaping = []
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  source $VIM_PATH/plugins.vim
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim-starting')
    call dein#install()
endif
source $VIM_PATH/keybinds.vim
