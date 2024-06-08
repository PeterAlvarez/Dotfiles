local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Snippets para todos los lenguajes con descripciones
ls.add_snippets("all", {
    s({
        trig = "sec",
        name = "Division for section",
        dscr = "Esto sirve para dividir secciones de codigo (aprendisaje) ",
    }, {
        t("===================== "),
        i(1, "Nombre seccion"),
        t(" ====================="),
    }),
    s({ trig = "hm", name = "Greeting Snippet", dscr = "Snippet para saludar" }, {
        t("Hola, "),
        i(1, "mundo"),
        t("!"),
    }),
})

-- Snippets para JavaScript con descripciones
ls.add_snippets("javascript", {
    s({ trig = "log", name = "Log Snippet", dscr = "Snippet para console.log" }, {
        t("console.log("),
        i(1, "mensaje"),
        t(");"),
    }),
})

-- Snippets para Python con descripciones
ls.add_snippets("python", {
    s({ trig = "def", name = "Function Definition", dscr = "Snippet para definir una función" }, {
        t("def "),
        i(1, "nombre_funcion"),
        t("("),
        i(2, "args"),
        t("):"),
        t({ "", "    " }),
        i(3, "pass"),
    }),
})
