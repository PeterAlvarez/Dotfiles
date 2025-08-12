local jdtls = require("jdtls")

-- Detectamos automáticamente la raíz del proyecto
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- Si no se encuentra una raíz válida, no hacemos nada
if not root_dir then
  return
end

-- Ruta donde jdtls guardará datos del workspace
local home = os.getenv("HOME")
local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Comando para iniciar jdtls
local config = {
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/jdtls",
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  settings = {
    java = {},
  },
  init_options = {
    bundles = {},
  },
}

-- Iniciar o adjuntar LSP
jdtls.start_or_attach(config)
