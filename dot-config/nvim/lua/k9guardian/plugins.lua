-- vim:foldmethod=marker

return require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   -- Theme {{{
   use "folke/tokyonight.nvim"
   -- }}}

   -- Vanilla+ {{{
   use "farmergreg/vim-lastplace"
   use "junegunn/vim-easy-align"
   use "michaeljsmith/vim-indent-object"
   use "radenling/vim-dispatch-neovim"
   use "tpope/vim-commentary"
   use "tpope/vim-dispatch"
   use "tpope/vim-fugitive"
   use "tpope/vim-repeat"
   use "tpope/vim-surround"
   use "tpope/vim-unimpaired"
   use { "ibhagwan/fzf-lua", requires = { "nvim-tree/nvim-web-devicons" } }
   -- }}}
end)
