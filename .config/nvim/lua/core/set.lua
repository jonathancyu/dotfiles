local opt = vim.opt

-- fix colors
opt.termguicolors = true

-- folding
opt.foldcolumn = '0'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
-- Tab configuration
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Don't show status
opt.showmode = false

-- Use system clipboard
opt.clipboard = 'unnamedplus'

-- Better indent
opt.smartindent = true
opt.breakindent = true

-- Smart delete
opt.backspace = 'indent,eol,start'

-- Show tabs/whitespace
opt.list = true
opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }

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
opt.undodir = os.getenv('HOME') .. '/.vim/.undodir'
opt.isfname:append('@-@')

-- Search configuration
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = 'split'

-- Split normally
opt.splitbelow = true
opt.splitright = true

-- Colors
opt.termguicolors = true
opt.colorcolumn = '120'

-- Disable mouse interaction
-- opt.mouse = ''

-- Better netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro nocursorline'

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Other
opt.updatetime = 250
