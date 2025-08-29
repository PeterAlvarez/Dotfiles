return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {

      { "K", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "J", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        -- Habilitar la transparencia
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
        -- Puedes usar 'transparent' aquí, si el tema lo soporta.
        -- O, más comúnmente, modificar los colores de fondo.
      },
      highlights = {
        -- La clave es sobrescribir los grupos de resaltado existentes.
        -- BufferLineFill = {
        --   bg = "None",
        -- },
        buffer_selected = {
          bg = "NONE",
          fg = "#d79921", -- Color de texto para la pestaña activa
          bold = true,
        },
      },
    },
    -- Mapea la función ToggleBufferline a un atajo (ej. <leader>b)
    vim.api.nvim_set_keymap("n", "<leader>r", ":lua ToggleBufferline()<CR>", { noremap = true, silent = true }),
    -- opts = {
    --   options = {
    --     mode = "tabs",
    --     -- separator_style = "slant",
    --     show_buffer_close_icons = false,
    --     show_close_icon = false,
    --   },
    -- },
  },

  --lualine
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = {
            normal = {
              a = { fg = "#000000", bg = "#b58900", gui = "bold" },
              b = { fg = "#859900", bg = "#000000" },
              c = { fg = "#268BD2", bg = "#000000" },
            },
            insert = {
              a = { fg = "#000000", bg = "#268bd2", gui = "bold" },
              b = { fg = "#859900", bg = "#000000" },
              c = { fg = "#000000", bg = "#268bd2", gui = "bold" },
            },
            visual = {
              a = { fg = "#002b36", bg = "#d33682", gui = "bold" },
              b = { fg = "#586e75", bg = "#93a1a1" },
              c = { fg = "#586e75", bg = "NONE" },
            },
            replace = {
              a = { fg = "#002b36", bg = "#dc322f", gui = "bold" },
              b = { fg = "#586e75", bg = "#93a1a1" },
              c = { fg = "#586e75", bg = "NONE" },
            },
            command = {
              a = { fg = "#002b36", bg = "#b58900", gui = "bold" },
              b = { fg = "#586e75", bg = "#93a1a1" },
              c = { fg = "#586e75", bg = "NONE" },
            },
            inactive = {
              a = { fg = "#586e75", bg = "NONE", gui = "bold" },
              b = { fg = "#586e75", bg = "NONE" },
              c = { fg = "#586e75", bg = "NONE" },
            },
          },
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = {
            { "mode" },

            {
              function()
                local dir = vim.fn.expand("%:p:h") -- directorio completo del archivo actual
                local folder_name = vim.fn.fnamemodify(dir, ":t") -- solo el nombre de la carpeta
                local icon = " " -- icono de carpeta
                return icon .. folder_name
              end,
            },
          },
          lualine_b = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },

            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filename" },
            { "filetype" },
          },

          lualine_c = {},
          lualine_x = {
            {
              function()
                return " "
              end,
            },
            {
              function()
                return os.date("%H:%M")
              end,
              icon = "",

              separator = { left = " ", right = " " },
            },
            {
              function()
                return "%="
              end,
            },
          },

          lualine_y = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Statement") }
              end,
            },

            { "lsp_status" },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return { fg = Snacks.util.color("Debug") } end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return { fg = Snacks.util.color("Special") } end,
            },
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },

            LazyVim.lualine.root_dir(),
          },
          lualine_z = {
            { "branch" },

            {
              function()
                -- Buscar el .git más cercano hacia arriba desde el buffer actual
                local git_root =
                  vim.fs.find(".git", { upward = true, stop = vim.loop.os_homedir(), path = vim.fn.expand("%:p:h") })[1]

                if not git_root then
                  return "No repo"
                end

                -- Subir un nivel porque .git es una carpeta
                local repo_path = vim.fn.fnamemodify(git_root, ":h")

                -- Devolver solo el nombre del repo
                return vim.fn.fnamemodify(repo_path, ":t")
              end,
              icon = "",
            },
          },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
      }

      return opts
    end,
  },
}
