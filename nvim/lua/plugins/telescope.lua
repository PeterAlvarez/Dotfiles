return {

  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "benfowler/telescope-luasnip.nvim" },
    { "rcarriga/nvim-notify" },
    { "ThePrimeagen/harpoon" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = telescope.extensions.file_browser.actions

    telescope.setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "bottom", -- Prompt arriba
          preview_cutoff = 0, -- Siempre muestra preview
          preview_height = 0.6, -- Preview abajo
          height = 0.95,
          width = 0.65,
          mirror = true,
        },
        sorting_strategy = "ascending",
        prompt_prefix = " 🔍  ",
        selection_caret = "  ",
        winblend = 0,
        mappings = {
          n = {
            ["<C-c>"] = actions.close,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-f>"] = actions.preview_scrolling_down,
          },
          i = {
            ["<C-c>"] = actions.close,
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-f>"] = actions.preview_scrolling_down,
          },
        },
        preview = {
          hide_on_startup = false,
          treesitter = true,
        },
      },

      pickers = {

        -- live_grep = {
        --   path_display = function(_, path)
        --     local filename = path:match("^.+/(.+)$")
        --     return filename or path
        --   end,
        -- },
        --

        diagnostics = {
          initial_mode = "normal",
        },
      },

      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            n = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = fb_actions.goto_home_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
            },
          },
        },
      },
    })

    -- Cargar extensiones
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension("luasnip")
    telescope.load_extension("notify")
    -- Atajos
    local builtin = require("telescope.builtin")
    local extensions = telescope.extensions
    local map = vim.keymap.set

    map("n", ";e", function()
      builtin.find_files({ hidden = true })
    end, { desc = "Find files in project" })

    -- map("n", ";D", function()
    --   builtin.diagnostics({ initial_mode = "insert" })
    -- end, { desc = "Diagnostics Buffer" })

    map("n", ";h", builtin.help_tags, { desc = "Help Documentation" })

    map("n", ";o", builtin.oldfiles, { desc = "Open oldfiles" })

    map("n", ";s", function()
      extensions.luasnip.luasnip()
    end, { desc = "Snippets" })

    -- map("n", ";R", function()
    --   builtin.lsp_references()
    -- end, { desc = "Lsp references" })

    map("n", ";gf", function()
      builtin.git_files()
    end, { desc = "Git files list" })
    --
    map("n", ";.", function()
      builtin.live_grep()
    end, { desc = "Word search in project" })

    -- #############################################################

    map("n", ";u", function()
      Snacks.picker.undo()
    end, { desc = "Undo" })

    map("n", ";;", function()
      Snacks.picker.resume()
    end, { desc = "Resume" })

    map("n", ";L", function()
      Snacks.picker.lazy()
    end, { desc = "Info pluggins lazy" })

    map("n", ";q", function()
      Snacks.picker.jumps()
    end, { desc = "Search position previus" })

    map("n", ";i", function()
      Snacks.picker.icons({ current = false, layout = { preset = "select" } })
    end, { desc = "Search icons" })

    map("n", ";w", function()
      Snacks.picker.lines()
    end, { desc = "Word search in the file" })

    map("n", ";p", function()
      Snacks.picker.projects()
    end, { desc = "List projects" })

    map("n", ";b", function()
      ---@diagnostic disable-next-line: missing-fields
      Snacks.picker.buffers({ current = false, layout = { preset = "select" } })
    end, { desc = "Buffers" })

    map("n", ";n", function()
      Snacks.picker.notifications()
    end, { desc = "Notifications" })

    map("n", ";c", function()
      Snacks.picker.highlights()
    end, { desc = "Colors" })

    map("n", ";/", function()
      Snacks.picker.search_history({ current = false, layout = { preset = "select" } })
    end, { desc = "search history" })

    map("n", ";:", function()
      Snacks.picker.command_history({ current = false, layout = { preset = "select" } })
    end, { desc = "Command history" })

    map("n", ";W", function()
      Snacks.picker.grep_buffers()
    end, { desc = "Word search in the buffers" })

    map("n", ";k", function()
      Snacks.picker.keymaps()
    end, { desc = "Keymaps" })

    ------------------------ mark keymaps ------------------------
    map("n", ";m", function()
      Snacks.picker.marks()
    end, { desc = "Search marks" })

    map("n", ";MM", function() end, { desc = "Search marks" })

    ------------------------ picker git telescope ------------------------
    map("n", ";*", function()
      Snacks.picker.grep_word()
    end, { desc = "Word search *" })

    map("n", ";v", function()
      Snacks.picker.registers()
    end, { desc = "List Registers" })

    map("v", ";v", function()
      Snacks.picker.registers()
    end, { desc = "List Registers" })

    map("n", ";gs", function()
      Snacks.picker.git_status()
    end, { desc = "Git status" })

    map("n", ";gb", function()
      Snacks.picker.git_branches()
    end, { desc = "Git branch" })

    map("n", ";gl", function()
      Snacks.picker.git_log()
    end, { desc = "Git log" })

    map("n", ";gd", function()
      Snacks.picker.git_diff()
    end, { desc = "Git diff" })

    ------------------------ Lsp  ------------------------
    vim.keymap.set("n", ";lc", function()
      vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end, { desc = "Diagnostic error line" })

    vim.keymap.set("n", ";ld", ":Trouble diagnostics toggle<CR>", {
      desc = "Diagnostic error project",
    })

    map("n", ";lD", function()
      Snacks.picker.diagnostics_buffer()
    end, { desc = "Diagnostics file" })

    map("n", ";lR", function()
      Snacks.picker.lsp_references()
    end, { desc = "Lsp references in project" })

    vim.keymap.set("n", ";lr", ":Trouble lsp_references toggle<CR>", {
      desc = "Lsp references in project",
    })

    map("n", ";lI", function()
      Snacks.picker.lsp_definitions()
    end, { desc = "Lsp implementation" })

    vim.keymap.set("n", ";li", ":Trouble lsp_implementations toggle<CR>", {
      desc = "Lsp references in project",
    })

    vim.keymap.set("n", ";ls", function()
      vim.lsp.buf.code_action()
    end, { desc = "Code action solutions" })

    vim.keymap.set("n", ";lw", function()
      vim.lsp.buf.rename()
    end, { desc = "Lsp rename" })

    map("n", ";lp", function()
      Snacks.picker.lsp_symbols()
    end, { desc = "List symbols in the file" })

    -- map("n", ";lR", function()
    --   Snacks.picker.lsp_declarations()
    -- end, { desc = "Lsp declarations" })

    vim.keymap.set("n", "L", function()
      vim.lsp.buf.hover()
    end, { desc = "vim.lsp.buf.hover()" })

    ------------------------ Zen mode ------------------------
    map("n", "<leader>z", function()
      Snacks.zen()
    end, { desc = "Modo Zen" })
  end,
}
