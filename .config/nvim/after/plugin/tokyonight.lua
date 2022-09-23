require("tokyonight").setup {
   style = "night",
   transparent = true,
   styles = { sidebars = "transparent" },
   on_colors = function(colors)
      colors.fg_gutter = colors.purple
   end,
   on_highlights = function(highlights, colors)
      highlights.Folded = {
         bg = colors.bg,
         fg = colors.comment
      }
      highlights.LspReferenceText.bg = colors.bg_highlight
      highlights.LspReferenceRead.bg = colors.bg_highlight
      highlights.LspReferenceWrite.bg = colors.bg_highlight
   end,
}

vim.cmd("colorscheme tokyonight")
