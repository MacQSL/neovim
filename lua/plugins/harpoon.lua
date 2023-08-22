return {
  "theprimeagen/harpoon",
  keys = function()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")
    local action_state = require("telescope.actions.state")

    local if_prompt_open = function(defaultCmd)
      local state = action_state.get_selected_entry()
      local buf = vim.bo.ft
      print('🔱')
      if buf == 'TelescopePrompt' then
        mark.add_file(state.value)
      else
        defaultCmd()
      end
    end

    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>a", function() if_prompt_open(mark.add_file) end)

  end
}


