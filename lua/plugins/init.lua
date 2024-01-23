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
	{ "folke/zen-mode.nvim", opts = {} },
	{ "nvim-focus/focus.nvim", version = "*", opts = {
		ui = {
			signcolumn = false,
		},
	} },
	{ "nvim-treesitter/playground" },
	{
		"Dronakurl/injectme.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		-- This is for lazy load and more performance on startup only
		cmd = { "InjectmeToggle", "InjectmeSave", "InjectmeInfo", "InjectmeLeave" },
	},
}

return plugins
