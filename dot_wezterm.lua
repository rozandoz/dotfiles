local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

local is_linux = function()
	return wezterm.target_triple:find("linux") ~= nil
end

-- window
config.window_decorations = 'TITLE|RESIZE'
config.hide_tab_bar_if_only_one_tab = true;
config.window_frame = { font_size = 13.0 }
config.color_scheme = 'Catppuccin Frappe'
config.enable_scroll_bar = true

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
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {

    -- panes
    { key = 's', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'v', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'q', mods = 'LEADER', action = wezterm.action.CloseCurrentPane { confirm = true } },

    -- clipboard
    { key = 'v', mods = 'CTRL',   action = wezterm.action.PasteFrom 'Clipboard' },
    { key = 'c', mods = 'LEADER', action = wezterm.action.ActivateCopyMode },

    -- tabs
    { key = 't', mods = 'LEADER', action = wezterm.action.ShowTabNavigator },
    { key = 'o', mods = 'LEADER', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
    { key = 'x', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true } },
    { key = 'n', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'p', mods = 'LEADER', action = wezterm.action.ActivateTabRelative(1) },
    {
        key = '.',
        mods = 'LEADER',
        action = act.PromptInputLine {
            description = 'Rename tab',
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

return config
