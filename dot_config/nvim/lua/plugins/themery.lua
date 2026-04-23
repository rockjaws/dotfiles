return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"folke/tokyonight.nvim",
		"ellisonleao/gruvbox.nvim",
        "sainnhe/gruvbox-material",
		"Shatur/neovim-ayu",
	},
	config = function()
		require("themery").setup({
			themes = {
				{ name = "Tokyo Night", colorscheme = "tokyonight" },
				{ name = "Gruvbox Dark", colorscheme = "gruvbox" },
                { name = "Gruvbox Dark Material", colorscheme = "gruvbox-material" },
				{ name = "Ayu Mirage", colorscheme = "ayu-mirage" },
			},
			livePreview = true,
		})
		vim.keymap.set("n", "<leader>th", "<cmd>Themery<cr>", { desc = "Theme switcher" })
	end,
}
