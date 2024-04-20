vim.g.mapleader = " "
-- pv = Project View
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Project view' })

-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Add line below to current line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- C-d and C-u (page up/down) keep cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the center when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- tmux sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Easy pane navigation
vim.keymap.set('n', '<C-c>', '<C-w>c') -- I think this might be illegal
vim.keymap.set('i', '<C-c>', '<Esc><C-w>c')

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("i", "<C-h>", "<Esc><C-w>h")
vim.keymap.set("i", "<C-j>", "<Esc><C-w>j")
vim.keymap.set("i", "<C-k>", "<Esc><C-w>k")
vim.keymap.set("i", "<C-l>", "<Esc><C-w>l")

-- Easy home/end
vim.keymap.set({'n', 'v'}, "H", "^")
vim.keymap.set({'n', 'v'}, "L", "$")

-- Unbind Q
vim.keymap.set("n", "Q", "<nop>")

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]])