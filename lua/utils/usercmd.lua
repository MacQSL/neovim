local user_cmd = vim.api.nvim_create_user_command

user_cmd('Vimconfig', function() vim.cmd 'vs ~/.config/nvim/lua/plugins/init.lua' end, { bang = true })

user_cmd('Term', function(args)
  -- default to pane 0 for commands
  local pane = 0

  if type(tonumber(args.fargs[1])) == 'number' then
    pane = table.remove(args.fargs, 1)
  end

  -- grab all commands after pane index OR all commands after Term command
  local cmd = table.concat(args.fargs, ' ')

  -- select the pane, so the content is shown in the tmux session picker
  if pane ~= nil then
    vim.cmd('silent ! tmux selectp -t term.' .. pane)
  end

  -- send the command to the selected pane
  if cmd ~= '' then
    vim.cmd('silent ! tmux send-keys -t term.' .. pane .. " '" .. cmd .. "' ENTER")
  end
end, { nargs = '*' })
