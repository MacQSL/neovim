--local helpers = require('theprimeagen.helpers')

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gj", "<cmd>diffget //3<CR>")

local ThePrimeagen_Fugitive = vim.api.nvim_create_augroup("ThePrimeagen_Fugitive", { clear = true })
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWinEnter", {
    group = ThePrimeagen_Fugitive,
    pattern = "*",
    callback = function()
        -- set the default branch information on buffer open
        --helpers.statusline.git()
        if vim.bo.ft ~= "fugitive" then
            return
        end
        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git('push')
        end, opts)


        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({'pull',  '--rebase'})
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})

return {
  "tpope/vim-fugitive",
}


--autocmd("User", {
--    group = ThePrimeagen_Fugitive,
--    pattern = "FugitiveChanged",
--    callback = function()
--     helpers.statusline.git()
--    end,
--})
