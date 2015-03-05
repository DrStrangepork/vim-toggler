" Plugin for quickly toggling stuff
" Maintainer:   Rick Kasten <rickkasten@gmail.com>
" URL:          http://github.com/DrStrangepork/vim-toggleindent

" Only do this when not done yet for this buffer
if exists("b:vim_toggler_indent_plugin")
    finish
endif
let b:vim_toggler_indent_plugin = 1
if exists("b:vim_toggler_numbers_plugin")
    finish
endif
let b:vim_toggler_numbers_plugin = 1
if exists("b:vim_toggler_wrap_plugin")
    finish
endif
let b:vim_toggler_wrap_plugin = 1

fun! s:ToggleIndent()
    if &indent == ""
        let &indent = s:old_indent
        echo "Indent is for Vim (" . &indent . ")"
    else
        let s:old_indent = &indent
        let &indent=""
        echo "Indent is for terminal"
    endif
endfunction

fun! s:ToggleNumbers()
    if &number == ""
        let &number = s:old_number
        echo "Numbers on"
    else
        let s:old_number = &number
        let &number=""
        echo "Numbers off"
    endif
endfunction

fun! s:ToggleWrap()
    if &wrap == ""
        let &wrap = s:old_wrap
        echo "Wrap on"
    else
        let s:old_wrap = &wrap
        let &wrap=""
        echo "Wrap off"
    endif
endfunction

" Mapping
" The default mapping is <F12>. If you want to map it to some other key,
" do so below.
if !exists("no_plugin_maps") && !exists("no_toggler_indent_maps")
    if !hasmapto('<SID>ToggleIndent()')
        noremap  <F3> :call <SID>ToggleIndent()<CR>
        inoremap <F3> <Esc>:call <SID>ToggleIndent()<CR>a
    endif
endif
if !exists("no_plugin_maps") && !exists("no_toggler_number_maps")
    if !hasmapto('<SID>ToggleNumbers()')
        noremap  <F4> :call <SID>ToggleNumbers()<CR>
        inoremap <F4> <Esc>:call <SID>ToggleNumbers()<CR>a
    endif
endif
if !exists("no_plugin_maps") && !exists("no_toggler_wrap_maps")
    if !hasmapto('<SID>ToggleWrap()')
        noremap  <F5> :call <SID>ToggleWrap()<CR>
        inoremap <F5> <Esc>:call <SID>ToggleWrap()<CR>a
    endif
endif
