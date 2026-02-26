vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.o.winborder = "rounded"
vim.opt.mousehide = true
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascriptreact", "typescriptreact" },
	callback = function()
		vim.treesitter.start()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local theme = vim.g.colors_name
		local file = io.open(os.getenv("HOME") .. "/.config/wezterm/nvim_theme", "w")
		if file then
			file:write(theme)
			file:close()
		end
	end,
})

vim.o.updatetime = 500

vim.diagnostic.config({
	float = {
		border = "rounded",
		focusable = false,
		scope = "cursor",
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "InsertLeave" },
	},
	update_in_insert = false,
})
