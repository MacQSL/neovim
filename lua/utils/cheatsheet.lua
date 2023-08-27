local helpers = require("utils.helpers")

local CS = {
  -- not neeeded if filetype and language name are the same ie: lua
  language_filetypes = {
    -- this is an extenstion of the js CS
    ts = "typescript",
    react = "jsx"
  }
}

-- expects str_query="a b c"
CS.format_query = function(query_table)
  return table.concat(query_table, "+")
end

-- expects query="a+b+c"
CS.format_curl = function(language, query)
  return "curl -s cheat.sh/" .. language .. "/" .. query .. "?T"
end

CS.format_custom_curl = function(language, query)
  local ts = CS.language_filetypes.ts
  if language == "ts" then
    return {
      curl = CS.format_curl("js", ts .. "+" .. query),
      parsed_language = ts
    }
  end
  return {
    curl = CS.format_curl(language, query),
    parsed_language = language
  }
end

CS.get_filetype = function(language)
  local diff_filetype = CS.language_filetypes[language]
  return diff_filetype and diff_filetype or language
end

CS.get_props_from_cmd_args = function(cmd_args)
  local args_array = cmd_args.fargs
  local language = args_array[1]
  table.remove(args_array, 1)
  return { language = language, query = args_array }
end

-- expects language="ts" || "js" || "lua" etc... query_array={"slice", "array"} etc...
CS.generate_buffer_cheatsheet = function(language, query_table)
  local query = CS.format_query(query_table)
  local format = CS.format_custom_curl(language, query)
  local filetype = CS.get_filetype(format.parsed_language)
  local curl_data_set_filetype = function()
    vim.cmd("read !" .. format.curl)
  end
  print(format.curl)
  helpers.create_temp_buffer(curl_data_set_filetype)
end

-- Setting autocommand and default mappings
vim.api.nvim_create_user_command("CheatSheet", function(args)
  local props = CS.get_props_from_cmd_args(args)
  CS.generate_buffer_cheatsheet(props.language, props.query)
end, { nargs = "*", bang = true })

-- --tagged used as filetype and in query
-- -tagged used only as filetype
-- js --typescript
vim.keymap.set("n", "<leader>ch", ":CheatSheet ", { desc = "[c][h]eat.sh freeform buffer" })
vim.keymap.set("n", "<leader>js", ":CheatSheet js function ", { desc = "[j]ava[s]cript cheat.sh buffer" })
vim.keymap.set("n", "<leader>jx", ":CheatSheet js -jsx react", { desc = "[j]ava[s]cript react cheat.sh buffer" })
vim.keymap.set("n", "<leader>ts", ":CheatSheet js --typescript ", { desc = "[t]ype[s]cript cheat.sh buffer" })

vim.keymap.set("n", "<leader>lu", ":CheatSheet lua ", { desc = "[lu]a cheat.sh buffer" })



return CS
