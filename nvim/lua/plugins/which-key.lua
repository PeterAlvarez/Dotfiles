return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,

    config = function()
        local builtin = require("telescope.builtin")
        local function telescope_buffer_dir() return vim.fn.expand('%:p:h') end

        local wk = require("which-key")
        wk.setup {
            plugins = {
                marks = true,        -- shows a list of your marks on ' and `
                registers = true,    -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 20 -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true,      -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true,      -- default bindings on <c-w>
                    nav = true,          -- misc bindings to work with windows
                    z = true,            -- bindings for folds, spelling and others prefixed with z
                    g = true             -- bindings for prefixed with g
                }
            },

            operators = { gc = "Comments" },
            key_labels = {
                -- override the label used to display some keys. It doesn't effect WK in any other way.
                -- For example:
                -- ["<space>"] = "SPC",
                -- ["<cr>"] = "RET",
                -- ["<tab>"] = "TAB",
            },

            icons = {
                breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
                separator = " ", -- symbol used between a key and it's label
                group = " " -- symbol prepended to a group
            },

            popup_mappings = {
                scroll_down = '<c-d>', -- binding to scroll down inside the popup
                scroll_up = '<c-u>'    -- binding to scroll up inside the popup
            },

            window = {
                border = "single",        -- none, single, double, shadow
                position = "bottom",      -- bottom, top
                margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0
            },

            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3,                    -- spacing between columns
                align = "center"                -- align columns left, center or right
            },

            ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate

            show_help = true,                                                             -- show help message on the command line when the popup is visible
            show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
            triggers = "auto",                                                            -- automatically setup triggers

            triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } },

            disable = { buftypes = {}, filetypes = { "TelescopePrompt" } }

        }

        -- vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>')
        wk.register({
            ['<leader>'] = {
                name = "leader",
                ['p'] = {
                    name = 'my shorcuts',
                    e = { "<cmd>b#<CR>zz", 'Buff prev' },
                    w = { '<cmd>wa<CR>:echo "Save!!"<CR>', 'Save' },
                    h = { "<cmd>lua vim.lsp.buf.format({async=true})<CR>:echo 'Formatted!!'<CR>", 'Formatted Code' },
                    f = { "<cmd>Prettier<CR>:echo 'Formatted Prettier!!'<CR>", 'Prettier Format Code' },
                    c = { '<cmd>bp|sp|bn|bd<CR>', 'Close buff' },
                    s = { '<cmd>so<CR>:echo "Compiled nvim!!"<CR>', 'Compile Packer' },
                    t = { '<cmd>terminal<CR>', 'Open terminal' },
                    p = { "<cmd>let @+ = expand('%:p')<CR>:echo 'Copied Path!!'<CR>", 'Copy path file' },
                    l = { ':lua ToggleColorColumn()<CR>', 'Line columns' },
                    x = { ':tabclose<CR>', 'Tab Close' },
                    q = { ':q<CR>', 'Tab Close' },
                    ['='] = { "maggVG='a:echo 'Formating code!!!'<CR>", 'Formating whit =' },
                },

                ['f'] = {
                    name = 'Execute funtion',
                    c = { '<cmd>lua ColorMyPencils()<CR>:echo "color function executed!!"<CR>', 'Color My Pencils' },
                    t = { '<cmd>ColorizerToggle<CR>:echo "Colorizer Toggle"<CR>', 'Colorizer Toggle' },
                    r = { '<cmd>ColorizerReloadAllBuffers<CR>:echo "Colorizer Refresh"<CR>', 'Colorizer Refresh' },
                },

                ['g'] = {
                    name = "Git",
                    v = { '<cmd>Gitsigns preview_hunk<cr>', 'View hunk' },
                    p = { '<cmd>Gitsigns prev_hunk<CR>zz', 'Prev hunk' },
                    n = { '<cmd>Gitsigns next_hunk<CR>zz', 'Next hunk' },
                    o = { '<cmd>DiffviewOpen<CR>', 'Diff view Open' },
                    c = { '<cmd>DiffviewClose<CR>', 'Diff view Close' },
                    r = { '<cmd>Gitsigns reset_hunk<CR>', 'reset hunk' },
                    d = { '<cmd>DiffviewToggleFiles<CR>', 'Toggle Files' },
                    h = { '<cmd>DiffviewFileHistory<CR>', 'Commits History' },
                    R = { '<cmd>DiffviewRefresh<CR>', 'Refresh DiffView' },
                    a = { '<cmd>Git add .<CR>', 'executed git add' },
                    m = { '<cmd>Git commit<CR>', 'executed git commit' },
                    l = { '<cmd>tab Git log<CR>', 'executed git log' }
                },

                ['d'] = {
                    name = 'Data Base Client',
                    o = { ':tab DBUI<cr>', 'Client for DataBase' },
                    c = { 'vip<Plug>(DBUI_ExecuteQuery)', 'Compile code' },
                    r = { '<C-w>l<Plug>(DBUI_Redraw)<C-w>h', 'Refresh DataBase' },
                    w = { '<Plug>(DBUI_SaveQuery)', 'Save Query' },
                    d = { '<C-w>j<Cmd>close<Cr>', 'Close view compile' },
                },
                ['l'] = {
                    name = "Language Protocol Service",
                    l = { "<Cmd>:Lspsaga finder tyd+ref+imp+def<CR>:echo 'Finder complete'<CR>", 'Finder' },
                    j = { "<Cmd>Lspsaga diagnostic_jump_next<CR>:echo 'Diagnostics next'<CR>", 'Diagnostics' },
                    h = { "<cmd>Lspsaga hover_doc<CR>", 'Data type or variable information' },
                    r = { "<cmd>Lspsaga rename<CR>", 'Rename symbol' },
                    R = { "<cmd>Lspsaga rename ++project<CR>", 'Rename symbol in Project (x)' },
                    f = { "<cmd>Lspsaga incoming_calls<CR>", 'view call function' },
                    J = { "<Cmd>Lspsaga show_buf_diagnostics<CR>:echo 'Diagnostics All'<CR>", 'Diagnostics' },
                    a = { "<cmd>Lspsaga outline<CR>", 'code structure' },
                    d = { "<cmd>Lspsaga peek_definition<CR>", 'definition Floating' },
                    D = { "<cmd>Lspsaga peek_type_definition<CR>", 'definition Floating' },
                    e = { "<cmd>Lspsaga goto_type_definition<CR>", 'Go definition' },
                },

                ['m'] = { name = "Mason", i = { '<cmd>Mason<CR>', 'Mason information' } },

                ['n'] = {
                    name = "Neotree",
                    f = { '<cmd>Neotree float toggle<CR>', 'Floating Neotree' },
                    n = { '<cmd>Neotree right toggle<CR>', 'Neotree toggle' },
                    c = { '<cmd>Neotree close<CR>', 'close Neotree' },
                    r = { '<cmd>Neotree reveal focus<CR>', 'Neo set Root!' },
                    s = { '<cmd>Neotree show right<CR>', 'Show Neotree' },
                    e = { '<cmd>Neotree buffers float<CR>', 'Open buffers' },
                },

                i = { '<cmd>lua insertBlankLineAbove()<CR>', 'Insert line Above' },
                o = { "<cmd>call append(line('.'), '' )<CR>", 'Insert line below' }
            },
            [';'] = {
                name = "Telescope",
                k = {
                    function()
                        builtin.keymaps({ no_ignore = false, hidden = true })
                    end, 'key maps'
                },
                f = {
                    function()
                        builtin.find_files({ no_ignore = false, hidden = true })
                    end, 'find files'
                },
                g = { function() builtin.live_grep() end, 'Live Grep in proyect' },
                w = {
                    function() builtin.live_grep { search_dirs = { "%:p" } } end,
                    'live Grep in file'
                },
                W = {
                    function() builtin.live_grep { grep_open_files = true } end,
                    'live Grep in buffers'
                },
                t = { function() builtin.help_tags() end, 'Help tags' },
                [';'] = { function() builtin.resume() end, 'Resume' },
                d = { function()
                    builtin.diagnostics({
                        initial_mode = "normal"
                    })
                end, 'Diagnostics' },
                e = {
                    function() builtin.buffers({ initial_mode = "normal" }) end, 'Buffers'
                },
                s = {
                    function()
                        require('telescope').extensions.file_browser.file_browser({
                            path = "%:p:h",
                            cwd = telescope_buffer_dir(),
                            respect_gitignore = false,
                            hidden = true,
                            grouped = true,
                            -- initial_mode = "normal"
                        })
                    end, 'view file proyect'
                },
                r = { function() builtin.lsp_references() end, 'LSP References' },
                o = { function() builtin.oldfiles() end, 'Previously open files' },
                ['/'] = { function() builtin.search_history() end, 'Lists searches' },
                [':'] = {
                    function() builtin.command_history() end, 'Lists commands execute'
                },
                c = { function() builtin.highlights() end, 'Color highlights' },
                v = { function() builtin.git_status() end, 'Lists diff preview' }
            }
        })

        -- vim.keymap.set("<F4>", "n", "<cmd>WhichKey<CR>")
    end
}
