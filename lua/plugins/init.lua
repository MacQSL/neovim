local plugins = {
  --"nvim-treesitter/playground",
  { "MunifTanjim/prettier.nvim", opts = { bin = "prettierd" }, ft = { "js", "jsx", "tsx", "html", "ts" } },
  {
    "windwp/nvim-autopairs",
    ft = vim.g.supported_filetypes,
    opts = {
      enable_check_bracket_line = false,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%{%$]]=],
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "jsx", "tsx" },
    opts = {}
  },
  {
    "chentoast/marks.nvim",
    opts = {},
    keys = "m"
  },
}

return plugins
