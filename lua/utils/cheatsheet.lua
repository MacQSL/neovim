local helpers = require("utils.helpers")

local cheatsheet = {
  -- not neeeded if filetype and language name are the same ie: lua
  language_filetypes = {
    js = "javascript",
    -- this is an extenstion of the js cheatsheet
    ts = "typescript"
  }
}

-- expects str_query="a b c"
cheatsheet.format_query = function(str_query)
  return str_query:gsub("% ", "+")
end

-- expects query="a+b+c"
cheatsheet.format_curl = function(language, query)
  return "! curl -s cheat.sh/" .. language .. "/" .. query .. "/T"
end

cheatsheet.format_custom_curl = function(language, query)
  local ts = cheatsheet.language_filetypes.ts
  if language == "ts" then
    return {
      curl = cheatsheet.format_curl("js", ts .. "+" .. query),
      parsed_language = ts
    }
  end
  return { curl = cheatsheet.format_curl(language, query), parsed_language = language }
end

cheatsheet.get_filetype = function(language)
  local diff_filetype = cheatsheet.language_filetypes[language]
  return diff_filetype and diff_filetype or language
end

cheatsheet.populate_buffer = function(language, str_query)
  local query = cheatsheet.format_query(str_query)
  local format = cheatsheet.format_custom_curl(language, query)
  local filetype = cheatsheet.get_filetype(format.parsed_language)
  local curl_data_set_filetype = function()
    vim.cmd("read " .. format.curl .. "?T")
    vim.cmd("set filetype=" .. filetype)
  end
  helpers.create_temp_buffer(curl_data_set_filetype)
end

cheatsheet.props_from_args = function(args)

  print("called")
end

vim.api.nvim_create_user_command("Cheatsheet", cheatsheet.props_from_args, {})

cheatsheet.populate_buffer('python', 'slice')

return cheatsheet
