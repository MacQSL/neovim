local pickers = require('telescope.pickers');
local finders = require('telescope.finders');
local conf = require('telescope.config').values;
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
local cheat_sheet_log_path = "/home/mac/.config/nvim/lua/custom_plugins/cheat.md"
local language_opts = {
  prompt_title = "select language",
  preview_title = "Previous Cheat Sheet",
  results = { "typescript", "react" }
}

local query_opts = {
  prompt_title = "query",
  preview_title = "Cheat Sheet",
  results = { "" }
}

local shared_entry_maker = function(entry)
  return {
    value = entry,
    display = entry,
    ordinal = entry,
    path = cheat_sheet_log_path
  }
end

local custom_callback_picker = function(opts, callback_opts, callback_picker)
  opts = opts or {}
  pickers.new(opts, {
    previewer = conf.file_previewer(opts),
    layout_config = {
      preview_width = 0.75,
    },
    finder = finders.new_table {
      results = opts.results,
      entry_maker = shared_entry_maker
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        if callback_picker ~= nil and selection.value ~= nil then
          callback_picker(callback_opts, selection.value)
        end
      end)
      return true
    end,
  }):find()
end

local select_query = function(opts, language)
  opts = opts or {}
  pickers.new(opts, {
    finder = finders.new_table {
      results = opts.results,
      entry_maker = shared_entry_maker,
    },
    layout_config = {
      preview_width = 0.75,
    },
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local query = action_state.get_current_picker(prompt_bufnr):_get_prompt()
        print('curl cheat.sh/'..language..'/'..query..' >'..cheat_sheet_log_path)
        os.execute('curl cheat.sh/'..language..'/'..query..'?T > '..cheat_sheet_log_path)
      end)
      return true
    end,
  }):find()
end

custom_callback_picker(language_opts, query_opts, select_query)
