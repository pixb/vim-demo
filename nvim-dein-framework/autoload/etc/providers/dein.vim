" 1. install dein
" 2. set runtimepath
" 3. dein init
function! etc#providers#dein#_init(config_paths)
	let l:cache_path=expand('~/.cache/vim')
	if has('vim_starting')
		if $runtimepath !~# '/dein.vim'
            	let s:dein_dir = l:cache_path .'/repos/github.com/Shougo/dein.vim'
            		" Clone dein 
            		if ! isdirectory(s:dein_dir)
                		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
                	endif
                	if v:shell_error
                    		call s:error('dein installation has failed ! is git installed?')
				finish
            		endif
			" add runtimepath
			execute 'set runtimepath+='.substitute(
			\ fnamemodify(s:dein_dir,':p'),'/$','','')
    		endif
    	endif
	" dein init
	" if dein#load_state(l:cache_path)
		" parse configure file
	let l:config_list = [{'repo':'Shougo/dein.vim'},{
				\ 'repo': 'bagrat/vim-buffet',
				\ 'hook_add': 'source $VIM_PATH/layers/+ui/buffet/config.vim'
				\ }]
	" Start propagating file paths and plugin presets
	call dein#begin(l:cache_path,extend([expand('<sfile>')],a:config_paths))
	if empty(l:config_list)
		echom "Empty plugin list"
		return 
	endif
	for plugin in l:config_list
		call dein#add(plugin['repo'],extend(plugin,{},'keep'))
	endfor

	" Add any local ./dev plugins
	if isdirectory(g:etc#vim_path.'dev')
		call dein local(g:etc#vim_path.'/dev',{'frozen':1,'merged':0})
	endif

	call dein#end()
	call dein#save_state()


	
endfunction
