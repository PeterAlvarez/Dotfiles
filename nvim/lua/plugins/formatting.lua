return {
    {
        "stevearc/conform.nvim",
        dependencies = { "mason.nvim" },
        lazy = true,
        cmd = "ConformInfo",
        keys = {
            {
                "<leader>cF",
                function()
                    require("conform").format({ formatters = { "injected" } })
                end,
                mode = { "n", "v" },
                desc = "Format Injected Langs",
            },
        },
        optional = true,
        opts = {
            formatters_by_ft = {
                ["javascript"] = { "deno" },
                ["javascriptreact"] = { "deno" },
                ["typescript"] = { "deno" },
                ["typescriptreact"] = { "deno" },
                ["vue"] = { "prettier" },
                ["css"] = { "deno" },
                ["scss"] = { "prettier" },
                ["less"] = { "prettier" },
                ["html"] = { "prettier" },
                ["json"] = { "prettier" },
                ["jsonc"] = { "prettier" },
                ["yaml"] = { "prettier" },
                ["markdown"] = { "deno" },
                ["markdown.mdx"] = { "deno" },
                ["graphql"] = { "prettier" },
                ["handlebars"] = { "prettier" },
                ["lua"] = { "stylua" },
                ["python"] = { "black", "isort" },
            },
        },
        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            require("conform").format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" }),
    },
}
