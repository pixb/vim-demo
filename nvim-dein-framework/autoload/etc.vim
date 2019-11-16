function! etc#init()
	let config_path = expand($VIM_PATH.'/core/dein/plugins.yam')
    call etc#providers#dein#_init(config_path)
endfunction
