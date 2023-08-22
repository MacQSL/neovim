vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>")
vim.keymap.set("n", "<leader>gm", "<cmd>Gvdiffsplit ! <CR>")

return {
  "tpope/vim-fugitive",
  cmd = "Git",
  keys = {
    {"n", "<leader>gs", vim.cmd.Git},
    {"n", "<leader>gf", "<cmd>diffget //2<CR>"},
    {"n", "<leader>gj", "<cmd>diffget //3<CR>"},
    {"n", "<leader>gm", "<cmd>Gvdiffsplit ! <CR>"}
  }
}
