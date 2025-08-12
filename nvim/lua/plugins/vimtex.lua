return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura" -- visor PDF
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        -- build_dir = vim.fn.expand("~/Documentos/latex-build"),
        continuous = 0, -- no compilar en tiempo real
        options = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "-file-line-error",
        },
      }

      -- Auto compilar al guardar .tex
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.tex",
        callback = function()
          vim.cmd("VimtexCompile")
        end,
      })
    end,
  },
}
