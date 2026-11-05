local browser = "librewolf"

require("binds")
require("animations4")
require("scripts")

hl.monitor({
    output   = "",
    mode     = "1920x1080@60",
    -- mode     = "1366x768@60",
    position = "auto",
    scale    = "1",
})
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_WAYLAND_DISABLE", "ext_background_effect_manager_v1")
hl.env("BROWSER", browser)


hl.config({
    general = {
        gaps_in          = 5,
        gaps_out         = 10,

        border_size      = 2,

        col              = {
            active_border   = { colors = { "#ead6b8", "#653221" }, angle = 45 },
            inactive_border = "#765b45",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/
        allow_tearing    = false,

        layout           = "dwindle",
    },

    decoration = {
        rounding         = 20, -- default: 10
        -- rounding         = 0,
        rounding_power   = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.9,
        inactive_opacity = 0.8,

        shadow           = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = '0xee1a1a1a',
        },

        blur             = {
            enabled  = true,
            size     = 6,
            passes   = 3,
            vibrancy = 0.1696,
            variant  = "acrylic",
            acrylic = {
                clarity = 0.3,
                aberration = 0.25,
                refraction = 25.0 -- default = 24.0
            },
            xray     = true,
        },
    },

    animations = {
        enabled = true,
    },

    cursor = {
        hide_on_key_press = true,
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


hl.config({
    input = {
        kb_layout    = "us",
        follow_mouse = 1,
    },
})

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

hl.window_rule({
    name  = "Pip",
    match = { title = "Picture-in-Picture" },

    size = { 420, 230 },
    float = true,
    center = true
})
hl.window_rule({
    name  = "Image Selection",
    match = { title = "imageselection" },

    size = { 1035, 340 },
    float = true,
    center = true
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})
hl.window_rule({
    name    = "Minecraft",
    match   = { class = [[^Minecraft.+]] },

    opacity = "1 1 1"
})
hl.window_rule({
    name    = "gnome stuff",
    match   = { class = "gnome" },

    opacity = "1 1 1"
})
