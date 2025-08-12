-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("solarized-osaka").setup({
        transparent = true,
      })

      vim.cmd.colorscheme("solarized-osaka")

      local hl = vim.api.nvim_set_hl

      vim.defer_fn(function()
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#27991f", bg = "NONE" })
        vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#27991f" })
      end, 50)

      hl(0, "NeotreeNormalNc", { bg = "NONE" })
      hl(0, "NeotreeNormal", { bg = "NONE" })
      hl(0, "NeoTreeFloatNormal", { bg = "NONE" })
      hl(0, "NeoTreeFloatBorder", { fg = "#27991f", bg = "NONE" })
      hl(0, "TelescopeBorder", { fg = "#27991f", bg = "NONE" })
      hl(0, "TelescopeNormal", { bg = "NONE", fg = "#657b83" })

      -- ~/.config/nvim/lua/config/highlights.lua

      hl(0, "GitSignsAddPreview", { fg = "#719e07", bg = "NONE", bold = true, sp = "#719e07" })
      hl(0, "GitSignsDeletePreview", { fg = "#dc322f", bg = "NONE", bold = true })
      hl(0, "@ibl.indent.char.1", { fg = "#657b83", nocombine = true })
      hl(0, "MiniIndentscopeSymbol", { fg = "#cc241d", nocombine = true })
      hl(0, "Directory", { fg = "#27991f" })
      hl(0, "LineNr", { fg = "#859900" })
      hl(0, "InclineNormal", { fg = "#000000", bg = "#27991f" })
      hl(0, "WhichKeyDesc", { fg = "#27991f" })
      hl(0, "NotifyINFOBorder", { fg = "#27991f" })

      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#657b83", bold = true }) -- rojo
      vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#719e07", bold = true }) -- rojo
      vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#719e07", bold = true }) -- rojo
      vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "NONE", fg = "#27991f" }) -- rojo

      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#27991f" }) -- rojo
      vim.api.nvim_set_hl(0, "LspInfoBorder", { bg = "NONE", fg = "#27991f" }) -- rojo
      vim.api.nvim_set_hl(0, "SnacksInputBorder", { bg = "NONE", fg = "#27991f" }) -- rojo
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "NONE", fg = "#27991f" }) -- rojo

      --NOTE: configuration Menu colores
      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "NONE", fg = "#27991f" }) -- rojo
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#27991f", fg = "#000000" }) -- rojo
      vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE", fg = "NONE" }) -- rojo
      vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#27991f", fg = "NONE" }) -- rojo
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { bg = "NONE", fg = "#27991f" }) -- rojo
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "NONE", fg = "#27991f" }) -- rojo

      -- vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#ffffff" }) -- línea activa
      -- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "#888888" }) -- línea inactiva

      -- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { bg = "NONE" })
      -- vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { bg = "NONE" })

      vim.api.nvim_set_hl(0, "Visual", { reverse = true })
    end,
  },
  -- { "ellisonleao/gruvbox.nvim" },
  -- { "loctvl842/monokai-pro.nvim" },
}
