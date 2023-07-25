--local helpers = require('theprimeagen.helpers')
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 15

--vim.opt.guicursor = "n-v-sm:block,i-ci:ver25,r-cr-o:hor20"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

--helpers.statusline.init()
--vim.opt.statusline = '%{g:sl_git} %<%t'..'%h%m%r%=%-14.(%l,%c%V%)'..'%P'
vim.opt.laststatus = 3






















