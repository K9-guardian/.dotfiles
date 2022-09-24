local luasnip = require("luasnip")

vim.keymap.set({ "i", "s" }, "jk", function() luasnip.jump(1) end)

require("luasnip.loaders.from_snipmate").lazy_load()
