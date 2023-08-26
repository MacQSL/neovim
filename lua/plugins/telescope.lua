return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  dependencies = { { 'nvim-lua/plenary.nvim', 'adoyle-h/telescope-extension-maker.nvim' } },
  config = function()
    require("telescope").load_extension("harpoon")
    local builtin = require('telescope.builtin')

    -- project actions
    vim.keymap.set('n', '<leader>;', builtin.find_files, { desc = "find files" })
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "[p]roject [s]earch string" })
    vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "[p]roject [g]it files" })
    vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "[p]roject [b]uffers" })
    vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = "[p]roject [h]elp tags" })
    vim.keymap.set('n', '<leader>pk', builtin.keymaps, { desc = "[p]roject [k]ey maps" })

    -- file/document actions
    vim.keymap.set('n', '<leader>fn', builtin.treesitter, { desc = "[f]ile fu[n]ctions"})
    vim.keymap.set('n', '<leader>fv', builtin.lsp_document_symbols, { desc = "[f]ile [v]ariables"})

    -- git actions
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "[g]it [b]ranches"})
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "[g]it [c]ommits"})
  end
}
