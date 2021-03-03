call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
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
call dein#add('glepnir/dashboard-nvim')

" Completion{{{
" 自动补全
call dein#add('neoclide/coc.nvim', {'merged':0, 
            \ 'build': 'yarn install --frozen-lockfile',
            \ 'hook_add': 'source $VIM_PATH/module-coc.vim',
            \ 'hook_source': 'source $VIM_PATH/module-lsp.vim'})  
" 常用语
call dein#add('honza/vim-snippets', { 'depends': 'coc.nvim' })
" }}}

" FileType{{{ 
" 文件类型
call dein#add('Shougo/context_filetype.vim')
" log高亮
call dein#add('MTDL9/vim-log-highlighting', {'on_ft': 'log'})
" 快速书写markdown
call dein#add('openpix/vim-md-write', {'on_ft': 'markdown'})
" markdown表格书写工具
call dein#add('dhruvasagar/vim-table-mode', {'on_ft': 'markdown'})
" markdown插件
call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown',
            \ 'hook_add': join([
            \ "let g:vim_markdown_folding_level = 1",
            \ "let g:vim_markdown_folding_style_pythonic = 1",
            \ "let g:vim_markdown_frontmatter = 1",
            \ "let g:vim_markdown_auto_insert_bullets = 1",
            \ "let g:vim_markdown_new_list_item_indent = 0",
            \ "let g:vim_markdown_conceal_code_blocks = 0",
            \ "let g:vim_markdown_conceal = 0",
            \ "let g:vim_markdown_strikethrough = 1",
            \ "let g:vim_markdown_edit_url_in = 'vsplit'",
            \ "let g:vim_markdown_fenced_languages = [",
            \ 'c++=cpp',
            \ 'viml=vim',
            \ 'bash=sh',
            \ 'ini=dosini',
            \ 'js=javascript',
            \ 'json=javascript',
            \ 'jsx=javascriptreact',
            \ 'tsx=typescriptreact',
            \ 'docker=Dockerfile',
            \ 'makefile=make',
            \ "'py=python']"])})
" }}}
