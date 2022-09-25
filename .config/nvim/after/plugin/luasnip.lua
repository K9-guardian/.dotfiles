local luasnip = require("luasnip")

vim.keymap.set({ "i", "s" }, "jk", function() luasnip.jump(1) end)

require("luasnip.loaders.from_snipmate").lazy_load()

vim.api.nvim_create_user_command("EditSnippets", function(_)
   require("luasnip.loaders").edit_snippet_files({})
end, {})
