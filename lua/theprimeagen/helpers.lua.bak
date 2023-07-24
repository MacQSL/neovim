local mark = require('harpoon.mark')
local actions = require('telescope.actions')
local action_state = require("telescope.actions.state")

M = {
  statusline = {},
  harpoon = {},
  telescope = {}
}

-- setting global variables to prevent unnecesary load
M.statusline.git = function()
  local git_branch = vim.fn.system("git symbolic-ref --short HEAD | tr -d '\n'")
  local git_staged = vim.fn.system("git status -s | egrep '^[MARCD]' | wc -l | tr -d '\n'")
  local git_modified = vim.fn.system("git status -s | egrep '^ [MARCD]' | wc -l | tr -d '\n'")
  local git_formatted = vim.fn.system('git rev-parse --is-inside-work-tree | tr -d "\n"') == 'true'
  and '['..git_branch..':'..git_staged..':'..git_modified..']' or ''
  vim.g.sl_git = git_formatted
end

M.statusline.harpoon = function()
  local h = mark.get_length() > 0 and '[H:'..mark.get_length()..'] ' or ''
  vim.g.sl_harpoon = h
end

M.statusline.init = function()
  M.statusline.git()
  M.statusline.harpoon()
end

M.harpoon.if_prompt = function(defaultCmd)
  local state = action_state.get_selected_entry()
  local buf = vim.bo.ft
    print('🔱')
    if buf == 'TelescopePrompt' then
      mark.add_file(state.value)
    else defaultCmd()
    end
end

M.telescope.harpoon_telescope_selection = function(prompt_bufnr)
  print('dug')
  actions.select_default(prompt_bufnr)
  M.harpoon.if_prompt(mark.add_file)
end

M.telescope.alt_enter_map = { ["<A-CR>"] = M.telescope.harpoon_telescope_selection }

M.telescope.mappings = {
  mappings = {
    i = M.telescope.alt_enter_map,
    n = M.telescope.alt_enter_map,
  },
}



return M
