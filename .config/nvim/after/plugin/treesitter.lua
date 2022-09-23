local enabled_languages = { "clojure", "racket" }
local parsers = require("nvim-treesitter.parsers")

require("nvim-treesitter.configs").setup {
   highlight = { enable = true },
   rainbow = {
      enable = true,
      disable = vim.tbl_filter(
         function(parser) return not vim.tbl_contains(enabled_languages, parser) end,
         parsers.available_parsers()
      )
   },
}
