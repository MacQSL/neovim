local pickers = require('telescope.pickers');
local finders = require('telescope.finders');
local conf = require('telescope.config').values;
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
local options = {
  prompt_title = "select language",
  preview_title = "Previous Cheat Sheet",
  finder = finders.new_table {
    results = {
      "typescript", "react", "lua"
    },
    entry_maker = function(entry)
      return {
        value = entry,
        display = entry,
        ordinal = entry,
        path = "/home/mac/.config/nvim/lua/custom_plugins/cheat.txt"
      }
    end,
  },
  layout_config = {
    preview_width = 0.75,
  },
}

local select_language = function(opts, callback_picker)
  opts = opts or {}
  pickers.new(opts, {
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        if callback_picker ~= nil and selection ~= nil then
          actions.close(prompt_bufnr)
          callback_picker(opts, selection[1])
        end
      end)
      return true
    end,
  }):find()
end

local select_query = function(opts, language)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "type query",
    preview_title = "Cheat Sheet",
    finder = finders.new_table {},
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        local query = action_state.get_current_picker(prompt_bufnr):_get_prompt()
        print(language)
        print(query)
      end)
      return true
    end,
  }):find()
end

select_language(options, select_query)
