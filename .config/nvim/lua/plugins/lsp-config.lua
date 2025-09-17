return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Chaitanyabsprip/fastaction.nvim",
      ---@type FastActionConfig
      opts = {},
    },
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- Disable prev/next reference
      keys[#keys + 1] = { "<a-n>", false }
      keys[#keys + 1] = { "<a-p>", false }
      -- Replace lazyvim code action
      keys[#keys + 1] = { "<leader>ca", false }
      keys[#keys + 1] = {
        "<M-.>",
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
  },
}
