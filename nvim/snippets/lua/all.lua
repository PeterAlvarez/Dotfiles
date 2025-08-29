local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Esto hace que los snippets de filetype "global" se vean como disponibles para muchos filetypes
ls.filetype_extend("all", { "html", "javascript", "python", "lua", "java", "typescriptlsl" })

return {
  s({ trig = "hm", name = "Saludo global", dscr = "Snippet global" }, {
    t("Hola, "),
    i(1, "mundo"),
    t("!"),
  }),

  s({ trig = "se", name = "seccion", dsrc = "separation code" }, {
    t({ "===========================================", "" }),
    i(1, "seccion"),
    t({ "", "===========================================" }),
  }),

  s({ trig = "sec", name = "seccion", dsrc = "separation code" }, {
    t({ "===========================================", "" }),
  }),

  s({ trig = "nott", name = "Note", dscr = "Information" }, {
    t("TODO: "),
    i(1, "Escribe Nota"),
  }),

  s({ trig = "not", name = "Note", dscr = "Note" }, {
    t("NOTE: "),
    i(1, "Escribe Nota"),
  }),

  s({ trig = "nor", name = "Nota global", dscr = "Repair" }, {
    t("FIXME: "),
    i(1, "Escribe reparando"),
  }),

  s({ trig = "noh", name = "Hack", dscr = "Warning" }, {
    t("HACK: "),
    i(1, "Escribe Hack"),
  }),

  s({ trig = "nob", name = "Bug", dscr = "Error" }, {
    t("BUG: "),
    i(1, "Escribe Bug"),
  }),

  s({ trig = "now", name = "Warng", dscr = "Warning" }, {
    t("WARN: "),
    i(1, "Escribe Warn"),
  }),
}
