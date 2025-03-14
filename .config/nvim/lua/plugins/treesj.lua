return {
  "Wansmer/treesj",
  keys = {
    { "<space>j", ":TSJToggle<CR>", desc = "[J]oin object (Toggle)" },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    max_join_length = 500,
    use_default_keymaps = false,
  },
}
