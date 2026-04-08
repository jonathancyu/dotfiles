return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "Chaitanyabsprip/fastaction.nvim",
      ---@type FastActionConfig
      opts = {},
    },
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers = {
        ["*"] = {
          keys = {
            -- Disable prev/next reference
            { "<a-n>", false },
            { "<a-p>", false },
            { "<leader>ca", false },
            -- Replace lazyvim code action
            {
              "<M-.>",
              function()
                require("fastaction").code_action()
              end,
              desc = "Code Action",
              mode = { "n", "v" },
              has = "codeAction",
            },
            { "<leader>cr", false },
            {
              "<leader>rn",
              vim.lsp.buf.rename,
              desc = "Rename",
              has = "rename",
            },
          },
        },
      }
      opts.servers.wgsl_analyzer = {}
    end,
  },
}
