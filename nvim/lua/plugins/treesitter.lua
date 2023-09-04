return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag", "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "User AstroFile",
    config = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "javascript",
                "typescript",
                "c",
                "lua",
                "vim",
                "tsx",
                "json",
                "html",
                "css",
                "java",
                "markdown",
                "python",
                "sql",
            },
            
            
            -- Automatically install missing parsers when entering buffer
            auto_install = true,
            
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            disable = { "md" },
            indent = {
                enable = true,
                disable = {},
            },
            autotag = {
                enablee = true,
            },
        }
    end,
}
