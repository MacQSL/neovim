local plugins = {
  --"nvim-treesitter/playground",
  {
    "MunifTanjim/prettier.nvim",
    enabled = false,
    opts = { bin = "prettierd" },
    ft = { "javascript", "js", "jsx", "typescript", "ts", "tsx", "typescriptreact", "javascriptreact" }
  },
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
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,

  }
}

return plugins
