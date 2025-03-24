return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "Chaitanyabsprip/fastaction.nvim",
    ---@type FastActionConfig
    opts = {},
  },
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- Replace lazyvim code action
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = {
      "<leader>a",
      function()
        require("fastaction").code_action()
      end,
      desc = "Code Action",
      mode = { "n", "v" },
      has = "codeAction",
    }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
  end,
}
