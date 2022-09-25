vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_indent_bib_enabled = 0

vim.g.vimtex_imaps_leader = "@"

-- TODO: Use xdotool to resize terminal and viewer
vim.cmd([[
" Close viewers when VimTeX buffers are closed
function! CloseViewers()
 if executable('xdotool')
       \ && exists('b:vimtex.viewer.xwin_id')
       \ && b:vimtex.viewer.xwin_id > 0
   call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
 endif
endfunction

" Compile on initialization, cleanup on quit
augroup vimtex
 au!
 au User VimtexEventQuit     VimtexClean
 au User VimtexEventQuit call CloseViewers()
 au User VimtexEventInitPost VimtexCompile
augroup END
]])
