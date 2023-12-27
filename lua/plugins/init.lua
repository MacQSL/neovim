local plugins = {
	{
		"windwp/nvim-autopairs",
		event = { "LspAttach" },
		opts = {
			enable_check_bracket_line = false,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%{%$]]=],
		},
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "LspAttach" },
		opts = {},
	},
	{
		"chentoast/marks.nvim",
		opts = {},
		keys = "m",
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	{
		"kkoomen/vim-doge",
		build = ":call doge#install()",
		config = function()
			vim.g.doge_mapping_comment_jump_forward = "<C-l>"
			vim.g.doge_mapping_comment_jump_backward = "<C-h>"
		end,
	},
	{
		"vim-test/vim-test",
		config = function()
			vim.keymap.set("n", "<leader>tt", ":TestNearest <CR>")
			vim.keymap.set("n", "<leader>ta", ":TestFile <CR>")
			vim.keymap.set("n", "<leader>ts", ":TestSuite <CR>")
			vim.keymap.set("n", "<leader>tl", ":TestLast <CR>")
		end,
	},
	{ "nvim-focus/focus.nvim", version = "*", opts = {
		ui = {
			signcolumn = false,
		},
	} },
}

return plugins
