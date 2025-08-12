local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Decorador @Component
  s({ trig = "ngcomp", name = "@Component", dscr = "Decorador de componente Angular" }, {
    t({ "@Component({", "  selector: '" }),
    i(1, "app-ejemplo"),
    t({ "',", "  templateUrl: '" }),
    i(2, "./ejemplo.component.html"),
    t({ "',", "  styleUrls: ['" }),
    i(3, "./ejemplo.component.css"),
    t({ "']" }),
    t({ "", "})", "" }),
    t("export class "),
    i(4, "EjemploComponent"),
    t({ " {", "  " }),
    i(0),
    t({ "", "}" }),
  }),

  -- Decorador @Injectable
  s({ trig = "ngserv", name = "@Injectable", dscr = "Servicio Angular" }, {
    t({ "@Injectable({", "  providedIn: 'root'", "})", "" }),
    t("export class "),
    i(1, "MiServicio"),
    t({ " {", "  constructor() {", "    " }),
    i(0),
    t({ "", "  }", "}" }),
  }),

  -- Método ngOnInit
  s({ trig = "nginit", name = "ngOnInit", dscr = "Método de inicialización Angular" }, {
    t({ "ngOnInit(): void {", "  " }),
    i(0, "// lógica de inicialización"),
    t({ "", "}" }),
  }),

  -- Inyección en constructor
  s({ trig = "ngctor", name = "Constructor DI", dscr = "Inyección de dependencias en constructor" }, {
    t("constructor("),
    i(1, "private servicio: EjemploService"),
    t({ ") {", "  " }),
    i(0),
    t({ "", "}" }),
  }),
}
