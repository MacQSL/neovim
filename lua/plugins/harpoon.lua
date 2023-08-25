return {
  "theprimeagen/harpoon",
  config = function()
    local ui = require("harpoon.ui")
    local helpers = require("utils.helpers")

    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>a", function() helpers.if_prompt_open() end)
  end
}
