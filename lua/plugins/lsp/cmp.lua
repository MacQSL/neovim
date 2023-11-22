return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",

	dependencies = {
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "L3MON4D3/LuaSnip" },
	},
	config = function()
		-- Here is where you configure the autocompletion settings.
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_cmp()

		-- And you can configure cmp even more, if you want to.

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({
			formatting = lsp_zero.cmp_format(),
			experimental = {
				ghost_text = true,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-l>"] = cmp_action.luasnip_jump_forward(),
				["<C-h>"] = cmp_action.luasnip_jump_backward(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
