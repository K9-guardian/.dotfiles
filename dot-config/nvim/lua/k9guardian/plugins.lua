-- vim:foldmethod=marker

return require("packer").startup(function(use)
   use "wbthomason/packer.nvim"
   -- Theme {{{
   use "HiPhish/rainbow-delimiters.nvim"
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

   -- Programming {{{
   use "L3MON4D3/LuaSnip"
   use "Olical/conjure"
   use "hrsh7th/cmp-buffer"
   use "hrsh7th/cmp-cmdline"
   use "hrsh7th/cmp-nvim-lsp"
   use "hrsh7th/cmp-path"
   use "williamboman/mason.nvim"
   use "williamboman/mason-lspconfig.nvim"
   use "hrsh7th/nvim-cmp"
   use "neovim/nvim-lspconfig"
   use "saadparwaiz1/cmp_luasnip"
   use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
   -- }}}

   -- Languages {{{
   use "adimit/prolog.vim"
   use "clojure-vim/vim-jack-in"
   use "fladson/vim-kitty"
   use "lervag/vimtex"
   use "wlangstroth/vim-racket"
   use "kaarmu/typst.vim"
   use { "chomosuke/typst-preview.nvim", tag = 'v1.*' }
   -- }}}
end)
