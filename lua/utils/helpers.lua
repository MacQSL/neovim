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

-- local query = string_query:gsub("% ", "+")
-- local curl = "! curl cheat.sh/" .. language .. "/" .. query.."/T"
-- vim.cmd("read "..curl)

--module.cheat_sheet.format_query("a b c")
--module.cheat_sheet.format_curl("js", "a b c")
--module.create_temp_buffer()

return helpers
