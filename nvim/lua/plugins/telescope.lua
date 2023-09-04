return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-lua/popup.nvim" },
        --{ "nvim-telescope/telescope-fzy-native.nvim" },
        --{ "kyazdani42/nvim-web-devicons" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        --{ "nvim-telescope/telescope-ui-select.nvim" },
    },
    event = "VeryLazy",
    config = function()
        local actions = require "telescope.actions"
        local fb_actions = require "telescope".extensions.file_browser.actions
        require('telescope').setup {
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close
                    },
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                layout_config = {
                    horizontal = {
                        -- prompt_position = "top",
                        preview_width = 0.50,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.85,
                    height = 0.85,
                    preview_cutoff = 120,
                },
                file_ignore_patterns = { "node_modules", "env/*" },
                selection_caret = " ",
                prompt_prefix = " 🔍  ",
                find_files = {
                    theme = "anything",
                    previewer = true
                },
                extensions = {
                    file_browser = {
                        theme = "dropdown",
                        mappings = {
                            -- your custom insert mode mappings
                            ["i"] = {
                                ["<C-w>"] = function() vim.cmd('normal vbd') end,
                            },
                            ["n"] = {
                                -- your custom normal mode mappings
                                ["N"] = fb_actions.create,
                                ["h"] = fb_actions.goto_parent_dir,
                                ["/"] = function()
                                    vim.cmd('startinsert')
                                end
                            },
                        },
                    }
                }
            },
        }
    end,
}
