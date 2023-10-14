vim.g.mapleader = " "

require("utils.set")
require("utils.remap")
require("utils.autocmd")
require("utils.helpers")

-- custom util plugins
require("custom-plugins.cheatsheet")
require("custom-plugins.notes")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup('plugins')
