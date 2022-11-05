---@diagnostic disable: undefined-global

local function in_mathzone() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end

return {
   s({ trig = "bgn", name = "Setup document" }, {
      t {
         "\\documentclass{article}",
         "\\usepackage[margin=1in]{geometry}",
         "\\usepackage{amsmath,amssymb,bm,centernot,dsfont,enumerate,graphicx,verbatim,stackengine}",
         "\\newcommand{\\N}{\\mathds{N}}",
         "\\newcommand{\\Z}{\\mathds{Z}}",
         "\\newcommand{\\R}{\\mathds{R}}",
         "\\newcommand{\\Q}{\\mathds{Q}}",
         "\\newcommand{\\C}{\\mathds{C}}",
         "\\newcommand{\\set}[1]{\\left\\{#1\\right\\}}",
         "\\newcommand{\\abs}[1]{\\left|#1\\right|}",
         "\\renewcommand{\\lor}{\\text{ or }}",
         "\\renewcommand{\\land}{\\text{ and }}",
         "\\newcommand{\\qmat}[4]{\\begin{bmatrix} #1 & #2 \\\\ #3 & #4 \\end{bmatrix}}",
         "\\newcommand{\\vect}[1]{\\begin{bmatrix} #1 \\end{bmatrix}}",
         "\\newcommand{\\inprod}[1]{\\left\\langle#1\\right\\rangle}",
         "\\DeclareMathOperator{\\rank}{rank}",
         "\\DeclareMathOperator{\\nullity}{nullity}",
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
   s({ trig = "i", name = "Insert new item" }, { t("\\item ") }),
   s({ trig = "p", name = "Insert new item page" }, { t({ "\\clearpage", "\\item " }) }),
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
      trig = "([%a%d])bf",
      regTrig = true,
      wordTrig = false,
      name = "Math boldface"
   }, {
      f(function(_, snip) return "\\mathbf{" .. snip.captures[1] .. "}" end, {}),
      i(0),
   }, { condition = in_mathzone }),
   s({
      trig = "([%a%d])hat",
      regTrig = true,
      wordTrig = false,
      name = "Hat"
   }, {
      f(function(_, snip) return "\\hat{" .. snip.captures[1] .. "}" end, {}),
      i(0),
   }, { condition = in_mathzone }),
   s({
      trig = "([%a%d])til",
      regTrig = true,
      wordTrig = false,
      name = "Tilde"
   }, {
      f(function(_, snip) return "\\tilde{" .. snip.captures[1] .. "}" end, {}),
      i(0),
   }, { condition = in_mathzone }),
   s({ trig = "__", wordTrig = false, name = "Subscript" }, {
      t("_{"), i(1), t("}"), i(0)
   }, { condition = in_mathzone }),
   s({ trig = "^^", wordTrig = false, name = "Superscript" }, {
      t("^{"), i(1), t("}"), i(0)
   }, { condition = in_mathzone }),
   s({ trig = "inv", wordTrig = false, name = "Inverse" }, {
      t("^{-1}")
   }, { condition = in_mathzone }),
   s({ trig = "//", name = "Fraction" }, {
      t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)
   }, { condition = in_mathzone }),
}
