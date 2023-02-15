require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = {
        "help",
        "javascript",
        "typescript",
        "c",
        "lua",
        "vim",
        "tsx",
        "json",
        "html",
    },

    sync_install = false,

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
    }
}