local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local neovimGroup = augroup('NeovimGroup', { clear = true })
local userConfigGroup = augroup('userconfig', { clear = true })

autocmd('TextYankPost', {
  group = neovimGroup,
  desc = 'quickly highlights yanked text',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 50,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = neovimGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

--autocmd({ "BufWritePre" }, {
--  group = neovimGroup,
--  desc = "format on save",
--  pattern = "*",
--  callback = function()
--    vim.lsp.buf.format()
--  end
--})

autocmd({ 'BufWinEnter' }, {
  group = userConfigGroup,
  desc = 'return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv zz',
})
