vim.keymap.set("c", "<C-a>", "<Home>")

vim.keymap.set("n", "<Leader>co", "<Cmd>copen<CR>", { silent = false })
vim.keymap.set("n", "<Leader>cc", "<Cmd>cclose<CR>", { silent = false })
vim.keymap.set("n", "<Leader>cq", "<Cmd>cclose<CR>", { silent = false })

vim.keymap.set("v", "<Enter>", "<Plug>(EasyAlign)")
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")

vim.keymap.set("n", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("n", "<C-w>f", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w>f", "<Cmd>vertical wincmd f<CR>")

-- Add jumps for paging
vim.keymap.set("n", "<C-d>", "m'<C-d>")
vim.keymap.set("n", "<C-u>", "m'<C-u>")
vim.keymap.set("n", "<C-f>", "m'<C-f>")
vim.keymap.set("n", "<C-b>", "m'<C-b>")

-- Returns a function that checks if motion was used with a count.
-- If so, add position to the jumplist. Useful for big relative jumps like "20j".
local function count_motion_with_jump(motion)
   return function()
      local count = vim.v.count1
      if count > 1 then
         vim.cmd("normal! m'")
      end
      vim.cmd("normal! " .. count .. motion)
   end
end

vim.keymap.set("n", "j", count_motion_with_jump("j"))
vim.keymap.set("n", "k", count_motion_with_jump("k"))

-- Returns a function that search for the word under the cursor.
-- If the cursor is already on the word, keep the cursor there.
-- Otherwise, move the cursor to the next occurrence.
local function search_word_anchor(flags)
   return function()
      flags = flags or ""
      local word = vim.fn.expand("<cword>")
      local pattern = "\\<" .. vim.fn.escape(word, "\\/.*$^~[]") .. "\\>"
      local last_pattern = vim.fn.getreg("/")
      local current_hlsearch = vim.o.hlsearch

      vim.fn.setreg("/", pattern)
      vim.o.hlsearch = true

      vim.cmd("normal! m'")

      if last_pattern == pattern and current_hlsearch then
         vim.fn.search(pattern, flags .. "W")
      else
         vim.fn.search(pattern, flags .. "cn")
      end
   end
end

vim.keymap.set("n", "*", search_word_anchor())
vim.keymap.set("n", "#", search_word_anchor("b"))

vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("ReloadConfig", ReloadConfig, {})
