return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = function()
    local harpoon = require('harpoon')
    harpoon:setup()

    vim.keymap.set(
      'n',
      '<leader>h',
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = 'Open harpoon window' }
    )
    vim.keymap.set('n', '<leader>a', function() harpoon:list():append() end)
  end,
}

-- return {
--   "theprimeagen/harpoon",
--   dependencies = {
--     { "nvim-telescope/telescope.nvim" },
--   },
--   keys = function()
--     local ui = require("harpoon.ui")
--     local helpers = require("utils.helpers")
--     vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "[h]arpoon menu" })
--     vim.keymap.set("n", "<leader>a", function() helpers.harpoon_file() end, { desc = "[a]dd harpootn" })
--   end,
-- }
