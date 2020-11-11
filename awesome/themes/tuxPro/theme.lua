--[[

     Steamburn Awesome WM theme 3.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local os    = { getenv = os.getenv }

local theme                                     = {}
theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/tuxPro"
theme.wallpaper                                 = theme.dir .. "/fondo/35.png"
theme.font                                      = "Misc Bold 9"--"Misc Bold 10"

theme.fg_normal                                 = "#fbf1c7"--"#4FFF67"--"#F9FFFE"
theme.fg_focus                                  = "#d88166"
theme.fg_urgent                                 = "#CC9393"
theme.bg_normal                                 = "#282828"----color bar" #140c0b"
theme.bg_focus                                  = "#FF0000" --border notificacoin
theme.bg_urgent                                 = "#2a1f1e"

theme.border_width                              = 2.5
theme.border_normal                             = "#302627"
theme.border_focus                              = "#FF0000"--"#FF530D"--"#c2745b"--
--theme.border_marked                             = "#FF0000"
--focus
theme.taglist_bg_focus                          = "#303030"--"#d88166"--
theme.taglist_fg_focus                          = "#5fb6ba" --focus en bar
--theme.taglist_fg_focus                          = "#94caf7"

theme.tasklist_bg_focus                         = "#282828"--"#303030" ----color bg_focus bar bootom
theme.tasklist_fg_focus                         = "#5fb6ba"--"#4DC319"--color focus bar bootom
--theme.tasklist_fg_focus                         = "#d88166"--"#4DC319"--color focus bar bootom
theme.tasklist_fg_normal                        = "#282828" --"#FF0000"

theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.menu_height                               = 15
theme.menu_width                                = 140
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.layout_txt_tile                           = "[t]"
theme.layout_txt_tileleft                       = "[l]"
theme.layout_txt_tilebottom                     = "[b]"
theme.layout_txt_tiletop                        = "[tt]"
theme.layout_txt_fairv                          = "[fv]"
theme.layout_txt_fairh                          = "[fh]"
theme.layout_txt_spiral                         = "[s]"
theme.layout_txt_dwindle                        = "[d]"
theme.layout_txt_max                            = "[m]"
theme.layout_txt_fullscreen                     = "[F]"
theme.layout_txt_magnifier                      = "[M]"
theme.layout_txt_floating                       = "[|]"
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 0
theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray   = "#5fb6ba"

-- Textclock
local mytextclock = wibox.widget.textclock(" %H:%M | ")
mytextclock.font = theme.font



-- saca caledario en hover... aprender
-- Calendar
--lain.widget.calendar({
--    attach_to = { mytextclock },
--    notification_preset = {
--        font = "Misc Tamsyn 11",
--        fg   = theme.fg_normal,
--        bg   = theme.bg_normal
--    }
--})

 --Mail IMAP check
-- commented because it needs to be set before use
 local mail = lain.widget.imap({
     timeout  = 180,
     server   = "server",
     mail     = "mail",
     password = "keyring get mail",
     settings = function()
         mail  = ""
         count = ""

         if mailcount > 0 then
             mail = "Mail "
             count = mailcount .. " "
         end

         widget:set_markup(markup(gray, mail) .. count)
     end
 })


-- MPD
theme.mpd = lain.widget.mpd({
    settings = function()
        artist = mpd_now.artist .. " "
        title  = mpd_now.title  .. " "

        if mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = ""
            title  = ""
        end

        widget:set_markup(markup.font(theme.font, markup(gray, artist) .. title))
    end
})

-- CPU
local cpu = lain.widget.sysload({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, "| Cpu ") .. load_1 .. "  |"))
    end
})

-- MEM
local mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(theme.font, markup(gray, "  Mem ") .. mem_now.used .. "  |"))
    end
})

-- /home fs
theme.fs = lain.widget.fs({
    options = "--exclude-type=tmpfs",
    partition = "/home",
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Misc Tamsyn 10.5" },
})

-- Battery
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc
        if bat_now.ac_status == 1 then perc = "Plug" end
        widget:set_markup(markup.font(theme.font, markup(gray, "  Bat ") .. perc .. "  |"))
    end
})

-- Net checker
local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then net_state = "On"
        else net_state = "Off" end
        widget:set_markup(markup.font(theme.font, markup(gray, " Net ") .. net_state .. " |"))
    end
})

-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        header = "  Vol "
        vlevel  = volume_now.level

        if volume_now.status == "off" then
            vlevel = vlevel .. "M |"
        else
            vlevel = vlevel .. "  |"
        end

        widget:set_markup(markup.font(theme.font, markup(gray, header) .. vlevel))
    end
})

-- Weather
theme.weather = lain.widget.weather({
    city_id = 2643743, -- placeholder (London)
})

-- Separators
local first = wibox.widget.textbox(markup.font("Misc Tamsyn 4", " "))
local spr   = wibox.widget.textbox(' | ')

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(awful.util.table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           awful.button({}, 3, function() awful.layout.inc(-1) end),
                           awful.button({}, 4, function() awful.layout.inc(1) end),
                           awful.button({}, 5, function() awful.layout.inc(-1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = 17 })

    -- local wiboxlayout = wibox.layout.align.horizontal()
    -- wiboxlayout.expand = "none"

    -- Add widgets to the wibox
    s.mywibox:setup {
        -- layout = wiboxlayout,
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --spr,
            first,
            s.mytaglist,
            --spr,
            --s.mytxtlayoutbox,
            --spr,
            s.mypromptbox,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --wibox.widget { nil, nil, theme.mpd.widget, layout = wibox.layout.align.horizontal },
            --theme.mpd.widget,
            --mail.widget,
            cpu.widget,
            mem.widget,
            bat.widget,
            --net.widget,
            theme.volume.widget,
            mytextclock,
            wibox.widget.systray(),
            spr,
        },
    }
end
return theme
