vim.g.disable_autoformat = true
return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>f",
      mode = { "n" },
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "[F]ormat",
    },
    {
      "<leader>cf",
      mode = { "n" },
      function()
        local message = ""
        if vim.g.disable_autoformat == true then
          vim.g.disable_autoformat = false
          message = "Enabled auto-formatting"
        else
          vim.g.disable_autoformat = true
          message = "Disabled auto-formatting"
        end
        vim.notify(message, vim.log.levels.INFO, { title = "Conform" })
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Disable auto[f]ormat",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      python = { "black" },
      typescriptreact = { "prettier" },
      json = { "jq" },
      xml = { "xmllint" },
    },
    formatters = {
      black = {
        prepend_args = { "--fast" },
      },
      rustfmt = {
        args = { "--edition", "2021" },
      },
    },
  },
}
