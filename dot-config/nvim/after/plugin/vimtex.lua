vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_automatic = 0

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

vim.g.vimtex_imaps_leader = "@"

vim.g.vimtex_mappings_disable = { i = { "]]" } }

-- Move and resize zathura when it is first opened.
local function open_viewer()
   local viewer_opened = vim.b.vimtex.viewer.xwin_id and vim.b.vimtex.viewer.xwin_id ~= 0

   vim.cmd("VimtexView")
   vim.cmd("sleep")
   if (not viewer_opened) then
      os.execute("wmctrl -ir " .. vim.b.vimtex.viewer.xwin_id .. " -b remove,maximized_vert,maximized_horz")
      os.execute("xdotool windowsize " .. vim.b.vimtex.viewer.xwin_id .. " 50% 100%")
      os.execute("xdotool windowmove " .. vim.b.vimtex.viewer.xwin_id .. " 50% 100%")
   end
end

local function close_viewer()
   if (vim.b.vimtex.viewer.xwin_id and vim.b.vimtex.viewer.xwin_id ~= 0) then
      os.execute("xdotool windowclose " .. vim.b.vimtex.viewer.xwin_id)
      vim.cmd("VimtexClean")
   end
end

vim.api.nvim_create_augroup("vimtex", {})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventCompileSuccess", group = "vimtex", callback = open_viewer
})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventQuit", group = "vimtex", callback = close_viewer
})
