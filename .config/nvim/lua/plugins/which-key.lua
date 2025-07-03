return { -- Useful plugin to show you pending keybinds.
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    -- Disable lazyvim keymaps
    -- q
    { "<leader>qq", false },
    { "<leader>qs", false },
    { "<leader>qS", false },
    { "<leader>ql", false },
    { "<leader>qd", false },
  },
    -- stylua: ignore
  config = function() -- This is the function that runs, AFTER loading
    local wk = require("which-key")
    wk.add({
      -- [C]ode
      {
        mode = "n",
        { "<leader>c", group = "[C]ode", icon = { icon = " ", color = "orange" } },
        { "<leader>ci", desc = "[I]DE", icon = { icon = " ", color = "orange" } },
        { "<leader>cn", "<cmd>set rnu!<cr>", desc = "Toggle relative line [n]umbers" },
        { "<leader>cij", function() vim.cmd("!idea .") end, { desc = "Open in [I]ntelliJ" } },
        { "<leader>cip", function() vim.cmd("!pycharm .") end, { desc = "Open in [P]yCharm" } },
      },
      -- [F]ind
      {
        -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
        -- { "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
        -- { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
      },
      -- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      -- [L]azy / [L]ua
      {
        mode = "n",
        { "<leader>L", group = "[L]azy / [L]ua", icon = "󰒲 " },
        { "<leader>Ls", "<cmd>source %<cr>", desc = "[S]ource current file" },
        {
          "<leader>Lr",
          function()
            local basename = vim.fn.expand("%:t"):gsub("%.lua$", "")
            local names = {
              basename,
              basename .. ".nvim",
              "nvim-" .. basename,
            }
            local attempts = ""
            for _, plugin in ipairs(names) do
              if require("lazy.core.config").plugins[plugin] ~= nil then
                vim.cmd("Lazy reload " .. plugin)
                return
              end
              attempts = attempts .. ", " .. plugin
            end
            vim.notify("Plugins " .. attempts:sub(3) .. " not found.", vim.log.levels.WARN)
          end,
          desc = "[L]azy.vim [r]eload current file",
        },
      },
      -- { "<leader>d", desc = "[D]ebug", icon = { icon = "󰃤 ", color = "red" } },
      -- { "<leader>g", desc = "[G]it" },
      -- { "<leader>h", desc = "Git [H]unk", icon = { name = "git" } },
      -- { "<leader>h", desc = "Git [H]unk", mode = "v" },
      -- { "<leader>l", desc = "[L]LM", icon = { icon = " ", color = "green" } },
      -- { "<leader>s", desc = "[S]earch", icon = { icon = "", color = "blue" } },
      -- { "<leader>t", desc = "[T]est", icon = {} },
      -- { "<leader>r", desc = "[R]un", icon = { icon = " ", color = "green" } },
      -- { "<leader>x", desc = "Trouble", icon = { icon = "󱖫 ", color = "green" } },
    })

    -- [W]indow
    wk.add({
      mode = "n",
      { "<leader>w", group = "[W]indow", icon = { icon = " ", color = "blue" } },
      { "<leader>wt", "<cmd>tab split<CR>", desc = "Send [W]indow to new [T]ab" },
      { "<leader>wT", "<cmd>tabnew<CR>", desc = "Send [W]indow to new [T]ab" },
      {
        "<leader>wh",
        function()
          require("utility.windows").hide_windows()
          vim.fn.system([[tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z]])
        end,
        desc = "[H]ide windows",
      },
      {
        "<leader>wd",
        function()
          if vim.o.background == "dark" then
            vim.o.background = "light"
          else
            vim.o.background = "dark"
          end
        end,
        desc = "Toggle [D]ark mode",
      },
    })
    wk.setup({
      delay = function(ctx)
        return ctx.plugin and 0 or 200
      end,
    })
  end,
}
