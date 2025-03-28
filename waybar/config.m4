// Adapted from https://git.sr.ht/~begs/dotfiles

{
	"layer": "top",
	"position": "bottom",
	"height": 21,

	"modules-left": [
		"sway/workspaces",
		"custom/arrow-workspaces",
	],

	"modules-center": [
		"sway/window",
		"sway/mode",
	],

	"modules-right": [
		"custom/arrow-pulse",
		"pulseaudio",
HOST_EULER(`
		"custom/arrow-clock-date-from-pulse",
',`
		"custom/arrow-network",
		"network",
		"custom/arrow-backlight",
		"backlight",
		"custom/arrow-battery",
		"battery",
		"custom/arrow-clock-date",
')
		"tray",
		"clock#date",
		"custom/arrow-clock-time",
		"clock#time"
	],

	"backlight": {
		"device": "intel_backlight",
		"format": "{icon} {percent}%",
		"format-icons": ["", ""]
	},

	"battery": {
		"interval": 1,
		"states": {
			"warning": 30,
			"critical": 15
		},
		"format": " {capacity}%", // Icon: bolt
		"format-discharging": "{icon} {capacity}%",
		"format-icons": [
			"", // Icon: battery-full
			"", // Icon: battery-three-quarters
			"", // Icon: battery-half
			"", // Icon: battery-quarter
			""  // Icon: battery-empty
		],
		"tooltip": false
	},

	"clock#time": {
		"timezone": "",
		"interval": 1,
		"format": "{:%I:%M}",
		"tooltip-format": "{:%H:%M:%S}",
		"tooltip": true
	},

	"clock#date": {
		"interval": 20,
		"format": "{:%e %b}", // Icon: calendar-alt
		"tooltip-format": "{:%A %e %B %Y}",
		"tooltip": true
	},

	"network": {
		"interval": 5,
		"format-wifi": " {essid}", // Icon: wifi
		"tooltip-format-wifi": "{ipaddr} ({signalStrength}%)",
		"format-ethernet": " {ifname}",
		"format-disconnected": "Offline",
		"format-disabled": "",
		"tooltip": true,
	},

	"pulseaudio": {
		"scroll-step": 1,
		"format": "{icon} {volume}%",
		"format-bluetooth": "{icon} {volume}%",
		"format-muted": " {volume}%",
		"format-icons": {
			"headphones": "",
			"handsfree": "",
			"headset": "",
			"phone": "",
			"portable": "",
			"car": "",
			"default": ["", ""]
		},
	},

	"sway/mode": {
		"format": "<span style=\"italic\">{}</span>", // Icon: expand-arrows-alt
		"tooltip": false
	},

	"sway/window": {
		"format": "{}",
		"max-length": 80,
		"tooltip": false
	},

	"sway/workspaces": {
		"all-outputs": false,
		"disable-scroll": false,
		"format": "{value}",
	},

	"tray": {
		"icon-size": 21
		//"spacing": 10
	},

	"custom/arrow-pulse":      {"format": "", "tooltip": false},
	"custom/arrow-network":    {"format": "", "tooltip": false},
	"custom/arrow-backlight":  {"format": "", "tooltip": false},
	"custom/arrow-battery":    {"format": "", "tooltip": false},
	"custom/arrow-clock-date": {"format": "", "tooltip": false},
	"custom/arrow-clock-date-from-pulse": {"format": "", "tooltip": false},
	"custom/arrow-clock-time": {"format": "", "tooltip": false},

	"custom/arrow-workspaces": {"format": "", "tooltip": false},
}
