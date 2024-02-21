require("fzf-lua").setup {
   "fzf-vim",
   winopts = {
      preview = {
         hidden = "nohidden",
         default = "bat"
      },
      width = 0.9,
      height = 0.9
   },
}
