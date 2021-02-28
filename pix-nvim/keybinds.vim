echom "kebinds run----------------------"

function! s:load_clap() abort
  if dein#tap('vim-clap')
    nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
    nnoremap <silent> <Leader>bb :<C-u>Clap buffers<CR>
    nnoremap <silent> <Leader>fa :<C-u>Clap grep2<CR>
    nnoremap <silent> <Leader>fb :<C-u>Clap marks<CR>
    "like emacs counsel-find-file
    nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
    nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --ignore --hidden --files<cr>
    nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
    nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><cr>
    nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
    nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
    nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
    nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
    nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
    nnoremap <silent> <Leader>oc :<C-u>Clap personalconf<CR>
  endif
endfunction


function! s:load_coc_clap() abort
  if dein#tap('coc-clap')
    " Show all diagnostics
    nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<CR>
    " Manage extensions
    nnoremap <silent> <Leader>;   :Clap coc_extensions<CR>
    " Show commands
    nnoremap <silent> <Leader>,   :Clap coc_commands<CR>
    " Search workspace symbols
    nnoremap <silent> <Leader>cs  :Clap coc_symbols<CR>
    nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
    nnoremap <silent> <leader>ct  :Clap coc_outline<CR>
  endif
endfunction


function! s:load_coc() abort
	if dein#tap('coc.nvim')
		" Remap for do codeAction of selected region
		function! s:cocActionsOpenFromSelected(type) abort
			execute 'CocCommand actions.open ' . a:type
		endfunction
		" Jump definition in other window
		function! s:definition_other_window() abort
			if winnr('$') >= 4 || winwidth(0) < 120
				exec "normal \<Plug>(coc-definition)"
			else
				exec 'vsplit'
				exec "normal \<Plug>(coc-definition)"
			endif
		endfunction
		xmap <silent> <Leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
		nmap <silent> <Leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
		" Do default action for next item.
		nmap <silent> [a  :<C-u>CocNext<CR>
		" Do default action for previous item.
		nmap <silent> ]a  :<C-u>CocPrev<CR>
		" Resume latest coc list
		nnoremap <silent> <Leader>'  :<C-u>CocListResume<CR>
		" Use `[e` and `]e` for navigate diagnostics
		nmap <silent> ]e <Plug>(coc-diagnostic-prev)
		nmap <silent> [e <Plug>(coc-diagnostic-next)
		" Remap for rename current word
		nmap <Leader>cn <Plug>(coc-rename)
		" Remap for format selected region
		vmap <Leader>cf  <Plug>(coc-format-selected)
		nmap <Leader>cf  <Plug>(coc-format-selected)
		" Fix autofix problem of current line
		nmap <Leader>cF  <Plug>(coc-fix-current)
		" Remap keys for gotos
		nmap <silent> gd :<C-u>call <sid>definition_other_window()<CR>
		nmap <silent> gy <Plug>(coc-type-definition)
		nmap <silent> <Leader>ci <Plug>(coc-implementation)
		nmap <silent> gr <Plug>(coc-references)
		" Use K for show documentation in float window
		nnoremap <silent> K :call CocActionAsync('doHover')<CR>
		nnoremap <silent> <Leader>cd :call CocActionAsync('doHover')<CR>
		" use <c-space> for trigger completion.
		inoremap <silent><expr> <c-space> coc#refresh()
		nmap ]g <Plug>(coc-git-prevchunk)
		nmap [g <Plug>(coc-git-nextchunk)
		" show chunk diff at current position
		nmap <Leader>gi <Plug>(coc-git-chunkinfo)
		" show commit contains current position
		nmap <Leader>gm <Plug>(coc-git-commit)
		" float window scroll
		nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
		nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
		" Use <TAB> for selections ranges.
		" NOTE: Requires 'textDocument/selectionRange' support from the language server.
		" coc-tsserver, coc-python are the examples of servers that support it.
		nmap <silent> <TAB> <Plug>(coc-range-select)
		xmap <silent> <TAB> <Plug>(coc-range-select)
		" Add `:OR` command for organize imports of the current buffer.
		command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
		nnoremap <silent> <Leader>co :<C-u>OR<CR>
		" multiple cursors
		nmap <silent><M-s> <Plug>(coc-cursors-position)
		nmap <expr> <silent><M-d> <SID>select_current_word()
		xmap <silent><M-d> <Plug>(coc-cursors-range)
		" use normal command like `<Leader>xi(`
		nmap <silent><M-c>  <Plug>(coc-cursors-operator)

		function! s:select_current_word()
			if !get(g:, 'coc_cursors_activated', 0)
				return "\<Plug>(coc-cursors-word)"
			endif
			return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
		endfunc
		" Use `:Format` for format current buffer
		command! -nargs=0 Format :call CocAction('format')

		nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
		" coc-explorer
		noremap <silent> <Leader>j :execute 'CocCommand explorer' .
					\ ' --toggle' .
					\ ' --position=floating' .
					\ ' --sources=file+'<CR>
		" Introduce function text object
		" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
		xmap if <Plug>(coc-funcobj-i)
		xmap af <Plug>(coc-funcobj-a)
		omap if <Plug>(coc-funcobj-i)
		omap af <Plug>(coc-funcobj-a)
	endif
	nmap gcj :execute 'CocCommand docthis.documentThis'<CR>
endfunction

function! s:load_defx() abort
  if dein#tap('defx.nvim')
    nnoremap <silent> <Leader>e
      \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
    nnoremap <silent> <Leader>F
      \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
  endif
endfunction

let s:plugins = {
  \ 'coc_clap':'coc-clap',
  \ 'coc':'coc.nvim','clap': 'vim-clap', 'defx': 'defx.nvim',
  \ }

function! s:load_plugins_keybinds(pmap) abort
  for key in keys(a:pmap)
    try
      exec 'call s:load_'.key.'()'
    catch /.*/
      echo 'Load plugins keybinds error:' . v:exception
    finally
    endtry
  endfor
endfunction

function! s:get_key(value,pmap) abort
  for [key,val] in items(a:pmap)
    if val ==? a:value
      return key
    endif
  endfor
  return ''
endfunction

function! s:load_keybinds(plugins) abort
  let pmap = copy(a:plugins)
  while g:thinkvim_disable_mappings
    return
  endwhile
  if empty(g:thinkvim_disable_pmaping)
    call s:load_plugins_keybinds(pmap)
  else
    for i in g:thinkvim_disable_pmaping
      if index(values(pmap),i) >= 0
        let key = s:get_key(i, pmap)
        call remove(pmap,key)
      endif
    endfor
    call s:load_plugins_keybinds(pmap)
  endif
endfunction

call s:load_keybinds(s:plugins)

