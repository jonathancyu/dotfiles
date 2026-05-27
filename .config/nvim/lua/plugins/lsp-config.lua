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
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].keys = vim.list_extend(opts.servers["*"].keys or {}, {
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
      })
      opts.servers.wgsl_analyzer = opts.servers.wgsl_analyzer or {}

      local python_root_markers = {
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        "pyrightconfig.json",
        ".git",
      }
      opts.servers.pyright = vim.tbl_deep_extend("force", opts.servers.pyright or {}, {
        root_markers = python_root_markers,
        settings = {
          python = {
            pythonPath = ".venv/bin/python",
            venv = ".venv",
            venvPath = ".",
            analysis = {
              typeCheckingMode = "strict",
            },
          },
        },
      })
      opts.servers.ruff = vim.tbl_deep_extend("force", opts.servers.ruff or {}, {
        root_markers = python_root_markers,
      })
    end,
  },
}
