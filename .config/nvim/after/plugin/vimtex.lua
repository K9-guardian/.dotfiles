vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_indent_bib_enabled = 0

vim.g.vimtex_imaps_leader = "@"

vim.g.vimtex_mappings_disable = { i = { "]]" } }

local function close_viewers()
   if (os.execute("xdotool --version") == 0 and
       vim.b.vimtex.viewer.xwin_id and
       vim.b.vimtex.viewer.xwin_id ~= "0") then
      os.execute("xdotool windowclose " .. vim.b.vimtex.viewer.xwin_id)
   end
end

vim.api.nvim_create_augroup("vimtex", {})
-- TODO: resize zathura
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventInitPost", group = "vimtex", command = "VimtexCompile"
})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventQuit", group = "vimtex", callback = close_viewers
})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventQuit", group = "vimtex", command = "VimtexClean"
})
