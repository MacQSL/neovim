return {
  "tpope/vim-fugitive",
  cmd = "Git",
  keys = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>")
    vim.keymap.set("n", "<leader>gm", "<cmd>Gvdiffsplit ! <CR>")
    vim.keymap.set("n", "<leader>gp", "<cmd>Git -c push.default=current push <CR>")
  end
}
