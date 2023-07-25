return {
  "theprimeagen/harpoon",
  config = function()
    local ui = require("harpoon.ui")
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(3) end)
  end
}

-- can harpoon file from telescope and working file

--vim.keymap.set("n", "<leader>a", function()
--  helpers.harpoon.if_prompt(mark.add_file)
--end)
