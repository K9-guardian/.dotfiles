-- vim:foldmethod=marker

return require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   -- Theme {{{
   use "folke/tokyonight.nvim"
   use "p00f/nvim-ts-rainbow"
   -- }}}

   -- Vanilla+ {{{
   use "farmergreg/vim-lastplace"
   use "junegunn/vim-easy-align"
   use "tpope/vim-commentary"
   use "tpope/vim-repeat"
   use "tpope/vim-surround"
   use { "junegunn/fzf", run = function() vim.fn["fzf#install"]() end }
   use { "junegunn/fzf.vim" }
   -- }}}

   -- Programming {{{
   use "Olical/conjure"
   use "neovim/nvim-lspconfig"
   use 'L3MON4D3/LuaSnip'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/nvim-cmp'
   use 'saadparwaiz1/cmp_luasnip'
   use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
   -- }}}

   -- Languages {{{
   use "adimit/prolog.vim"
   use "fladson/vim-kitty"
   use "lervag/vimtex"
   use "wlangstroth/vim-racket"
   -- }}}
end)
