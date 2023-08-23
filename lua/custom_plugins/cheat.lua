local pickers = require('telescope.pickers');
local previewers = require('telescope.previewers');
local finders = require('telescope.finders');
local conf = require('telescope.config').values;
local actions = require('telescope.actions');
local action_state = require('telescope.actions.state');
local make_entry = require "telescope.make_entry"
local builtin = require('telescope.builtin')

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md

local custom_picker = function(opts)
  opts.bufnr = vim.api.nvim_get_current_buf()
  opts.winnr = vim.api.nvim_get_current_win()
  pickers.new(opts, {
    finder = finders.new_table {
      results = opts.results,
      entry_maker = make_entry.gen_from_file(opts)
    },
    previewer = conf.file_previewer(opts),
    sorter = conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        --actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local query_text = action_state.get_current_picker(prompt_bufnr):_get_prompt()
        if opts.selection_callback ~= nil and selection ~= nil then
          opts.selection_callback(selection[1])
        end
        if opts.prompt_callback ~= nil and query_text ~= nil then
          opts.prompt_callback(query_text)
        end
      end)
      return true
    end,
  }):find()
end

local cheat_sheet_main = function()
  custom_picker({
    prompt_title = "Search by Language",
    results_title = "Languages",
    title = "Previous Cheat Sheet",
    results = { "typescript", "lua", "react", "javascript", "c++" },
    layout_config = {
      preview_width = 0.75,
    },
    selection_callback = function(selection)
      local language = selection
      print(language)
      custom_picker({
        prompt_title = "Query",
        results_title = selection,
        preview_title = "Cheet Sheet Preview",
        layout_config = {
          preview_width = 0.75,
        },
        prompt_callback = function(prompt)
          local query = prompt
          print(query)
        end
      })
    end
  })
end

local opts = {
  cmd = "~/",
  prompt_title = "select language",
  preview_title = "Previous Cheat Sheet",
  results = {
    { "typescript", "test" },
    { "react",      "test" },
  },
  layout_config = {
    preview_width = 0.75,
  },
}

pickers.new(opts, {
  finder = finders.new_table {
    results = opts.results,
    entry_maker = function(entry)
      return {
        value = entry[1],
        display = entry[1],
        ordinal = entry[1],
        path = "/home/mac/cheat.txt"
      }
    end
  },
  previewer = conf.file_previewer(opts),
  sorter = conf.file_sorter(opts)
}):find()
