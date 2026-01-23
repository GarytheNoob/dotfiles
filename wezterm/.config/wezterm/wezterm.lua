local wezterm = require("wezterm")

local config = {
    font_size = 18,
    font = wezterm.font_with_fallback({
        { family = 'JetBrainsMono Nerd Font', weight = 'Regular' },
        { family = 'Noto Sans CJK SC',        weight = 'Bold'    },
        'Noto Color Emoji',
    }),
    color_scheme = 'OneDark (base16)',

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE",
    window_close_confirmation = 'NeverPrompt',
}

return config
