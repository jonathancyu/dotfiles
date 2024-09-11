vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Better jk
vim.keymap.set('n', 'j', function()
	return vim.v.count == 0 and 'gj' or 'j'
end, { noremap = true, expr = true })

vim.keymap.set('n', 'k', function()
	return vim.v.count == 0 and 'gk' or 'k'
end, { noremap = true, expr = true })

-- Quickfix/error stuff
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = 'Open [E]rror' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = 'Add to [Q]uickfixes' })

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

-- Easy close buffer
vim.keymap.set('n', '<C-c>', '<C-w>c')
vim.keymap.set('i', '<C-c>', '<Esc><C-w>c')

-- Split tab
vim.keymap.set('n', '<leader>wt', '<cmd>tab split<CR>', { desc = 'Send [W]indow to new [T]ab' })

-- Map arrow keys to navigate cmp so I can fn + jk
vim.keymap.set('i', '<Up>', '<C-p>')
vim.keymap.set('i', '<Down>', '<C-n>')

vim.keymap.set('n', '<C-S-h>', '<cmd>vertical resize -5<cr>')
vim.keymap.set('n', '<C-S-l>', '<cmd>vertical resize +5<cr>')
vim.keymap.set('n', '<C-S-j>', '<cmd>horizontal resize -5<cr>')
vim.keymap.set('n', '<C-S-k>', '<cmd>horizontal resize +5<cr>')

-- Easy home/end
vim.keymap.set({ 'n', 'v' }, 'H', '^')
vim.keymap.set({ 'n', 'v' }, 'L', '$')

-- Unbind Q
vim.keymap.set('n', 'Q', '<nop>')

-- Paste without overwriting register
vim.keymap.set('x', '<leader>p', [["_dP]])

--  More reasonable toggle fold
vim.keymap.set('n', 'zt', 'za', { desc = '[T]oggle fold under cursor' })
