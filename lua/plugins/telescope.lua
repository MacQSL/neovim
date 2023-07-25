return{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      local builtin = require('telescope.builtin')
     -- local helpers = require("theprimeagen.helpers")
     -- require "telescope".setup {
     --   pickers = {
     --     find_files = helpers.telescope.mappings
     --   },
     -- }
      vim.keymap.set('n', '<leader>;', builtin.find_files, {})
      vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

      vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>pb', builtin.buffers, {})

      vim.keymap.set('n', '<leader>H', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})

      -- dope!
      vim.keymap.set('n', '<leader>fn', builtin.treesitter, {})
          end
  }
