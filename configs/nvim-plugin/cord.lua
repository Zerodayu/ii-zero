return {
	"vyfor/cord.nvim",
	opts = {
		editor = {
			client = "lazyvim",
		},
		display = {
			view = "full",
			theme = "catppuccin",
			flavor = "accent",
		},
		advanced = {
			discord = {
				reconnect = {
					enabled = true,
				},
			},
		},
		text = {
			workspace = "", -- drop the workspace line, keep just the file line
			games = function() end, -- returning nil behaves like ''
		},
	},
}
