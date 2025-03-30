---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup {
   ensure_installed = {
      "clojure",
      "haskell",
      "java",
      "javascript",
      "prolog",
      "python",
      "racket",
      "rust",
   },
   highlight = { enable = true },
   rainbow = {
      enable = true,
   },
}
