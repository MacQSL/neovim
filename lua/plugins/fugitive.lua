vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>")

return {
  "tpope/vim-fugitive",
}
