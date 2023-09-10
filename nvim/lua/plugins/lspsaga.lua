return {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'kyazdani42/nvim-web-devicons',
    },
    config = function()
        -- if (not status) then return end

        require('lspsaga').setup({
            ui = {
                winblend = 10,
                border = 'rounded',
                colors = {
                    normal_bg = '#002b36'
                },
                title = true
            },
            finder = {
                max_height = 0.7,
                right_width = 0.6,
                left_width = 0.6,
                keys = {
                    open = "o",
                    vsplit = "s",
                    split = "i",
                    quit = { "q", "<ESC>" },
                },
            },

            diagnostics = {
                max_height = 0.8,
                keys = {
                    quit = { 'q', '<ESC>' },
                }
            },

            hover = {
                max_height = 0.8,
                max_width = 0.9,
                open_link = 'gx',
                open_cmd = '!chrome',
            },

            code_action = {
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
                show_server_name = true,
                extend_gitsings = true,
            },

            rename = {
                rename_prompt_prefix = "➤",
                rename_output_qflist = {
                    enable = false,
                    auto_open_qflist = false,
                    quit = 'C-c',
                },

            },

            outline = {
                win_position = 'left',
                max_height = 0.7,
                left_width = 0.1,
                win_width = 30,
                auto_close = false,
            },

        })
    end,

}
