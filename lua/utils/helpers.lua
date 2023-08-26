
local module = {}

module.harpoon_file = function()
local mark = require("harpoon.mark")
local action_state = require("telescope.actions.state")
  local state = action_state.get_selected_entry()
  local buf = vim.bo.ft
  print('🔱')
  if buf == 'TelescopePrompt' then
    mark.add_file(state.value)
  else
    mark.add_file()
  end
end

return module
