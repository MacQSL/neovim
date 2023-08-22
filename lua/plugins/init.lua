local plugins = {
  "nvim-treesitter/playground",
  'nvim-treesitter/nvim-treesitter-context',
  { 'MunifTanjim/prettier.nvim', opts = { bin = 'prettierd' } },
  { "windwp/nvim-autopairs",     opts = { enable_check_bracket_line = false } },
  { "windwp/nvim-ts-autotag",    opts = { enable_close_on_slash = false } },
  --{
  --  'akinsho/toggleterm.nvim',
  --  opts = {
  --    open_mapping = [[<C-t>]],
  --    direction = 'float',
  --  },
  --  version = "*"
  --},
}

return plugins
