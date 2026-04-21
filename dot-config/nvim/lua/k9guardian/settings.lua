vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = { "unnamedplus" }

vim.opt.completeopt = { "menu", "noinsert", "noselect" }

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrapscan = false

vim.opt.conceallevel = 2
vim.opt.colorcolumn = "100"

vim.g.mapleader = ","
vim.g.maplocalleader = " "

vim.opt.updatetime = 100

vim.opt.spelllang = "en_us"

vim.g["conjure#filetypes"] = { "clojure", "racket" }

local function render_tabline()
   local result = ""
   for tab_index = 1, vim.fn.tabpagenr("$") do
      local is_current = tab_index == vim.fn.tabpagenr()
      local window_number = vim.fn.tabpagewinnr(tab_index)
      local buffer_number = vim.fn.tabpagebuflist(tab_index)[window_number]
      local buffer_name = vim.fn.bufname(buffer_number)
      local filename = buffer_name ~= "" and vim.fn.fnamemodify(buffer_name, ":t") or "[No Name]"

      local is_modified = false
      for _, buf in ipairs(vim.fn.tabpagebuflist(tab_index)) do
         if vim.fn.getbufvar(buf, "&modified") == 1 then
            is_modified = true
            break
         end
      end

      result = result .. "%" .. tab_index .. "T"
      result = result .. (is_current and "%#TabLineSel#" or "%#TabLine#")
      result = result .. " " .. tab_index .. ":" .. filename
      if is_modified then
         result = result .. " [+]"
      end
      result = result .. " "
   end
   return result .. "%T%#TabLineFill#"
end

_G.k9_render_tabline = render_tabline
vim.opt.tabline = "%!v:lua.k9_render_tabline()"
