
--changes current window
--cycles currently open windows
vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>o", "<C-w>o")

--project view: displays vim file tree
vim.keymap.set("n", "<leader>pv", "<cmd>Lexplore <CR>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

--moves selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--down/up half page and centers cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--search and replace word in file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--traverse found searches up / down
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
