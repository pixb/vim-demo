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
call dein#add('Shougo/defx.nvim', {'on_cmd': 'Defx',
			\ 'hook_source:': 'source $VIM_PATH/module-defx.vim'})
call dein#add('kristijanhusak/defx-git', { 'on_source': "let g:defx_git#indicators = {
      \ 'Modified'  : '•',
      \ 'Staged'    : '✚',
      \ 'Untracked' : 'ᵁ',
      \ 'Renamed'   : '≫',
      \ 'Unmerged'  : '≠',
      \ 'Ignored'   : 'ⁱ',
      \ 'Deleted'   : '✖',
      \ 'Unknown'   : '⁇'
      \ }"})

call dein#add('kristijanhusak/defx-icons', { 'on_source': 'defx.nvim', 
			\ 'hook_add': join(["let g:defx_icons_column_length = 1", 
			\ "let g:defx_icons_mark_icon = ''"], "\n")})

call dein#add('Yggdroot/indentLine', { 'on_event': 'BufReadPre', 
			\ 'hook_source': 'source $VIM_PATH/module-indentline.vim'})
if !has('nvim')
	call dein#add('roxma/nvim-yarp')
	call dein#add('roxma/vim-hug-neovim-rpc')
endif
