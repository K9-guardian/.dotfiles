---@diagnostic disable: undefined-global

local function in_mathzone() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end

local function in_list()
   return vim.tbl_contains({ "enumerate", "itemize" }, vim.fn["vimtex#env#get_inner"]()["name"])
end

return {
   s({ trig = "bgn", name = "Setup document" }, {
      t {
         "\\documentclass{article}",
         "\\usepackage[margin=1in]{geometry}",
         "\\usepackage{amsmath,amssymb,bm,centernot,dsfont,enumerate,graphicx,stackengine}",
         "\\newcommand{\\N}{\\mathds{N}}",
         "\\newcommand{\\Z}{\\mathds{Z}}",
         "\\newcommand{\\R}{\\mathds{R}}",
         "\\newcommand{\\Q}{\\mathds{Q}}",
         "\\newcommand{\\C}{\\mathds{C}}",
         "\\newcommand{\\set}[1]{\\{#1\\}}",
         "\\renewcommand{\\lor}{\\text{ or }}",
         "\\renewcommand{\\land}{\\text{ and }}",
         "\\newcommand{\\qmat}[4]{\\begin{bmatrix} #1 & #2 \\\\ #3 & #4 \\end{bmatrix}}",
         "\\newcommand{\\vect}[1]{\\setstackEOL{,}\\bracketVectorstack{#1}}",
         "",
         "\\title{",
      }, i(1), t {
         "}",
         "\\author{Krishna Girkar A16674208}",
         "\\date{",
      },
      f(function() return os.date("%B %d, %Y") end, {}),
      t {
         "}",
         "",
         "\\begin{document}",
         "",
         "\\maketitle",
         "",
         "",
      }, i(0), t {
         "",
         "",
         "\\end{document}",
      },
   }),
   parse({ trig = "im", name = "Inline math" }, "\\($1\\)$0"),
   parse({ trig = "dm", name = "Display math" }, "\\[$1\\]$0"),
   parse({ trig = "enum", name = "Enumerate environment" },
      "\\begin{enumerate}\n\t\\item $0\n\\end{enumerate}"),
   parse({ trig = "item", name = "Itemize environment" },
      "\\begin{itemize}\n\t\\item $0\n\\end{itemize}"),
   s({ trig = "i", name = "Insert new item" }, { t("\\item ") }, { show_condition = in_list }),
   s({ trig = "p", name = "Insert new item page" },
      { t({ "\\clearpage", "\\item " }) },
      { show_condition = in_list }),
}, {
   s({
      trig = "([%a}])(%d)",
      regTrig = true,
      wordTrig = false,
      name = "Subscript"
   }, {
      f(function(_, snip)
         return string.format("%s_%s", snip.captures[1], snip.captures[2])
      end, {}),
      i(0),
   }, { condition = in_mathzone }),
   s({
      trig = "([%a}])_(%d%d)",
      regTrig = true,
      wordTrig = false,
      name = "Subscript 2"
   }, {
      f(function(_, snip)
         return string.format("%s_{%s}", snip.captures[1], snip.captures[2])
      end, {}),
      i(0),
   }, { condition = in_mathzone }),
   s({
      trig = "([%a])bf",
      regTrig = true,
      wordTrig = false,
      name = "Math boldface"
   }, {
      f(function(_, snip) return "\\mathbf{" .. snip.captures[1] .. "}" end, {}),
      i(0),
   }, { condition = in_mathzone }),
   s({ trig = "inv", name = "Inverse" }, { t("^{-1}") }, { condition = in_mathzone })
}
