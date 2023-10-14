--changes current window
--cycles currently open windows
vim.keymap.set("n", "<leader>w", "<C-w>w", { desc = "change [w]indow" })
--closes all other windows
vim.keymap.set("n", "<leader>o", "<C-w>o", { desc = "close [o]ther windows" })

--project view: displays vim file tree
vim.keymap.set("n", "<leader>pv", "<cmd>Lexplore <CR>", { desc = "[p]roject view (Netrw)" })

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
