local plugins = {
  'nvim-tree/nvim-web-devicons',
  "nvim-treesitter/playground",
  'nvim-treesitter/nvim-treesitter-context',
  { 'MunifTanjim/prettier.nvim', opts = { bin = 'prettierd' } },
  { "windwp/nvim-autopairs",     opts = {} },
  { "windwp/nvim-ts-autotag",    opts = {} },
  {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = {}
  }
}

return plugins
