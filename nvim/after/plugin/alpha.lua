local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
    return
end

local dashboard = require('alpha.themes.dashboard')

-- Footer
local function footer()
    local version = vim.version()
    local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
    local datetime = os.date('%Y/%m/%d %H:%M:%S')

    return print_version .. ' - ' .. datetime
end


-- Banner
local banner = {
    [[              PeterAlvarez           aisraelpeter@gmail.com           ]],
    [[                                                                        ]],
    [[  ██╗    ░█████╗░███╗░░░███╗    ██████╗░░█████╗░░█████╗░████████╗██╗██╗ ]],
    [[  ██║    ██╔══██╗████╗░████║    ██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║██║ ]],
    [[  ██║    ███████║██╔████╔██║    ██████╔╝██║░░██║██║░░██║░░░██║░░░██║██║ ]],
    [[  ██║    ██╔══██║██║╚██╔╝██║    ██╔══██╗██║░░██║██║░░██║░░░██║░░░╚═╝╚═╝ ]],
    [[  ██║    ██║░░██║██║░╚═╝░██║    ██║░░██║╚█████╔╝╚█████╔╝░░░██║░░░██╗██╗ ]],
    [[  ╚═╝    ╚═╝░░╚═╝╚═╝░░░░░╚═╝    ╚═╝░░╚═╝░╚════╝░░╚════╝░░░░╚═╝░░░╚═╝╚═╝ ]],
}

dashboard.section.header.val = banner

-- Menu
dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
    dashboard.button('r', '  Recently opened files', '<cmd>Telescope oldfiles<CR>'),
    dashboard.button('sf', '  Find file', '<cmd>Telescope file_browser<CR>'),
    dashboard.button('S', '  Settings', ':e $MYVIMRC<CR>'),
    dashboard.button('q', '  Quit', ':qa<CR>'),
}

dashboard.section.footer.val = footer()
alpha.setup(dashboard.config)

vim.keymap.set("n", "<F3>", "<cmd>Alpha<CR>")
