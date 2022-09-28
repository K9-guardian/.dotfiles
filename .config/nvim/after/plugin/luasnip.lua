local luasnip = require("luasnip")
luasnip.config.setup({ enable_autosnippets = true })

vim.keymap.set({ "i", "s" }, "jk", function() luasnip.jump(1) end)

require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets" })

vim.api.nvim_create_user_command("EditSnippets", function(_)
   require("luasnip.loaders").edit_snippet_files({})
end, {})
