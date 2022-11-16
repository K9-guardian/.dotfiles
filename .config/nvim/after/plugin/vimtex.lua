vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

vim.g.vimtex_indent_enabled = 0
vim.g.vimtex_indent_bib_enabled = 0

vim.g.vimtex_imaps_leader = "@"

vim.g.vimtex_mappings_disable = { i = { "]]" } }

-- MFW can't specify position of viewer in zathurarc
local function open_viewer()
   local nvim_id = io.popen("xdotool getactivewindow", "r"):read("*a")
   print(nvim_id)
   vim.cmd("VimtexCompile")
   vim.defer_fn(function() -- Best I could do :p
      if (vim.b.vimtex.viewer.xwin_id and vim.b.vimtex.viewer.xwin_id ~= 0) then
         os.execute("wmctrl -ir " .. vim.b.vimtex.viewer.xwin_id .. " -b remove,maximized_vert,maximized_horz")
         os.execute("xdotool windowsize " .. vim.b.vimtex.viewer.xwin_id .. " 50% 100%")
         os.execute("xdotool windowmove " .. vim.b.vimtex.viewer.xwin_id .. " 50% 100%")
         os.execute("wmctrl -ia " .. nvim_id)
      end
   end, 1000)
end

local function close_viewers()
   if (vim.b.vimtex.viewer.xwin_id and vim.b.vimtex.viewer.xwin_id ~= 0) then
      os.execute("xdotool windowclose " .. vim.b.vimtex.viewer.xwin_id)
   end
end

vim.api.nvim_create_augroup("vimtex", {})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventInitPost", group = "vimtex", callback = open_viewer
})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventQuit", group = "vimtex", callback = close_viewers
})
vim.api.nvim_create_autocmd("User", {
   pattern = "VimtexEventQuit", group = "vimtex", command = "VimtexClean"
})
