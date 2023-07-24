local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local TheGroup = augroup('NeovimGroup', { clear = true})

local function netrw_mapping()
  local bufmap = function(lhs, rhs)
    local opts = {buffer = true, remap = true}
    vim.keymap.set('n', lhs, rhs, opts)
  end
  bufmap('<C-l>', '<C-w>l')
end

autocmd('FileType', {
  pattern = 'netrw',
  group = TheGroup,
  desc = 'Keybindings for netrw',
  callback = netrw_mapping
})

autocmd('TextYankPost', {
    group = TheGroup,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
