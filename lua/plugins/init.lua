local plugins = {
  -- {
  --   'windwp/nvim-autopairs',
  --   event = { 'LspAttach' },
  --   opts = {
  --     enable_check_bracket_line = false,
  --     ignored_next_char = [=[[%w%%%'%[%"%.%`%{%$]]=],
  --   },
  -- },
  { 'windwp/nvim-ts-autotag', event = { 'LspAttach' }, opts = {} },
  -- { 'chentoast/marks.nvim', opts = {}, keys = 'm' },
  { 'numToStr/Comment.nvim', event = { 'LspAttach' }, opts = {} },
  {
    'kkoomen/vim-doge',
    event = 'VeryLazy',
    build = ':call doge#install()',
    config = function()
      vim.g.doge_mapping_comment_jump_forward = '<C-l>'
      vim.g.doge_mapping_comment_jump_backward = '<C-h>'
    end,
  },
  {
    'nvim-focus/focus.nvim',
    event = { 'VeryLazy' },
    version = '*',
    opts = {
      ui = {
        signcolumn = false,
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  -- {
  --   'nvim-tree/nvim-web-devicons',
  --   opts = {
  --     override = {
  --       ['.dockerignore'] = {
  --         icon = 'd',
  --         color = '#458ee6',
  --         cterm_color = '68',
  --         name = 'Dockerfile',
  --       },
  --       ['Dockerfile'] = {
  --         icon = 'd',
  --         color = '#458ee6',
  --         cterm_color = '68',
  --         name = 'Dockerfile',
  --       },
  --       ['docker-compose.yml'] = {
  --         icon = 'd',
  --         color = '#458ee6',
  --         cterm_color = '68',
  --         name = 'Dockerfile',
  --       },
  --     },
  --   },
  -- },
}

return plugins
