local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("ff", t("\\frac{}{}")),
  s("sum", t("\\sum_{i=1}^{N}")),
  s("int", t("\\int_{a}^{b}")),
  s("beta", t("\\beta")),
  s("ham", t("\\mathcal{H}")),
  s("Z", t("\\mathcal{Z}")),
  s("avg", t("\\langle  \\rangle")),
}
