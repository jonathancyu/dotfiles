-- Tab configuration
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart indent
vim.opt.smartindent = true

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

-- Split normally
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Colors
vim.opt.termguicolors = true
vim.opt.colorcolumn = "120"

-- Disable mouse interaction
vim.opt.mouse = ""

-- Better netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro nocursorline'

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Other
vim.opt.updatetime = 250

