local wezterm = require("wezterm")
local config = {}

config.max_fps = 240
config.color_scheme = "Tokyo Night"
config.font_size = 14
config.hide_mouse_cursor_when_typing = true

-- Window settings
-- config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.use_resize_increments = false

-- Tab bar settings
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 32

-- Show tab index + folder name instead of full process title
wezterm.on("format-tab-title", function(tab)
	local pane = tab.active_pane
	local title = tab.tab_title -- respects manually renamed tabs (your Ctrl+Shift+R bind)
	if not title or title == "" then
		local cwd = pane.current_working_dir
		if cwd then
			title = cwd.file_path:match("([^/]+)$") or pane.title
		else
			title = pane.title
		end
	end
	return " " .. (tab.tab_index + 1) .. ": " .. title .. " "
end)

-- Keybinds
local keys = {
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}
-- Generate Alt+1-9 tab switching
for i = 1, 9 do
	table.insert(keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end
config.keys = keys

-- Tab bar colors
config.colors = {
	tab_bar = {
		background = "#1a1b26",
		inactive_tab_edge = "#1a1b26",
		active_tab = {
			bg_color = "#7aa2f7",
			fg_color = "#1a1b26",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#292e42",
			fg_color = "#787c99",
		},
		inactive_tab_hover = {
			bg_color = "#3b4261",
			fg_color = "#c0caf5",
		},
	},
}

-- Padding
config.window_padding = {
	left = 9,
	right = 9,
	top = 8,
	bottom = 0,
}

return config
