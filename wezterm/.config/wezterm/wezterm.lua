local wezterm = require("wezterm")
local config = {
    font_size = 18,
    font = wezterm.font_with_fallback({
        { family = 'JetBrainsMono Nerd Font', weight = 'Regular' },
        { family = 'Noto Sans CJK SC',        weight = 'Regular' },
        'Noto Color Emoji',
    }),
    color_scheme = 'OneDark (base16)',

    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },

    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE",
    window_close_confirmation = 'NeverPrompt',
    disable_default_key_bindings = true,
    keys = {
        {
            key = 'c',
            mods = 'CMD',
            action = wezterm.action.CopyTo('Clipboard'),
        },
        {
            key = 'v',
            mods = 'CMD',
            action = wezterm.action.PasteFrom('Clipboard'),
        },
        {
            key = 'L',
            mods = 'CMD|SHIFT',
            action = wezterm.action.ShowDebugOverlay,
        },
        {
            key = '=',
            mods = 'CMD',
            action = wezterm.action.IncreaseFontSize,
        },
        {
            key = '-',
            mods = 'CMD',
            action = wezterm.action.DecreaseFontSize,
        },
    }
}

return config
