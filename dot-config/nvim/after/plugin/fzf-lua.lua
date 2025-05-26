require("fzf-lua").setup {
   winopts = {
      preview = {
         hidden = "nohidden",
         default = "bat"
      },
      width = 0.9,
      height = 0.9
   },
}

vim.keymap.set("n", "<C-p>", require("fzf-lua").files)
vim.keymap.set("n", "<C-S-p>", require("fzf-lua").git_files)

vim.api.nvim_create_user_command('Rg', function(opts)
   require('fzf-lua').grep({
      search  = opts.args,
      -- Add "--follow" to grep symlinks
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --follow --max-columns=4096 -e",
   })
end, {
   nargs = '*',
   desc = 'Search with fzf-lua grep',
   complete = 'file',
})
