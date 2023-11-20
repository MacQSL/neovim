return {
  "folke/trouble.nvim",
  event = { "LspAttach" },
  config = function()
    -- Trouble Project
    vim.keymap.set("n", "<leader>tp", "<cmd>TroubleToggle workspace_diagnostics<cr>",
      { silent = true, noremap = true }
    )
    -- Trouble File
    vim.keymap.set("n", "<leader>tf", "<cmd>TroubleToggle document_diagnostics<cr>",
      { silent = true, noremap = true }
    )
  end
}
