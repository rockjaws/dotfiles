return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"folke/tokyonight.nvim",
		"ellisonleao/gruvbox.nvim",
		"Shatur/neovim-ayu",
	},
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
				{ name = "Gruvbox Dark", colorscheme = "gruvbox" },
				{ name = "Ayu Mirage", colorscheme = "ayu-mirage" },
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Theme switcher" })
	end,
}
