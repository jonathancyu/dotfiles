-- Tab configuration
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Word wrap and view options
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- File system
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/.undodir"
vim.opt.isfname:append("@-@")


-- Search configuration
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colors
vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"

-- Disable mouse interaction
vim.opt.mouse = ""

-- Other
vim.opt.updatetime = 250
