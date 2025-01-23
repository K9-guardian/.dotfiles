vim.keymap.set("n", "<C-p>", require("fzf-lua").files)

vim.keymap.set("n", "]q", "<Cmd>cnext<CR>")
vim.keymap.set("n", "[q", "<Cmd>cprevious<CR>")
vim.keymap.set("n", "<Leader>co", "<Cmd>copen<CR>", { silent = false })
vim.keymap.set("n", "<Leader>cc", "<Cmd>cclose<CR>", { silent = false })

vim.keymap.set("v", "<Enter>", "<Plug>(EasyAlign)")
vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")

vim.keymap.set("n", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("n", "<C-w>f", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w><C-F>", "<Cmd>vertical wincmd f<CR>")
vim.keymap.set("v", "<C-w>f", "<Cmd>vertical wincmd f<CR>")

vim.api.nvim_create_user_command("W", "write", {})
