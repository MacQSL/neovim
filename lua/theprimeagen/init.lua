require("theprimeagen.set")
require("theprimeagen.remap")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', { clear = true})


function R(name)
    require("plenary.reload").reload_module(name)
end

local function netrw_mapping()
  local bufmap = function(lhs, rhs)
    local opts = {buffer = true, remap = true}
    vim.keymap.set('n', lhs, rhs, opts)
  end
  bufmap('<C-l>', '<C-w>l')
end

autocmd('FileType', {
  pattern = 'netrw',
  group = ThePrimeagenGroup,
  desc = 'Keybindings for netrw',
  callback = netrw_mapping
})

autocmd('TextYankPost', {
    group = ThePrimeagenGroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})



vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 15
