-- TODO: single click navigation
-- https://github.com/nvim-tree/nvim-tree.lua/issues/731
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    -- Don't brick tree when restoring session
    auto_restore_session_experimental = true,
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
    },
    filesystem = {
      filtered_items = {
        hide_gitignored = false,
        hide_dotfiles = false,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
    window = {
      mappings = {
        ["Z"] = "expand_all_nodes",
        ["\\"] = "close_window",
      },
    },
    default_component_configs = {
      file_size = {
        enabled = false,
      },
    },
  },
  keys = {
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>ge", false },
    { "<leader>be", false },
    {
      "<leader>\\",
      function()
        vim.cmd("Neotree close")
      end,
      desc = "Reveal neoTree",
    },
    {
      "\\",
      function()
        vim.cmd("Neotree reveal")
      end,
      desc = "Reveal neoTree",
    },
  },
}
