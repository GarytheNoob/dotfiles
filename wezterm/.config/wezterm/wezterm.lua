local wezterm = require("wezterm")

local get_theme = function ()
    local env_theme = os.getenv("THEME")
    if env_theme then
        if env_theme == "onedark" then
            return 'OneDark (base16)'
        end
    end
    return 'Default Dark (base16)'
end

local config = {
    font_size = 14,
    font = wezterm.font_with_fallback({
        { family = 'JetBrainsMono Nerd Font', weight = 'Regular' },
        { family = 'Noto Sans CJK SC',        weight = 'Bold'    },
        'Noto Color Emoji',
    }),
    color_scheme = get_theme(),

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE",
}

return config
