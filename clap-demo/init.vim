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

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('neoclide/coc.nvim', {'merged':0, 
			  \'rev': 'release', 
			  \'build': 'yarn install --frozen-lockfile',
			  \'hook_add': 'source $VIM_PATH/module-coc.vim',
			  \'hook_source': 'source $VIM_PATH/module-lsp.vim'})  
  call dein#add('liuchengxu/vim-clap', { 'merged': 0, 
			  \ 'build': 'bash install.sh', 
			  \ 'on_map':'{ n: <Plug>}', 
			  \ 'hook_add': 'source $VIM_PATH/module-clap.vim'})
  call dein#add('vn-ki/coc-clap', {
  	\ 'on_source:': 'vim-clap'
    \ })
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has('vim-starting')
    call dein#install()
endif
source $VIM_PATH/keybinds.vim
