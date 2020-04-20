" jaskeleton - just another skeleton plugin!
"
"   author: camilo ariza <camilo.ariza@protonmail.com>
"  created: Sat 18 Apr 2020 22:14:01 -0300
" modified: Sun 19 Apr 2020 22:36:59 -0300

if !exists('g:jaskeleton_template_dir')
    let g:jaskeleton_template_dir = expand('<sfile>:p:h:h') . '/template'
    if ! isdirectory(g:jaskeleton_template_dir)
        echoerr '[ERROR] jaskeleton directory not found: '
              \ . g:jaskeleton_template_dir
        finish
    endif
endif

let g:jaskeleton_user = get(g:, 'jaskeleton_user', 'undefined')
let g:jaskeleton_email = get(g:, 'jaskeleton_email', 'undefined')
let g:jaskeleton_date_fmt = get(g:, 'jaskeleton_date_fmt', '%a %d %b %Y %H:%M:%S %z')

" modified tags per filetype
let g:jaskeleton_mod_tag_py = '__modified__ = "{DATE}"'
let g:jaskeleton_mod_tag_vim = '" modified: {DATE}'

" read template on new buffer
autocmd BufNewFile * silent! call jaskeleton#read_template()

" update last modified date on file pre-write
autocmd BufWritePre * silent! call jaskeleton#update_modified()


function! jaskeleton#read_template()
    execute '0read ' . get(g:, 'jaskeleton_template_dir')
                   \ . '/skeleton.'
                   \ .  expand('%:e')

    let g:jaskeleton_date = strftime(get(g:, 'jaskeleton_date_fmt'))
    %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=get(g:, submatch(1))#ge
    unlet g:jaskeleton_date

    normal Gdd

endfunction

function! jaskeleton#update_modified()
    if !exists('g:jaskeleton_mod_tag_' . expand('%:e'))
        return
    endif

    let l:tag = get(g:, 'jaskeleton_mod_tag_' . expand('%:e'))
    let l:expr = '^'.substitute(tag, '{DATE}', '.*', 'g').'$'
    let l:date = strftime(get(g:, 'jaskeleton_date_fmt'))
    let l:new = substitute(tag, '{DATE}', date, 'g')

    let l:winview = winsaveview()
    silent! execute '/'.expr.'/s/'.expr.'/'.new
    call winrestview(l:winview)
endfunction
