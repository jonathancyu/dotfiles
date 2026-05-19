return {
  "esmuellert/vscode-diff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  keys = {
    { "\\", "<cmd>CodeDiff<cr>", desc = "CodeDiff" },
  },
  opts = {
    keymaps = {
      view = {
        next_hunk = "<M-j>",
        prev_hunk = "<M-k>",
        next_file = "<M-l>",
        prev_file = "<M-h>",
      },
    },
  },
}
