" 1. install dein
function! etc#providers#dein#_init(config_paths)
	let l:cache_path=expand('~/.cache/vim')
    if has('vim_starting')
        if $runtimepath !~# '/dein.vim'
            let s:dein_dir = l:cache_path .'/repos/github.com/Shougo/dein.vim'
            " Clone dein 
            if ! isdirectory(s:dein_dir)
                execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
                if v:shell_error
                    call s:error('dein installation has failed ! is git installed?')
                endif
            endif
    	endif
    endif
endfunction
