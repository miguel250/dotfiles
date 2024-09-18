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

local default_mods = "CTRL"
if wezterm.target_triple:find("darwin") ~= nil then
    default_mods = "CMD"
end

local act = wezterm.action
config.keys = {
    { key = ")",     mods = default_mods, action = act.ResetFontSize },
    { key = "-",     mods = default_mods, action = act.DecreaseFontSize },
    { key = "=",     mods = default_mods, action = act.IncreaseFontSize },
    { key = "v",     mods = default_mods, action = act.PasteFrom("Clipboard") },
    { key = "Copy",  mods = "NONE",       action = act.CopyTo("Clipboard") },
    { key = "Paste", mods = "NONE",       action = act.PasteFrom("Clipboard") },
    { key = "F11",   mods = "NONE",       action = act.ToggleFullScreen }
}

config.mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor
    }
}

return config
