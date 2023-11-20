local plugins = {
  --"nvim-treesitter/playground",
  {
    "windwp/nvim-autopairs",
    event = 'InsertEnter',
    opts = {
      enable_check_bracket_line = false,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%{%$]]=],
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = 'InsertEnter',
    opts = {}
  },
  {
    "chentoast/marks.nvim",
    opts = {},
    keys = "m"
  },
  {
    'stevearc/dressing.nvim',
    enabled = false,
    opts = {},
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
  },
  {
    'numToStr/Comment.nvim',
    lazy = false,
    opts = {},

  }
}

return plugins
