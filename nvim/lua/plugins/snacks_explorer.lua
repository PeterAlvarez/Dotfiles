return {
  {
    "folke/snacks.nvim",
    -- enabled = false,
    opts = {
      lazygit = {
        enabled = true,
      },
      indent = {
        priority = 1,
        enabled = true, -- enable indent guides
        highlight = "SnacksIndent",
        only_scope = false, -- only show indent guides of the scope
        only_current = false, -- only show indent guides in the current window
        hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
        animate = {
          enabled = vim.fn.has("nvim-0.10") == 1,
          char = "┃",
          style = "out",
          easing = "linear",
          duration = {
            step = 20, -- ms per step
            total = 500, -- maximum duration
          },
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          priority = 200,
          char = "┃",
          underline = false, -- underline the start of the scope
          only_current = false, -- only show scope in the current window
          hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
        },

        chunk = {
          -- when enabled, scopes will be rendered as chunks, except for the
          -- top-level scope which will be rendered as a scope.
          enabled = false,
          -- only show chunk scopes in the current window
          only_current = false,
          priority = 200,
          hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
          char = {
            corner_top = "┌",
            corner_bottom = "└",
            -- corner_top = "╭",
            -- corner_bottom = "╰",
            horizontal = "─",
            vertical = "┃",
            arrow = ">",
          },
        },
      },

      dashboard = {
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[
████████╗██╗   ██╗██╗  ██╗
╚══██╔══╝██║   ██║╚██╗██╔╝
   ██║   ██║   ██║ ╚███╔╝
   ██║   ██║   ██║ ██╔██╗
   ██║   ╚██████╔╝██╔╝ ██╗
   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
    ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "o", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "m", desc = "myCode", action = ":e ~/myCode/" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 3, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 3, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 3, padding = 1 },
          { section = "startup" },
        },
      },

      picker = {
        sources = {
          explorer = {
            finder = "explorer",
            sort = { fields = { "sort" } },
            supports_live = true,
            tree = true,
            watch = true,
            diagnostics = true,
            diagnostics_open = false,
            git_status = true,
            git_status_open = false,
            git_untracked = true,
            follow_file = true,
            focus = "list",
            auto_close = false,
            jump = { close = false },
            layout = {
              preset = "sidebar",
              preview = false,
              layout = {
                position = "right",
                width = 35,
              }, -- <== Aquí se define la posición derecha
              -- width = 15,
            },
            formatters = {
              file = { filename_only = true },
              severity = { pos = "right" },
            },
            matcher = { sort_empty = false, fuzzy = false },
            config = function(opts)
              return require("snacks.picker.source.explorer").setup(opts)
            end,
            win = {
              list = {
                keys = {
                  ["<BS>"] = "explorer_up",
                  ["l"] = "confirm",
                  ["h"] = "explorer_close",
                  ["a"] = "explorer_add",
                  ["d"] = "explorer_del",
                  ["r"] = "explorer_rename",
                  ["c"] = "explorer_copy",
                  ["m"] = "explorer_move",
                  ["o"] = "explorer_open",
                  ["P"] = "toggle_preview",
                  ["y"] = { "explorer_yank", mode = { "n", "x" } },
                  ["p"] = "explorer_paste",
                  ["u"] = "explorer_update",
                  ["<c-c>"] = "tcd",
                  ["<leader>/"] = "picker_grep",
                  ["<c-t>"] = "terminal",
                  ["."] = "explorer_focus",
                  ["I"] = "toggle_ignored",
                  ["H"] = "toggle_hidden",
                  ["Z"] = "explorer_close_all",
                  ["]g"] = "explorer_git_next",
                  ["[g"] = "explorer_git_prev",
                  ["]d"] = "explorer_diagnostic_next",
                  ["[d"] = "explorer_diagnostic_prev",
                  ["]w"] = "explorer_warn_next",
                  ["[w"] = "explorer_warn_prev",
                  ["]e"] = "explorer_error_next",
                  ["[e"] = "explorer_error_prev",
                },
              },
            },
          },
        },
      },
    },
  },
  -- ... (Tu configuración existente)

  -- Plugins para diagnosticos y gestión de archivos
  -- {
  --   -- Plugin para íconos, necesario para que trouble.nvim se vea bien.
  --   "nvim-tree/nvim-web-devicons",
  -- },

  {
    -- El plugin trouble.nvim
    {
      "folke/trouble.nvim",
      enabled = true,
      opts = {
        modes = {
          lsp_document = {
            mode = "diagnostics",
            focus = "document",
            params = {
              severity = nil,
            },
          },
          lsp_workspace = {
            mode = "diagnostics",
            focus = "workspace",
            params = {
              severity = nil,
            },
          },
        },
      },
      config = function(_, opts)
        require("trouble").setup(opts)
        vim.keymap.set("n", "<leader>td", ":TroubleToggle<cr>", { desc = "Toggle Trouble Diagnostics" })
      end,
    },
  },
}
