return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- Íconos personalizados para signos de diagnóstico
      local signs = {
        Error = "", -- ← Cambia este a lo que desees (puede ser un ícono o letra)
        Warn = "▲",
        Hint = "⚑",
        Info = "",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Filtrar mensajes específicos
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      -- Configuración del comando :Noice
      opts.commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      -- Borde para popups LSP
      opts.presets.lsp_doc_border = true

      -- Mostrar diagnóstico flotante al dejar el cursor quieto
      -- vim.api.nvim_create_autocmd("CursorHold", {
      --   callback = function()
      --     vim.diagnostic.open_float(nil, {
      --       focusable = false,
      --       border = "rounded",
      --       source = "always",
      --     })
      --   end,
      -- })

      -- Configuración global del sistema de diagnósticos
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      -- Compatibilidad con markdown de noice
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
    end,
  },

  {
    "rcarriga/nvim-notify",
    enable = false,
    opts = {
      timeout = 5000,
      top_down = false, -- Las notificaciones aparecerán desde la parte inferior
      stages = "slide", -- Ajuste de la animación para evitar superposiciones
    },
  },
}
