return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    -- build = "cd app && npm install",
    init = function()
      vim.g.mkdp_auto_start = 1
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_browser = "" -- usa el navegador por defecto
      vim.g.mkdp_theme = "dark"
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_port = "8080"
      vim.g.mkdp_page_title = "${name}"

      -- Mapas con la tecla '\' como prefijo
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "\\mp", "<cmd>MarkdownPreview<CR>", opts) -- Ver Markdown
      map("n", "\\ms", "<cmd>MarkdownPreviewStop<CR>", opts) -- Detener vista
      map("n", "\\mt", "<cmd>MarkdownPreviewToggle<CR>", opts) -- Alternar vista
    end,
  },
}
