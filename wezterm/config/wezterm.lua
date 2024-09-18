local wezterm = require "wezterm"

local config = wezterm.config_builder()
config.check_for_updates = false
config.enable_tab_bar = false -- we are still using tmux

config.font_size = 16
config.font =
    wezterm.font {
    family = "JetBrains Mono"
}
config.disable_default_key_bindings = true

local act = wezterm.action
config.keys = {
    {key = ")", mods = "CTRL", action = act.ResetFontSize},
    {key = "-", mods = "CTRL", action = act.DecreaseFontSize},
    {key = "=", mods = "CTRL", action = act.IncreaseFontSize},
    {key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard")},
    {key = "Copy", mods = "NONE", action = act.CopyTo("Clipboard")},
    {key = "Paste", mods = "NONE", action = act.PasteFrom("Clipboard")},
    {key = "F11", mods = "NONE", action = act.ToggleFullScreen}
}

config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = {Up = {streak = 1, button = "Left"}},
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor
    }
}

return config
