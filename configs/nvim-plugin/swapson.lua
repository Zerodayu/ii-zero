return {
	"Senal-D-A-Gunaratna/swapson.nvim",
	dependencies = {
		"mason-org/mason.nvim",
	},
	opts = {
		max_concurrent_installers = 1,
		npm = {
			enabled = true,
			tool = "bun",
			patch_version_lookup = true,
		},
		pip = {
			enabled = true,
			tool = "uv",
		},
	},
}
