vim.keymap.set("n", "<C-p>", "<Cmd>Files<CR>")

vim.keymap.set("n", "]q", "<Cmd>cnext<CR>")
vim.keymap.set("n", "[q", "<Cmd>cprevious<CR>")
vim.keymap.set("n", "<Leader>cq", "<Cmd>cclose<CR>", { silent = false })
