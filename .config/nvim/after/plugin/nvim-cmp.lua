local cmp = require("cmp")

if not cmp then
   print("Could not require module 'cmp'")
   return
end

cmp.setup({
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
   }),
   sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
   }, {
      { name = "buffer" },
   }),
})
