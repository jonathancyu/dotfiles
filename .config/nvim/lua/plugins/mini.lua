return {
  {
    "echasnovski/mini.files",
    opts = {
      mappins = {
        synchronize = "<CR>",
      },
      windows = {
        max_number = 2,
        preview = true,
        width_preview = 100,
      },
    },
    keys = {
      { "<leader>fM", false },
      {
        "<leader>fM",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
    },
  },
}
