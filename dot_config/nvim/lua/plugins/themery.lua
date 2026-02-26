return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"folke/tokyonight.nvim",
		"idr4n/andromeda.nvim",
	},
	config = function()
		require("themery").setup({
			themes = {
				"tokyonight",
				"andromeda",
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Theme switcher" })
	end,
}
