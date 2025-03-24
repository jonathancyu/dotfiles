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
      { "<leader>fm", false },
      { "<leader>fM", false },
      {
        "<S-h>",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
    },
    config = function(opts)
      vim.keymap.del("n", "H") -- Disable lazyvim H
      require("mini.files").setup(opts)
      local set_mark = function(id, path, desc)
        MiniFiles.set_bookmark(id, path, { desc = desc })
      end
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesExplorerOpen",
        callback = function()
          set_mark("c", vim.fn.stdpath("config"), "Config") -- path
          set_mark("w", vim.fn.getcwd, "Working directory") -- callable
          set_mark("~", "~", "Home directory")
        end,
      })
    end,
  },
}
