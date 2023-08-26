return {
  "theprimeagen/harpoon",
  keys = function()
    local ui = require("harpoon.ui")
    local helpers = require("utils.helpers")

    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "[h]arpoon menu" })
    vim.keymap.set("n", "<leader>a", function() helpers.harpoon_file() end, { desc = "[a]dd harpootn" })
  end
}
