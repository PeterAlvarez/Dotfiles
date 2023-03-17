-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/home/tux/myCode/workspace/' .. project_name
--
-- local config = {
--     cmd = {
--         'java',
--         '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--         '-Dosgi.bundles.defaultStartLevel=4',
--         '-Declipse.product=org.eclipse.jdt.ls.core.product',
--         '-Dlog.protocol=true',
--         '-Dlog.level=ALL',
--         '-Xms1g',
--         '--add-modules=ALL-SYSTEM',
--         '--add-opens',
--         'java.base/java.util=ALL-UNNAMED',
--         '--add-opens',
--         'java.base/java.lang=ALL-UNNAMED',
--         -- 💀
--         '-jar', '/home/tux/.config/nvim/lybrary/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--
--         -- 💀
--         '-configuration', '/home/tux/.config/nvim/lybrary/java/jdt-language-server-1.9.0-202203031534/config_linux/',
--         -- 💀
--         -- See `data directory configuration` section in the README
--         '-data', workspace_dir
--     },
--     -- 💀
--     -- root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
--     -- root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
--     capabilities = capabilities,
-- }
--
-- require('jdtls').start_or_attach(config)
--
--
--
--





















--
--
-- local nvim_lsp = require('lspconfig')
-- local configs = require('lspconfig/configs')
--
-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/home/tux/myCode/Java/' .. project_name
--
-- if not nvim_lsp.jdtls then
--     configs.jdtls = {
--         default_config = {
--             cmd = {
--                 'java', '/usr/bin/java',
--                 '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--                 '-Dosgi.bundles.defaultStartLevel=4',
--                 '-Declipse.product=org.eclipse.jdt.ls.core.product',
--                 '-Dlog.protocol=true',
--                 '-Dlog.level=ALL',
--                 '-Xms1g',
--                 '--add-modules=ALL-SYSTEM',
--                 '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--                 '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--                 -- 💀
--                 '-jar', '/home/tux/.config/nvim/lybrary/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--                 -- 💀
--                 '-configuration', '/home/tux/.config/nvim/lybrary/java/jdt-language-server-1.9.0-202203031534/config_linux/',
--
--                 -- 💀
--                 -- See `data directory configuration` section in the README
--                 '-data', workspace_dir,
--             },
--             filetypes = {'java'},
--             settings = {
--                 java = {
--                     signatureHelp = { enabled = true },
--                     completion = {
--                         favoriteStaticMembers = {
--                             "org.hamcrest.MatcherAssert.assertThat",
--                             "org.hamcrest.Matchers.*",
--                             "org.hamcrest.CoreMatchers.*",
--                             "org.junit.jupiter.api.Assertions.*",
--                             "java.util.Objects.requireNonNull",
--                             "java.util.Objects.requireNonNullElse",
--                             "org.mockito.Mockito.*"
--                         }
--                     },
--                     sources = {
--                         organizeImports = {
--                             starThreshold = 9999,
--                             staticStarThreshold = 9999,
--                         },
--                     },
--                 },
--             },
--         },
--     }
-- end
--
-- nvim_lsp.jdtls.setup({})
--
