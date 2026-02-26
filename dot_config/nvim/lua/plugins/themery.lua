return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"folke/tokyonight.nvim",
		"ellisonleao/gruvbox.nvim",
		"EdenEast/nightfox.nvim",
		"catppuccin/nvim",
		"rebelot/kanagawa.nvim",
		"rose-pine/neovim",
	},
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
				{ name = "Gruvbox Dark", colorscheme = "gruvbox" },
				{ name = "Carbonfox", colorscheme = "carbonfox" },
				{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
				{ name = "Catppuccin Mocha", colorscheme = "catppuccin-mocha" },
				{ name = "Kanagawa", colorscheme = "kanagawa" },
				{ name = "Rose Pine Moon", colorscheme = "rose-pine-moon" },
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Theme switcher" })
	end,
}
