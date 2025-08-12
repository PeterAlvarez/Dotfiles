-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Cuando activas :set paste, Neovim desactiva cosas como
-- el autoindentado o el bracket matching para facilitar pegar texto
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.o.paste = false
  end,
})

-- Es una opción de Neovim/Vim que esconde
-- ciertos caracteres o los reemplaza por símbolos
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact" },
  desc = "Force indent to 4 spaces for TS",
  callback = function()
    vim.schedule(function()
      vim.opt_local.expandtab = true
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.softtabstop = 4
      -- vim.notify("✅ Indentación TS forzada a 4 espacios", vim.log.levels.INFO)
    end)
  end,
})

vim.api.nvim_create_user_command("ToggleBufferline", function()
  if vim.o.showtabline == 0 then
    vim.o.showtabline = 2 -- mostrar siempre
  else
    vim.o.showtabline = 0 -- ocultar
  end
end, {})
