return {
	"folke/trouble.nvim",
	event = { "LspAttach" },
	config = function()
		local trouble = require("trouble")

    -- stylua: ignore start

    -- Trouble Project
    vim.keymap.set("n", "<leader>tp", function() trouble.toggle("workspace_diagnostics") end, { desc = "[T]rouble [P]roject" })
    -- Trouble File
    vim.keymap.set("n", "<leader>tf", function() trouble.toggle("document_diagnostics") end, {desc = "[T]rouble [F]ile"})
    -- Next error
    vim.keymap.set("n", "<leader>tn", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
    -- Previous error
    vim.keymap.set("n", "<leader>tp", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
	end,
}
