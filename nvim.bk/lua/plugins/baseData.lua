return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "kristijanhusak/vim-dadbod-completion",
        "tpope/vim-dadbod",
    },

        init = function()
            vim.g.db_ui_show_help = 0
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_win_position = 'right'
            vim.g.db_ui_win_width = 60
            vim.g.db_ui_save_location = 1
            vim.g.db_ui_execute_on_save = 0
            vim.g.db_ui_save_location = "~/myCode/cheatSheet/myQuery/"

            vim.g.db_ui_table_helpers = {
                postgres = {
                    limit_clause = 'LIMIT 50',
                    table_helpers = {
                        {
                            table = '*',
                            alias = 'All',
                            limit = 1000,
                            order_by = 'id desc'
                        }
                    }
                },
                mysql = {
                    limit_clause = 'LIMIT 50',
                    table_helpers = {
                        {
                            table = '*',
                            alias = 'All',
                            limit = 1000,
                            order_by = 'id desc'
                        }
                    }
                }
            }
            vim.cmd([[
          let g:dbs = {
          \ 'prueba': 'postgres://root:root@127.0.0.1:5432/prueba',
          \ 'db-taller': 'postgres://root:root@127.0.0.1:5432/db-taller',
          \ }
          ]])


            -- sources = cmp.config.sources({
            --     { name = 'path' },
            --     { name = 'nvim_lsp', keyword_length = 3 },
            --     { name = 'buffer',   keyword_length = 3 },
            --     { name = 'luasnip',  keyword_length = 2 },
            -- }),
            vim.cmd([[ autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {
            \{ name = 'nvim_lsp', keyword_length = 2 },
            \{ name = 'luasnip',  keyword_length = 2 },
            \{ name = 'buffer',   keyword_length = 2 },
            \{ name = 'vim-dadbod-completion', keyword_length = 2 },
            \{ name = 'path' },
            \}
            \})]])



            vim.g.db_ui_icons = {
                expanded = {
                    db = '▾ ',
                    buffers = '▾ ',
                    saved_queries = '▾ ',
                    schemas = '▾ ',
                    schema = '▾ פּ',
                    tables = '▾ 藺',
                    table = '▾ ',
                },
                collapsed = {
                    db = '▸ ',
                    buffers = '▸ ',
                    saved_queries = '▸ ',
                    schemas = '▸ ',
                    schema = '▸ פּ',
                    tables = '▸ 藺',
                    table = '▸ ',
                },
                saved_query = '',
                new_query = '璘',
                tables = '離',
                buffers = '﬘',
                add_connection = '',
                connection_ok = '✓',
                connection_error = '✕',
            }

            -- opening it in a new tab
            -- vim.keymap.set('n', '<leader><leader>db', ':tab DBUI<cr>', {})

            -- just close the tab, but context related of the keybinding
            -- vim.keymap.set('n', '<leader><leader>tq', ':tabclose<cr>')

        end

}
