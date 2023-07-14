local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup {
    bin = 'prettierd',
    filetypes = {
        'css',
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'jason',
        'scss',
        'less',
        'yml',
        'html',
        'python',
        'php'
    },
   tab_width = 4,
}

