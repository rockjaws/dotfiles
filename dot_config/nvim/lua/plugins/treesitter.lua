return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	init = function()
		vim.env.CC = "gcc"
	end,
	opts = {
		ensure_installed = {
			"typescript",
			"javascript",
			"c_sharp",
			"zig",
			"go",
			"lua",
			"tsx",
			"vim",
			"vimdoc",
			"query",
		},
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
