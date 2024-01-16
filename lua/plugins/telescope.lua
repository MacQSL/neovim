return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"theprimeagen/harpoon",
		-- {
		-- 	"nvim-telescope/telescope-fzf-native.nvim",
		-- 	build = "make",
		-- 	cond = function()
		-- 		return vim.fn.executable("make") == 1
		-- 	end,
		-- },
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = "move_selection_previous",
					["<C-j>"] = "move_selection_next",
				},
			},
		},
		pickers = {
			live_grep = {
				file_ignore_patterns = { "node_modules", ".git", "package-lock.json" },
				additional_args = function(_)
					return { "--hidden" }
				end,
			},
			find_files = {
				file_ignore_patterns = { "node_modules", ".git", "package-lock.json" },
				hidden = true,
			},
		},
	},
	keys = function()
		local builtin = require("telescope.builtin")

		-- project actions
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[p]roject [f]iles" })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "[p]roject [s]earch string" })
		vim.keymap.set("n", "<leader>pw", builtin.grep_string, { desc = "[p]roject [w]ord search" })

		--vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "[p]roject [b]uffers" })
		vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "[p]roject [g]it files" })
		vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "[p]roject [k]ey maps" })
		vim.keymap.set("n", "<leader>ph", function()
			builtin.oldfiles({ prompt_title = "History" })
		end, { desc = "[p]roject [h]istory" })

		-- file/document actions
		--vim.keymap.set('n', '<leader>fn', builtin.treesitter, { desc = "[f]ile fu[n]ctions" })
		--vim.keymap.set('n', '<leader>fv', builtin.lsp_document_symbols, { desc = "[f]ile [v]ariables" })

		-- git actions
		--vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "[g]it [b]ranches" })
	end,
}
