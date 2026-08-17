return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    default_file_explorer = false,
  },
  keys = {
    {
      "H",
      function()
        require("oil").open()
      end,
      desc = "Open oil file explorer",
    },
  },
}
