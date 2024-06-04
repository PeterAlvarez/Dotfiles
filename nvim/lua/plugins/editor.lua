local Util = require("lazyvim.util")

return {
    {
        "HiPhish/nvim-ts-rainbow2",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-treesitter.configs").setup({
                rainbow = {
                    enable = true,
                    -- list of languages you want to disable the plugin for
                    disable = { "jsx", "html" },
                    -- Which query to use for finding delimiters
                    query = "rainbow-parens",
                    -- Highlight the entire buffer all at once
                    strategy = require("ts-rainbow").strategy.global,
                },
            })
        end,
    },
    {
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup({
                -- local hop = require('hop');
                vim.api.nvim_set_keymap("n", "f", ":HopChar2<cr>", { silent = true }),
                vim.api.nvim_set_keymap("n", "F", ":HopWord<cr>", { silent = true }),
            })
        end,
    },
    {
        enabled = false,
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        opts = {},
    },

    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        opts = {
            highlighters = {
                hsl_color = {
                    pattern = "hsl%(%d+,? %d+,? %d+%)",
                    group = function(_, match)
                        local utils = require("solarized-osaka.hsl")
                        local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
                        h, s, l = tonumber(h), tonumber(s), tonumber(l)
                        local hex_color = utils.hslToHex(h, s, l)
                        return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
                    end,
                },
            },
        },
    },

    {
        "dinhhuy258/git.nvim",
        event = "BufReadPre",
        opts = {
            keymaps = {
                -- Open blame window
                blame = "<Leader>gb",
                -- Open file/folder in git repository
                browse = "<Leader>go",
            },
        },
    },

    {
        "telescope.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        keys = {
            {
                ";k",
                function()
                    require("telescope.builtin").keymaps({ no_ignore = false, hidden = true })
                end,
                desc = "key maps",
            },
            {
                ";f",
                function()
                    require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
                end,
                desc = "find files",
            },
            {
                ";g",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Live Grep in proyect",
            },
            {
                ";w",
                function()
                    require("telescope.builtin").live_grep({ search_dirs = { "%:p" } })
                end,
                desc = "live Grep in file",
            },
            {
                ";W",
                function()
                    require("telescope.builtin").live_grep({ grep_open_files = true })
                end,
                desc = "live Grep in buffers",
            },
            {
                ";t",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = "Help tags",
            },
            {
                ";;",
                function()
                    require("telescope.builtin").resume()
                end,
                desc = "Resume",
            },
            {
                ";d",
                function()
                    require("telescope.builtin").diagnostics({
                        initial_mode = "normal",
                    })
                end,
                desc = "Lists Diagnostics for all open buffers or a specific buffer",
            },
            {
                ";e",
                function()
                    require("telescope.builtin").buffers({ initial_mode = "normal" })
                end,
                desc = "List open buffers",
            },
            {
                ";s",
                function()
                    local function telescope_buffer_dir()
                        return vim.fn.expand("%:p:h")
                    end
                    require("telescope").extensions.file_browser.file_browser({
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        initial_mode = "normal",
                        layout_config = { height = 10 },
                    })
                end,
                desc = "open File Browser with the path of the current buffer",
            },
            {
                ";r",
                function()
                    require("telescope.builtin").lsp_references()
                end,
                desc = "LSP References",
            },
            {
                ";o",
                function()
                    require("telescope.builtin").oldfiles()
                end,
                desc = "Previously open files",
            },
            {
                ";/",
                function()
                    require("telescope.builtin").search_history()
                end,
                desc = "Lists searches",
            },
            {
                ";:",
                function()
                    require("telescope.builtin").command_history()
                end,
                desc = "Lists commands execute",
            },
            {
                ";c",
                function()
                    require("telescope.builtin").highlights()
                end,
                desc = "Color highlights",
            },
            {
                ";v",
                function()
                    require("telescope.builtin").git_status()
                end,
                desc = "Lists diff preview",
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local fb_actions = require("telescope").extensions.file_browser.actions

            opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
                wrap_results = true,
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
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
                sorting_strategy = "ascending",
                prompt_prefix = " 🔍  ",
                winblend = 0,
                mappings = {
                    n = {
                        ["q"] = actions.close,
                    },
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            })
            opts.pickers = {
                diagnostics = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = {
                        preview_cutoff = 9999,
                    },
                },
            }
            opts.extensions = {
                file_browser = {
                    theme = "dropdown",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        -- your custom insert mode mappings
                        ["n"] = {
                            -- your custom normal mode mappings
                            ["N"] = fb_actions.create,
                            ["h"] = fb_actions.goto_parent_dir,
                            ["l"] = fb_actions.goto_home_dir,
                            ["/"] = function()
                                vim.cmd("startinsert")
                            end,
                            ["<C-u>"] = function(prompt_bufnr)
                                for i = 1, 10 do
                                    actions.move_selection_previous(prompt_bufnr)
                                end
                            end,
                            ["<C-d>"] = function(prompt_bufnr)
                                for i = 1, 10 do
                                    actions.move_selection_next(prompt_bufnr)
                                end
                            end,
                            ["<PageUp>"] = actions.preview_scrolling_up,
                            ["<PageDown>"] = actions.preview_scrolling_down,
                        },
                    },
                },
            }
            telescope.setup(opts)
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
        end,
    },

    --which-key

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
                align = "center", -- align columns left, center or right
            },
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true, -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            icons = {
                breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
                separator = " ", -- symbol used between a key and it's label
                group = " ", -- symbol prepended to a group
            },
            defaults = {
                mode = { "n" },
                [";"] = { name = "Telescope" },
                ["<leader>"] = {
                    name = "leader",
                    ["p"] = {
                        name = "my shorcuts",
                        f = {
                            '<cmd>lua ColorMyPencils()<CR>:echo "color function executed!!"<CR>',
                            "Color My Pencils",
                        },
                        e = { "<cmd>b#<CR>zz", "Buff prev" },
                        w = { '<cmd>wa<CR>:echo "Save!!"<CR>', "Save" },
                        -- h = { "<cmd>lua vim.lsp.buf.format({async=true})<CR>:echo 'Formatted!!'<CR>", "Formatted Code" },
                        -- f = { "<cmd>Prettier<CR>:echo 'Formatted Prettier!!'<CR>", "Prettier Format Code" },
                        c = { "<cmd>bp|sp|bn|bd<CR>", "Close buff" },
                        -- s = { '<cmd>so<CR>:echo "Compiled nvim!!"<CR>', "Compile Packer" },
                        t = { "<cmd>terminal<CR>", "Open terminal" },
                        p = {
                            "<cmd>let @+ = expand('%:p')<CR>:echo 'Copied Path!!'<CR>",
                            "Copy path file",
                        },
                        -- l = { ":lua ToggleColorColumn()<CR>", "Line columns" },
                        x = { ":tabclose<CR>", "Tab Close" },
                        q = { ":q<CR>", "Tab Close" },
                        -- ["="] = { "maggVG='a:echo 'Formating code!!!'<CR>", "Formating whit =" },
                    },
                },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register(opts.defaults)
        end,
    },

    -- git config
    {
        "lewis6991/gitsigns.nvim",
        event = "LazyFile",
        opts = {
            signs = {
                add = { text = "" },
                change = { text = "" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "" },
                untracked = { text = "" },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

        -- stylua: ignore start
        map("n", "<leader>ghl", gs.next_hunk, "Next Hunk")
        map("n", "<leader>ghh", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        },
    },

    --funtion view
    {
        "stevearc/aerial.nvim",
        opts = {},
        -- Optional dependencies
        keys = {
            -- { "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
            { "<leader>ci", "<cmd>AerialNavToggle<cr>", desc = "Aerial floating" },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
    --symbols-outline view functions
    {
        "simrat39/symbols-outline.nvim",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        cmd = "SymbolsOutline",
        opts = function()
            local Config = require("lazyvim.config")
            local defaults = require("symbols-outline.config").defaults
            local opts = {
                symbols = {},
                symbol_blacklist = {},
            }
            local filter = Config.kind_filter

            if type(filter) == "table" then
                filter = filter.default
                if type(filter) == "table" then
                    for kind, symbol in pairs(defaults.symbols) do
                        opts.symbols[kind] = {
                            icon = Config.icons.kinds[kind] or symbol.icon,
                            hl = symbol.hl,
                        }
                        if not vim.tbl_contains(filter, kind) then
                            table.insert(opts.symbol_blacklist, kind)
                        end
                    end
                end
            end
            return opts
        end,
    },

    --file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
                end,
                desc = "Explorer NeoTree (root dir)",
            },
            {
                "<leader>fE",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
                end,
                desc = "Explorer NeoTree (cwd)",
            },
            { "<leader>nn", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
            { "<leader>nr", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },

            {
                "<leader>nc",
                "<cmd>Neotree close<CR>",
                desc = "NeoTree close",
            },

            {
                "<leader>ng",
                function()
                    require("neo-tree.command").execute({ source = "git_status", toggle = true })
                end,
                desc = "Git explorer",
            },
            {
                "<leader>nb",
                function()
                    require("neo-tree.command").execute({ source = "buffers", toggle = true })
                end,
                desc = "Buffer explorer",
            },
        },
        deactivate = function()
            vim.cmd([[Neotree close]])
        end,
        init = function()
            if vim.fn.argc(-1) == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        opts = {
            popup_border_style = "rounded",
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {

                mappings = {
                    ["<space>"] = "none",
                    ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["<esc>"] = "revert_preview",
                    ["P"] = { "toggle_preview", config = { use_float = true } },
                    ["L"] = "focus_preview",
                    -- ["S"] = "open_split",
                    ["s"] = { "open_vsplit", nowait = false },
                    -- ["S"] = "split_with_window_picker",
                    -- ["s"] = "vsplit_with_window_picker",
                    -- ["t"] = "open_tabnew",
                    ["l"] = "open_drop",
                    ["t"] = "open_tab_drop",
                    --["w"] = "open_with_window_picker",
                    --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                    ["h"] = "close_node",
                    ["z"] = "close_all_nodes",
                    ["Z"] = "expand_all_nodes",
                    ["a"] = {
                        "add",
                        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none", -- "none", "relative", "absolute"
                        },
                    },

                    ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                    -- ["C"] = {
                    --   "copy",
                    --   config = {
                    --     show_path = "none", -- "none", "relative", "absolute"
                    --   },
                    -- },
                    ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                },
            },

            git_status = {
                window = {
                    position = "float",
                    mappings = {
                        ["gA"] = "git_add_all",
                        ["gu"] = "git_unstage_file",
                        ["ga"] = "git_add_file",
                        ["gr"] = "git_revert_file",
                        ["gc"] = "git_commit",
                        ["gp"] = "git_push",
                        ["gg"] = "git_commit_and_push",
                    },
                },
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
                        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                        deleted = "✖", -- this can only be used in the git_status source
                        renamed = "󰑕", -- this can only be used in the git_status source
                        -- Status type
                        untracked = "",
                        ignored = "",
                        unstaged = "",
                        staged = "",
                        conflict = "",
                    },
                },
                icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰉖",
                    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                    -- then these will never be used.
                    default = "*",
                    highlight = "NeoTreeFileIcon",
                },

                indent = {
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
            },
        },
        config = function(_, opts)
            local function on_move(data)
                Util.lsp.on_rename(data.source, data.destination)
            end

            local events = require("neo-tree.events")
            opts.event_handlers = opts.event_handlers or {}
            vim.list_extend(opts.event_handlers, {
                { event = events.FILE_MOVED, handler = on_move },
                { event = events.FILE_RENAMED, handler = on_move },
            })
            require("neo-tree").setup(opts)
            vim.api.nvim_create_autocmd("TermClose", {
                pattern = "*lazygit",
                callback = function()
                    if package.loaded["neo-tree.sources.git_status"] then
                        require("neo-tree.sources.git_status").refresh()
                    end
                end,
            })
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            {
                "<leader>cp",
                ft = "markdown",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
            },
        },
        config = function()
            vim.cmd([[do FileType]])
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        opts = function()
            local opts = {}
            for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
                opts[ft] = {
                    headline_highlights = {},
                }
                for i = 1, 6 do
                    local hl = "Headline" .. i
                    vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
                    table.insert(opts[ft].headline_highlights, hl)
                end
            end
            return opts
        end,
        ft = { "markdown", "norg", "rmd", "org" },
        config = function(_, opts)
            -- PERF: schedule to prevent headlines slowing down opening a file
            vim.schedule(function()
                require("headlines").setup(opts)
                require("headlines").refresh()
            end)
        end,
    },
}
