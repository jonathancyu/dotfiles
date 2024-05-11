local opt = vim.opt
-- Tab configuration
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Use system clipboard
opt.clipboard = 'unnamedplus'

-- Smart indent
opt.smartindent = true

-- Smart delete
opt.backspace = "indent,eol,start"

-- Line numbers
opt.nu = true
opt.relativenumber = true
opt.cursorline = true

-- Word wrap and view options
opt.wrap = false
opt.scrolloff = 8

-- File system
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/.undodir"
opt.isfname:append("@-@")


-- Search configuration
opt.hlsearch = false
opt.incsearch = true

-- Split normally
opt.splitbelow = true
opt.splitright = true

-- Colors
opt.termguicolors = true
opt.colorcolumn = "120"

-- Disable mouse interaction
-- opt.mouse = ""

-- Better netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro nocursorline'

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Other
opt.updatetime = 250

