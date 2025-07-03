return {
  "sindrets/winshift.nvim",
  opts = {},
  lazy = true,
  keys = {
    { "<leader>wm", false }, -- Disable snacks mazimize
    { "<leader>wm", "<cmd>WinShift<cr>", desc = "[M]ove Window" },
  },
}
