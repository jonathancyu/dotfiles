-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = vim.opt

-- Auto reload files when changed
vim.o.autoread = true

-- python provider fix
vim.g.python3_host_prog = "$HOME/.config/nvim/neovimenv/bin/python3"

-- fix colors
opt.termguicolors = true

-- folding
opt.foldcolumn = "0"
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
opt.clipboard = "unnamedplus"

-- Better indent
opt.smartindent = true
opt.breakindent = true

-- Smart delete
opt.backspace = "indent,eol,start"

-- Show tabs/whitespace
opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

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
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"

-- Split normally
opt.splitbelow = true
opt.splitright = true

-- Colors
opt.termguicolors = true
opt.colorcolumn = "120"

-- Disable mouse interaction
-- opt.mouse = ''

-- Other
opt.updatetime = 250

-- Associate sfdt files with json
vim.filetype.add({
  extension = {
    sfdt = "json",
  },
})
-- vscode
if vim.g.vscode then
  vim.o.cmdheight = 4
  vim.o.hlsearch = false
  -- Workaround for vscode-neovim UI desync (issue #2117)

  -- 1. Redraw on CursorHold (idle for some time)
  local redraw_fix = vim.api.nvim_create_augroup("VSCodeRedrawFix", { clear = true })
  vim.api.nvim_create_autocmd("CursorHold", {
    group = redraw_fix,
    callback = function()
      vim.cmd("silent! mode") -- triggers a lightweight redraw
    end,
  })

  -- 2. Redraw immediately after text changes (e.g., visual delete)
  local redraw_group = vim.api.nvim_create_augroup("RedrawOnDelete", { clear = true })
  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    group = redraw_group,
    callback = function()
      if vim.fn.mode() == "n" then
        vim.cmd("silent! mode") -- refresh UI after delete/insert
      end
    end,
  })
  vim.o.incsearch = false
end
