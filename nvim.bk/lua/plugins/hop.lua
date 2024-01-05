return {
    'phaazon/hop.nvim',
    config = function ()
        require('hop').setup({
            -- local hop = require('hop');
            vim.api.nvim_set_keymap("n", "f", ":HopChar2<cr>", { silent = true }),
            vim.api.nvim_set_keymap("n", "F", ":HopWord<cr>", { silent = true })

        })
    end
}
