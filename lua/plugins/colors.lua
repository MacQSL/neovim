return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme('catppuccin')
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.cmd.hi('Comment gui=none')
  end,
}
