return {
	"folke/trouble.nvim",
	event = { "LspAttach" },
	config = function()
		local trouble = require("trouble")

    -- stylua: ignore start
    -- Trouble Project
    vim.keymap.set("n", "<leader>tp", "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    -- Trouble File
    vim.keymap.set("n", "<leader>tf", "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    vim.keymap.set("n", "<leader>T", function ()
      trouble.next({ skip_groups = true, jump = true })
    end,
      { silent = true, noremap = true }
    )
		-- stylua: ignore end
	end,
}
