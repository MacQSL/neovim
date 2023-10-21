return {
	"stevearc/oil.nvim",
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			float = {
				padding = 4,
				max_width = 40,
				max_height = 20,
			},
			keymaps = {
				["<C-v>"] = "actions.select_vsplit",
				["<C-x>"] = "actions.select_split",
			},
		})
		vim.keymap.set("n", "<leader>pe", function() oil.toggle_float() end, { desc = "[p]roject [e]dit / view" })
	end,
}
--	keys = function()
--		local oil = require("oil")
--		vim.keymap.set("n", "<leader>pe", function()
--			oil.toggle_float()
--		end, { desc = "[p]roject [e]dit" })
--	end,
