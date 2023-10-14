return {
	"stevearc/oil.nvim",
	opts = {
		float = {
			padding = 4,
			max_width = 40,
			max_height = 20,
		},
	},
	keys = function()
		local oil = require("oil")
		vim.keymap.set("n", "<leader>pe", function()
			oil.toggle_float()
		end, { desc = "[p]roject [e]dit" })
	end,
}
