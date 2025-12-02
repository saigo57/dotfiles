local wezterm = require 'wezterm'

local config = {}
local is_windows = wezterm.target_triple:find("windows")

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'AdvenureTime'
config.font_size = 10

if is_windows then
  config.default_prog = { 'pwsh.exe', '-NoLogo' }
else
  config.default_prog = { 'zsh', '-l' }
end

config.audible_bell = "Disabled"

-- 背景透過
config.window_background_opacity = 0.85

-- 最初からフルスクリーンで起動
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():toggle_fullscreen()
-- end)

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
}

return config
