local helpers = require 'utils.helpers'

local CS = {}

CS.format_query = function(query_table) return table.concat(query_table, '+') end

CS.format_curl = function(language, query) return 'curl -s cheat.sh/' .. language .. '/' .. query .. '?T' end

CS.get_props_from_cmd_args = function(cmd_args)
  local fargs = cmd_args.fargs
  local filetype = table.remove(fargs, 1)
  local language = table.remove(fargs, 1)
  return { filetype = filetype, language = language, query = fargs }
end

CS.generate_buffer_cheatsheet = function(language, query_table, filetype)
  local query = CS.format_query(query_table)
  local curl = CS.format_curl(language, query)
  helpers.curl_to_temp_buffer(curl, filetype)
end

-- Setting usercmd
vim.api.nvim_create_user_command('CheatSheet', function(args)
  local props = CS.get_props_from_cmd_args(args)
  CS.generate_buffer_cheatsheet(props.language, props.query, props.filetype)
end, { nargs = '*', bang = true })

-- structure: filetype key query or -filetype_key query
vim.keymap.set('n', '<leader>ch', ':CheatSheet ', { desc = '[c][h]eat.sh freeform buffer' })
vim.keymap.set('n', '<leader>js', ':CheatSheet javascript js function ', { desc = '[j]ava[s]cript cheat.sh buffer' })
vim.keymap.set('n', '<leader>jx', ':CheatSheet jsx js react ', { desc = '[j]ava[s]cript react cheat.sh buffer' })
vim.keymap.set('n', '<leader>ts', ':CheatSheet typescript js typescript ', { desc = '[t]ype[s]cript cheat.sh buffer' })
vim.keymap.set('n', '<leader>lu', ':CheatSheet lua lua ', { desc = '[lu]a cheat.sh buffer' })

return CS
