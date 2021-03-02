call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
call dein#add('neoclide/coc.nvim', {'merged':0, 
            \ 'rev': 'release', 
            \ 'build': 'yarn install --frozen-lockfile',
            \ 'hook_add': 'source $VIM_PATH/module-coc.vim',
            \ 'hook_source': 'source $VIM_PATH/module-lsp.vim'})  
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
" 图标插件
call dein#add('ryanoasis/vim-devicons')
" 主题插件
call dein#add('glepnir/oceanic-material')
" 状态栏插件
call dein#add('glepnir/spaceline.vim',
            \ { 'on_event': ['BufReadPre', 'BufNew'],
            \ 'hook_add': "let g:spaceline_seperate_style='slant-cons'"})
" 标签栏
call dein#add('pixb/vim-buffet', { 'on_event': [ 'BufReadPre', 'BufNew']})
" 启动页
call dein#add('glepnir/dashboard-nvim', { 'hook_add': 'source $VIM_PATH/dashboard-nvim.vim'})
