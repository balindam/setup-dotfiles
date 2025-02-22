local wezterm = require 'wezterm'

return {
  default_prog = { 'wsl', '--distribution', 'Ubuntu-24.04', '--cd', '/home/balindam' },
  
  -- Set background opacity (0.0 = fully transparent, 1.0 = fully opaque)
  window_background_opacity = 0.9, -- Adjust to your preferred transparency level

  -- Enable fullscreen mode without a taskbar
  window_decorations = "NONE", -- Removes window borders
  initial_cols = 120, -- Optional: Adjust initial width
  initial_rows = 30,  -- Optional: Adjust initial height

  -- Keybindings for tabs
  keys = {
    -- Open a new tab with Ctrl+T
    {key="t", mods="CTRL", action=wezterm.action.SpawnTab("CurrentPaneDomain")},

    -- Switch to specific tabs with Ctrl+1, Ctrl+2, etc.
    {key="1", mods="CTRL", action=wezterm.action.ActivateTab(0)},
    {key="2", mods="CTRL", action=wezterm.action.ActivateTab(1)},
    {key="3", mods="CTRL", action=wezterm.action.ActivateTab(2)},
    {key="4", mods="CTRL", action=wezterm.action.ActivateTab(3)},
    {key="5", mods="CTRL", action=wezterm.action.ActivateTab(4)},
    {key="6", mods="CTRL", action=wezterm.action.ActivateTab(5)},
    {key="7", mods="CTRL", action=wezterm.action.ActivateTab(6)},
    {key="8", mods="CTRL", action=wezterm.action.ActivateTab(7)},
    {key="9", mods="CTRL", action=wezterm.action.ActivateTab(8)},

    -- Switch to the next tab with Ctrl+Tab
    {key="Tab", mods="CTRL", action=wezterm.action.ActivateTabRelative(1)},

    -- Switch to the previous tab with Ctrl+Shift+Tab
    {key="Tab", mods="CTRL|SHIFT", action=wezterm.action.ActivateTabRelative(-1)},

    -- Maximize the window with Windows key + Up
    {key="UpArrow", mods="SUPER", action=wezterm.action.ToggleFullScreen},

    -- Minimize the window with Windows key + Down
    {key="DownArrow", mods="SUPER", action=wezterm.action_callback(function(win, pane)
      local overrides = win:get_config_overrides() or {}

      -- Check the window's current fullscreen state
      if overrides.window_decorations == "RESIZE" then
        -- Minimize the window
        win:perform_action(wezterm.action.Hide, pane)
      else
        -- Restore the window size
        overrides.window_decorations = "RESIZE"
        win:set_config_overrides(overrides)
      end
    end)},
  },
}
