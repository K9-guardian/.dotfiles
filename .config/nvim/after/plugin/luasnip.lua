local luasnip = require("luasnip")
luasnip.config.setup({ enable_autosnippets = true })

vim.keymap.set({ "i" }, "<Tab>", function()
   if luasnip.jumpable(1) then luasnip.jump(1) end
end)
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
   if luasnip.jumpable(-1) then luasnip.jump(-1) end
end)

require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

vim.api.nvim_create_user_command("EditSnippets", function(_)
   require("luasnip.loaders").edit_snippet_files({})
end, {})
