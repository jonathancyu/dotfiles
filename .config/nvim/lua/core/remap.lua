vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Open diagnostic [E]rror messages' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfist list' })

-- Escape clears search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move selection up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Add line below to current line without moving cursor
vim.keymap.set('n', 'J', 'mzJ`z')

-- C-d and C-u (page up/down) keep cursor in the center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Keep cursor in the center when searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Easy pane navigation
vim.keymap.set('n', '<C-c>', '<C-w>c')
vim.keymap.set('i', '<C-c>', '<Esc><C-w>c')

-- Map arrow keys to navigate cmp so I can fn + jk
vim.keymap.set('i', '<Up>', '<C-p>')
vim.keymap.set('i', '<Down>', '<C-n>')

--[[
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("i", "<C-h>", "<Esc><C-w>h")
vim.keymap.set("i", "<C-j>", "<Esc><C-w>j")
vim.keymap.set("i", "<C-k>", "<Esc><C-w>k")
vim.keymap.set("i", "<C-l>", "<Esc><C-w>l")
]]

-- Easy home/end
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')

-- Unbind Q
vim.keymap.set('n', 'Q', '<nop>')

-- Paste without overwriting register
vim.keymap.set('x', '<leader>p', [["_dP]])
