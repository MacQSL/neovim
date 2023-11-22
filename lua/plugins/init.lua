local plugins = {
	--"nvim-treesitter/playground",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = false,
			ignored_next_char = [=[[%w%%%'%[%"%.%`%{%$]]=],
		},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
	},
	{
		"chentoast/marks.nvim",
		opts = {},
		event = "InsertEnter",
		keys = "m",
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}

return plugins
