return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		-- This is where all the LSP shenanigans will live
		local lsp_zero = require("lsp-zero")
		lsp_zero.extend_lspconfig()

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			--lsp_zero.default_keymaps({ buffer = bufnr })
			local opts = { noremap = true, silent = true, buffer = bufnr }

      -- stylua: ignore start
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "J", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vs", function() vim.lsp.buf.worspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
			-- stylua: ignore end
		end)

		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				lsp_zero.default_setup,
				lua_ls = function()
					-- (Optional) Configure lua language server for neovim
					local lua_opts = lsp_zero.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				tsserver = function()
					local lspconfig = require("lspconfig")
					lspconfig.tsserver.setup({
						cmd = { "typescript-language-server", "--stdio" },
						settings = {
							-- Disable the JSDoc type hint
							diagnostics = { ignoredCodes = { 80004 } },
						},
					})
				end,
			},
		})
	end,
}
