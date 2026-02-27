return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"folke/tokyonight.nvim",
		"ellisonleao/gruvbox.nvim",
	},
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
				{ name = "Gruvbox Dark", colorscheme = "gruvbox" },
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Theme switcher" })
	end,
}
