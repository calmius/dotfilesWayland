local wezterm = require 'wezterm';
local act = wezterm.action;

-- Path in tab name
function basename(s)
   return string.gsub(s, '(.*[/\\])(.*)', '%2')
end
wezterm.on(
   'format-tab-title',
   function(tab, tabs, panes, config, hover, max_width) 
      local pane = tab.active_pane
      local cwd = pane.current_working_dir
      local cwd_string = tostring(cwd)
      local title = basename(cwd_string)
      return {
	 { Background = { Color = ' #333333' } },
	 { Text = ' ' .. title .. ' ' },
      }
   end
)

return {
   automatically_reload_config = true;

   keys = {
      { key = 'U', mods = 'SHIFT', action = act.ScrollByPage(-0.025) },
      { key = 'E', mods = 'SHIFT', action = act.ScrollByPage(0.05) },
   };
   scrollback_lines = 3500;

   color_scheme = "Tomorrow (dark) (terminal.sexy)";

   window_background_opacity = 0.9;
   tab_bar_at_bottom = true,
   use_fancy_tab_bar = false,
   window_decorations = "RESIZE";
   font = wezterm.font 'Iosevka Curly',
   -- font = wezterm.font 'Cantarell-Regular',
   font_size = 12;
}