--cycles currently open windows
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "change [w]indow" })

--changes windows with vim movement controls
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "change [w]indow left" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "change [w]indow down" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "change [w]indow up" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "change [w]indow right" })

--closes all other windows
vim.keymap.set("n", "<leader>o", "<C-w>o", { desc = "close [o]ther windows" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

--moves selected text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected text up" })

--on yank keeps the cursor position
--check here if weird yank issue's occur
vim.keymap.set("v", "y", "ygv<Esc>", { desc = "better cusor position on yank" })

--down/up half page and centers cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

--search and replace word in file
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--traverse found searches up / down
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
