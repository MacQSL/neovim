local helpers = {}

helpers.harpoon_file = function()
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

helpers.create_temp_buffer = function(bufr_fn)
  vim.cmd("vnew")
  vim.cmd("set buftype=nofile")
  vim.cmd("set bufhidden=delete")
  if bufr_fn ~= nil then
    bufr_fn()
  end
end

helpers.print_table = function(_table)
  print(table.concat(_table, ", "))
end

return helpers
