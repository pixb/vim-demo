inoremap jk <ESC>
let g:mapleader="\<Space>"
let g:maplocalleader=";"

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
  call dein#add('liuchengxu/vim-which-key',{'on_cmd': ['Whichkey', 'Whichkey!'],
			  \'hook_add': join(["let g:which_key_map =  { 'name' : 'Leader'}",
			  \"let g:which_key_localmap =  {'name' : 'LocalLeader'}"], "\n"),
			  \"hook_post_source": 
			  \ "function! s:register_whichkey()\n
			  \	let s:leader_key=substitute(get(g:, 'mapleader', '\\'), ' ', '<Space>', '')\n
			  \ 	let s:localleader_key= get(g:, 'maplocalleader', ';')\n
			  \	call which_key#register(s:leader_key, 'g:which_key_map')\n
			  \	call which_key#register(s:localleader_key, 'g:which_key_localmap')\n
			  \ endfunction \n
			  \ call s:register_whichkey()"})
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


let g:which_key_map =  {}
let g:which_key_map = {
      \ 'name' : '+ThinkVim root ' ,
      \ '1' : 'select window-1'      ,
      \ '2' : 'select window-2'      ,
      \ '3' : 'select window-3'      ,
      \ '4' : 'select window-4'      ,
      \ '5' : 'select window-5'      ,
      \ '6' : 'select window-6'      ,
      \ '7' : 'select window-7'      ,
      \ '8' : 'select window-8'      ,
      \ '9' : 'select window-9'      ,
      \ '0' : 'select window-10'      ,
      \ 'a' : {
            \ 'name' : '+coc-code-action',
            \ 'c' : 'code action',
            \ },
      \ 'b' : {
            \ 'name' : '+buffer',
            \ 'b' : 'buffer list',
            \ 'c' : 'keep current buffer',
            \ 'o' : 'keep input buffer',
            \ },
      \ 'e' : 'open file explorer' ,
      \ '-' : 'choose window by {prompt char}' ,
      \ 'd' : 'search cursor word on Dash.app' ,
      \ 'G' : 'distraction free writing' ,
      \ 'F' : 'find current file' ,
      \ 'f' : {
            \ 'name' : '+search {files cursorword word outline}',
            \ 'f' : 'find file',
            \ 'r' : 'search {word}',
            \ 'c' : 'change colorscheme',
            \ 'w' : 'search cursorword',
            \ 'v' : 'search outline',
            \ },
      \ 'm' : 'open mundotree' ,
      \ 'w' : 'save file',
      \ 'j' : 'open coc-explorer',
      \ 's' : 'open startify screen',
      \ 'p' : 'edit pluginsconfig {filename}',
      \ 'x' : 'coc cursors operate',
      \ 'g'  :{
                \'name':'+git-operate',
                \ 'd'    : 'Gdiff',
                \ 'c'    : 'Gcommit',
                \ 'b'    : 'Gblame',
                \ 'B'    : 'Gbrowse',
                \ 'S'    : 'Gstatus',
                \ 'p'    : 'git push',
                \ 'l'    : 'GitLogAll',
                \ 'h'    : 'GitBranch',
                \},
      \ 'c'    : {
              \ 'name' : '+coc list' ,
              \ 'a'    : 'coc CodeActionSelected',
              \ 'd'    : 'coc Diagnostics',
              \ 'c'    : 'coc Commands',
              \ 'e'    : 'coc Extensions',
              \ 'j'    : 'coc Next',
              \ 'k'    : 'coc Prev',
              \ 'o'    : 'coc OutLine',
              \ 'r'    : 'coc Resume',
              \ 'n'    : 'coc Rename',
              \ 's'    : 'coc Isymbols',
              \ 'g'    : 'coc Gitstatus',
              \ 'f'    : 'coc Format',
              \ 'm'    : 'coc search word to multiple cursors',
              \ },
      \ 'q' : {
            \ 'name' : '+coc-quickfix',
            \ 'f' : 'coc fixcurrent',
            \ },
      \ 't' : {
            \ 'name' : '+tab-operate',
            \ 'n' : 'new tab',
            \ 'e' : 'edit tab',
            \ 'm' : 'move tab',
            \ },
      \ }
let g:which_key_map[' '] = {
      \ 'name' : '+easymotion-jumpto-word ' ,
      \ 'b' : ['<plug>(easymotion-b)' , 'beginning of word backward'],
      \ 'f' : ['<plug>(easymotion-f)' , 'find {char} to the left'],
      \ 'w' : ['<plug>(easymotion-w)' , 'beginning of word forward'],
      \ }

let g:which_key_localmap ={
      \ 'name' : '+LocalLeaderKey'  ,
      \ 'v'    : 'open vista show outline',
      \ 'r'    : 'quick run',
      \ 'm'    : 'toolkit Menu',
      \ 'g' : {
            \ 'name' : '+golang-toolkit',
            \ 'i'    : 'go impl',
            \ 'd'    : 'go describe',
            \ 'c'    : 'go callees',
            \ 'C'    : 'go callers',
            \ 's'    : 'go callstack',
            \ },
      \ }

let g:which_key_rsbgmap = {
      \ 'name' : '+RightSquarebrackets',
      \ 'a'    : 'ale nextwarp',
      \ 'c'    : 'coc nextdiagnostics',
      \ 'b'    : 'next buffer',
      \ 'g'    : 'coc gitnextchunk',
      \ ']'    : 'jump prefunction-golang',
      \ }


let g:which_key_lsbgmap = {
      \ 'name' : '+LeftSquarebrackets',
      \ 'a'    : 'ale prewarp',
      \ 'c'    : 'coc prediagnostics',
      \ 'b'    : 'pre buffer',
      \ 'g'    : 'coc gitprevchunk',
      \ '['    : 'jump nextfunction-golang',
      \ }

let s:current_colorscheme = get(g:,"colors_name","")
if  s:current_colorscheme == "base16-default-dark"
    highlight WhichKeySeperator guibg=NONE ctermbg=NONE guifg=#a1b56c ctermfg=02
endif

" call which_key#register('<Space>', 'g:which_key_map')
" call which_key#register(';', 'g:which_key_localmap')
" call which_key#register(']', 'g:which_key_rsbgmap')
" call which_key#register('[', 'g:which_key_lsbgmap')

let s:enable_whichkey = dein#tap('vim-which-key')
if s:enable_whichkey
