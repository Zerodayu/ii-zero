-- lua/plugins/colorscheme.lua
return {
	{
		"Zerodayu/zen-material.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			palette_path = "~/.config/matugen/templates/nvim/nvim-colors.json",
		},
	},
}
