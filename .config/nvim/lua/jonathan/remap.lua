-- pv = Project View
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Easy home/end
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

