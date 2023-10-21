local M = {}

M.search_cmd = "GoogleSearch"

M.launch_browser = function(args)
	local search = table.concat(args.fargs, "+")
	vim.cmd("silent ! sensible-browser www.google.com/search?q=" .. search)
end

vim.api.nvim_create_user_command(M.search_cmd, function(args)
	M.launch_browser(args)
end, { nargs = "*", bang = true })

vim.keymap.set("n", "<leader>s", ":" .. M.search_cmd .. " ", { desc = "google [s]earch" })

return M
