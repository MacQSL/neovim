local plugins = {
	"nvim-treesitter/playground",
	{ "MunifTanjim/prettier.nvim", opts = { bin = "prettierd" } },
	{
		"windwp/nvim-autopairs",
		opts = { enable_check_bracket_line = false, ignored_next_char = [=[[%w%%%'%[%"%.%`%{%$]]=] },
	},
	{ "windwp/nvim-ts-autotag", opts = { enable_close_on_slash = false } },
}

return plugins
