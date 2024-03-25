return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    vim.keymap.set('n', '<leader>h', function() toggle_telescope(harpoon:list()) end, { desc = 'Open harpoon window' })
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
