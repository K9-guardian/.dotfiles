-- vim:foldmethod=marker

return require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   -- Theme {{{
   use "folke/tokyonight.nvim"
   use "HiPhish/nvim-ts-rainbow2"
   -- }}}

   -- Vanilla+ {{{
   use "farmergreg/vim-lastplace"
   use "junegunn/fzf.vim"
   use "junegunn/vim-easy-align"
   use "radenling/vim-dispatch-neovim"
   use "tpope/vim-commentary"
   use "tpope/vim-dispatch"
   use "tpope/vim-repeat"
   use "tpope/vim-surround"
   use { "junegunn/fzf", run = function() vim.fn["fzf#install"]() end }
   -- }}}

   -- Programming {{{
   use "Olical/conjure"
   use "neovim/nvim-lspconfig"
   use "L3MON4D3/LuaSnip"
   use "hrsh7th/cmp-buffer"
   use "hrsh7th/cmp-cmdline"
   use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-path"
   use "hrsh7th/nvim-cmp"
   use "saadparwaiz1/cmp_luasnip"
   use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
   -- }}}

   -- Languages {{{
   use "adimit/prolog.vim"
   use "clojure-vim/vim-jack-in"
   use "fladson/vim-kitty"
   use "lervag/vimtex"
   use "wlangstroth/vim-racket"
   -- }}}
end)
