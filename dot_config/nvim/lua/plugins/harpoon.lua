return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)
		vim.keymap.set("n", "<C-p>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():next()
		end)
		vim.keymap.set("n", "<leader>fl", function()
			local file_paths = {}
			for _, item in ipairs(harpoon:list().items) do
				table.insert(file_paths, item.value)
			end
			require("fzf-lua").fzf_exec(file_paths, {
				prompt = "Working List> ",
				fzf_opts = { ["--layout"] = "reverse" },
				actions = {
					["default"] = function(selected)
						if selected and selected[1] then
							vim.cmd("edit " .. selected[1])
						end
					end,
				},
			})
		end, { desc = "Open harpoon window" })
	end,
}
