local wezterm = require 'wezterm'

local config = {}
local is_windows = wezterm.target_triple:find("windows")

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.font = wezterm.font('Monaspace Neon Var');
config.font_size = 10
config.scrollback_lines = 10000
config.enable_scroll_bar = true
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#6194aa",
      fg_color = "#ffffff",
    },
    inactive_tab = {
      bg_color = "#303030",
      fg_color = "#808080",
    },
  }
}

if is_windows then
  config.default_domain = 'WSL:Ubuntu-24.04'
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

config.leader = {
  key = "n",
  mods = "CTRL",
  timeout_milliseconds = 2000,
}

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
  -- create a new tab
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnTab "DefaultDomain",
  },
  -- splitting
  {
    key = "s",
    mods = "LEADER",
    action = act.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "v",
    mods = "LEADER",
    action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  -- pane move
  {
    key = "l",
    mods = "LEADER",
    action = act.ActivatePaneDirection "Right",
  },
  {
    key = "h",
    mods = "LEADER",
    action = act.ActivatePaneDirection "Left",
  },
  {
    key = "j",
    mods = "LEADER",
    action = act.ActivatePaneDirection "Down",
  },
  {
    key = "k",
    mods = "LEADER",
    action = act.ActivatePaneDirection "Up",
  },
  -- move to tab
  {
    key = "1",
    mods = "LEADER",
    action = act.ActivateTab(0),
  },
  {
    key = "2",
    mods = "LEADER",
    action = act.ActivateTab(1),
  },
  {
    key = "3",
    mods = "LEADER",
    action = act.ActivateTab(2),
  },
  {
    key = "4",
    mods = "LEADER",
    action = act.ActivateTab(3),
  },
  {
    key = "5",
    mods = "LEADER",
    action = act.ActivateTab(4),
  },
  {
    key = "6",
    mods = "LEADER",
    action = act.ActivateTab(5),
  },
  {
    key = "7",
    mods = "LEADER",
    action = act.ActivateTab(6),
  },
  {
    key = "8",
    mods = "LEADER",
    action = act.ActivateTab(7),
  },
  {
    key = "9",
    mods = "LEADER",
    action = act.ActivateTab(8),
  },
}

return config
