return {
    {
        'MunifTanjim/prettier.nvim',
        dependencies = { 'jose-elias-alvarez/null-ls.nvim', 'wesleimp/stylua.nvim' },
        config = function()
            local prettier = require("prettier")
            local status, null_ls = pcall(require, "null-ls")

            prettier.setup({
                default_options = {
                    _initialized = false,
                    bin = "prettier",
                    filetypes = {
                        "graphql",
                        "html",
                        "json",
                        "less",
                        "markdown",
                        "scss",
                        "javascript",
                        "java",
                        "typescript",
                        "typescriptreact",
                        "yaml",
                    },

                    ["null-ls.condition"] = function()
                        return u.config_exists({
                            check_package_json = true,
                        })
                    end,
                    cli_options = {
                        config_precedence = "prefer-file",
                    },
                },
                prettier.setup({
                    cli_options = {
                        arrow_parens = "always",
                        bracket_spacing = true,
                        bracket_same_line = false,
                        embedded_language_formatting = "auto",
                        end_of_line = "lf",
                        html_whitespace_sensitivity = "css",
                        -- jsx_bracket_same_line = false,
                        jsx_single_quote = false,
                        print_width = 80,
                        prose_wrap = "preserve",
                        quote_props = "as-needed",
                        semi = true,
                        single_attribute_per_line = false,
                        single_quote = false,
                        tab_width = 4,
                        trailing_comma = "es5",
                        use_tabs = false,
                        vue_indent_script_and_style = false,
                    },
                }),


                null_ls.setup {
                    sources = {
                        null_ls.builtins.code_actions.gitsigns,
                        null_ls.builtins.formatting.jq,
                        null_ls.builtins.code_actions.refactoring,
                        null_ls.builtins.formatting.alejandra,
                        -- null_ls.builtins.diagnostics.luacheck,
                        null_ls.builtins.diagnostics.yamllint,
                        null_ls.builtins.formatting.stylua,

                        null_ls.builtins.diagnostics.phpcs.with {
                            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                            condition = function(utils)
                                return utils.root_has_file "phpcs.xml"
                            end,
                        },
                        null_ls.builtins.formatting.pint,
                    },
                }

            });
        end
    },
}
