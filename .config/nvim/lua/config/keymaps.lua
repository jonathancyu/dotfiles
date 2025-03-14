-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Better jk
vim.keymap.set("n", "j", function()
  return vim.v.count == 0 and "gj" or "j"
end, { noremap = true, expr = true })

vim.keymap.set("n", "k", function()
  return vim.v.count == 0 and "gk" or "k"
end, { noremap = true, expr = true })

-- Quickfix/error stuff
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open [E]rror" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Add to [Q]uickfixes" })

-- Escape clears search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Add line below to current line without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- C-d and C-u (page up/down) keep cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep cursor in the center when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Easy close buffer
vim.keymap.set("n", "<C-c>", "<C-w>c")
vim.keymap.set("i", "<C-c>", "<Esc><C-w>c")

-- Map arrow keys to navigate cmp so I can fn + jk
vim.keymap.set("i", "<Up>", "<C-p>")
vim.keymap.set("i", "<Down>", "<C-n>")

vim.keymap.set("n", "<C-S-h>", "<cmd>vertical resize -5<cr>")
vim.keymap.set("n", "<C-S-l>", "<cmd>vertical resize +5<cr>")
vim.keymap.set("n", "<C-S-j>", "<cmd>horizontal resize -5<cr>")
vim.keymap.set("n", "<C-S-k>", "<cmd>horizontal resize +5<cr>")

-- Autocmd to resize when size changes
vim.api.nvim_command("autocmd VimResized * wincmd =")

-- Unbind Q, move macro to <leader>q
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>q", "q", { desc = "Record Macro" })
vim.keymap.set("n", "q", "<nop>")

-- Paste without overwriting register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste" })

--  More reasonable toggle fold
vim.keymap.set("n", "zt", "za", { desc = "[T]oggle fold under cursor" })

-- Don't deselect when adjusting indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Write before entering cmd
vim.keymap.set("n", "ZZ", "<cmd>wqa!<cr>")

-- Mouse forward/back
-- TODO: doesn't work
