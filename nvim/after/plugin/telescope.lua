local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')


local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
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
        -- file_ignore_patterns = { ".git/*", "node_modules", "env/*" },
        file_ignore_patterns = { "node_modules", "env/*" },
        selection_caret = " ",
        prompt_prefix = " 🔍  ",
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        },
    },
    find_files = {
        theme = "anything",
        previewer = true
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            -- hijack_netrw = true,
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
        },
    },
}

telescope.load_extension("file_browser")

-- which-key
-- vim.keymap.set('n', ';f', function()
--     builtin.find_files({
--         no_ignore = false,
--         hidden = true
--     })
-- end)

-- which-key
--live_grep config
-- vim.keymap.set('n', ';r', function() builtin.live_grep() end)
-- vim.keymap.set('n', ';w', function() builtin.live_grep { search_dirs = { "%:p" } } end)
-- vim.keymap.set('n', ';W', function() builtin.live_grep { grep_open_files = true } end)
--
-- lua require('telescope.builtin').live_grep({grep_open_files=true})

-- lua require'telescope.builtin'.live_grep{ search_dirs={"%:p"} }

-- which-key
-- vim.keymap.set('n', '<C-e>', function() builtin.buffers({ initial_mode = "normal" }) end)
-- vim.keymap.set('n', ';t', function() builtin.help_tags() end)
-- vim.keymap.set('n', ';;', function() builtin.resume() end)
-- vim.keymap.set('n', ';e', function() builtin.diagnostics() end)
--
-- vim.keymap.set("n", "sf", function()
--     telescope.extensions.file_browser.file_browser({
--         path = "%:p:h",
--         cwd = telescope_buffer_dir(),
--         respect_gitignore = false,
--         hidden = true,
--         grouped = true,
--         initial_mode = "normal",
--     })
-- end)
