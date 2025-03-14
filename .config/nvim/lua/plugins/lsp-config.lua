return {
  "neovim/nvim-lspconfig",
  opts = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- Replace lazyvim code action
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] =
      { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
  end,
}
