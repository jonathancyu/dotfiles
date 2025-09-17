local function can_init_llm()
  local blacklist = { "operations-research/CWR" }
  local cwd = vim.fn.getcwd()
  for _, name in ipairs(blacklist) do
    if string.find(cwd, name, 1, true) then
      return false
    end
  end
  return true
end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  config = function()
    local prefix = "<leader>l"
    local opts = {
      provider = "claude",
      providers = {
        claude = {
          disable_tools = true, -- disable tools!
        },
      },
      -- add any opts here
      mappings = {
        ask = prefix .. "a",
        edit = prefix .. "e",
        refresh = prefix .. "r",
        toggle = {
          default = prefix .. "t",
          debug = prefix .. "d",
          hint = prefix .. "h",
          suggestion = prefix .. "s",
        },
      },
    }
    if can_init_llm() then
      require("avante").setup(opts)
    end
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or nvim-mini/mini.icons
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "Avante" },
      },
      ft = { "Avante" },
    },
  },
  keys = {
    {
      "<leader>l",
      function()
        vim.cmd("Neotree close")
      end,
      desc = "Reveal neoTree",
    },
  },
}
