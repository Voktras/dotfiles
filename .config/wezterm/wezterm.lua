--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local dark_opacity = 0.95
local light_opacity = 0.75

local wallpapers_glob = os.getenv("HOME") .. "/.config/wezterm/wallpapers/**"

local b = require("utils/background")
local h = require("utils/helpers")
local w = require("utils/wallpaper")

local wezterm = require("wezterm")
local act = wezterm.action

---@type config
---@diagnostic disable: missing-fields
local config = {
	-- performance
	front_end = "WebGpu",
	max_fps = 120,
	-- TODO: change this when unplugged?
	webgpu_power_preference = "HighPerformance",

	background = {
		w.get_wallpaper(wallpapers_glob),
		b.get_background(dark_opacity, light_opacity),
	},

	-- typography
	font_size = 17.3,
	line_height = 1.0,
	adjust_window_size_when_changing_font_size = false,

	font = wezterm.font_with_fallback({
		"Maple Mono",
		-- { family = "Noto Color Emoji" }, -- default?
		-- NOTE: fallback font for Nerd Font icons
		{ family = "Symbols Nerd Font Mono" },
	}),

	color_scheme = "Catppuccin Mocha",

	window_padding = {
		left = 40,
		right = 40,
		top = 40,
		bottom = 15,
	},

	-- general options
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "NONE",
	kde_window_background_blur = true,
	window_background_opacity = 1,
	text_background_opacity = 1,

	window_background_image_hsb = {
		brightness = 0.2,
		saturation = 1.0,
		hue = 1.0,
	},

	wezterm.on("user-var-changed", function(window, pane, name, value)
		local overrides = window:get_appearance() or {}
		wezterm.log_info("name", name)
		wezterm.log_info("value", value)

		if name == "WALLPAPER" then
			overrides.background = {
				w.get_path_wallpaper(value),
				b.get_background(dark_opacity, light_opacity),
			}
		end

		window:set_config_overrides(overrides)
	end),
}

return config
