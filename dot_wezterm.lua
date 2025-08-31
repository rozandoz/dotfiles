local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

-- window
config.window_decorations = 'TITLE|RESIZE'
config.color_scheme = 'Catppuccin Macchiato'
config.enable_scroll_bar = true

-- tabs
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- panes
config.unzoom_on_switch_pane = true

if is_linux then
    config.front_end = 'WebGpu'
end

-- fonts
config.font = wezterm.font('JetBrains Mono')
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 14;

-- shell
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'powershell.exe', '-NoLogo' }
end

-- binds
config.leader = { key = 't', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
    -- panes
    { key = 'h', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'v', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },
    { key = 'q', mods = 'LEADER', action = wezterm.action.PaneSelect { alphabet = '0123456789' } },
    { key = 'z', mods = 'LEADER', action = wezterm.action.TogglePaneZoomState },

    -- clipboard
    { key = 'v', mods = 'CTRL',   action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'y', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },

    -- tabs
    { key = 'w', mods = 'LEADER', action = wezterm.action.ShowTabNavigator },
    { key = 'c', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'x', mods = 'SHIFT|LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },
    { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
    {
        key = ',',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Rename',
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }
    }
}

-- plugins
local smart_splits = wezterm.plugin.require('https://github.com/mrjones2014/smart-splits.nvim')
smart_splits.apply_to_config(config)

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
    options = {
        tabs_enabled = true,
        theme = config.color_scheme,
        tab_separators = {
            left = ' ', --wezterm.nerdfonts.pl_left_hard_divider,
            right = '', --wezterm.nerdfonts.pl_right_hard_divider,
        },
    },
    sections = {
        tabline_a = { 'mode' },
        tabline_b = { 'workspace' },
        tabline_c = { ' ' },
        tab_active = {
            'index',
            { 'parent', padding = 0 },
            '/',
            { 'cwd', padding = { left = 0, right = 1 } },
            { 'zoomed', padding = { left = 0, right = 1 } },
        },
        -- tab_inactive = { 'index', { 'process', padding = { left = 0, right = 1 } } },
        tabline_x = {},
        tabline_y = { 'ram', 'cpu' },
        -- tabline_z = { 'datetime' },
        tabline_z = {},
    }
})

return config
