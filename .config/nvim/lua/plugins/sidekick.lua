local DEFAULT_TOOL = "claude"
local function cursor_m_l(mode)
  local cli = require("sidekick.cli")
  local State = require("sidekick.cli.state")
  local Session = require("sidekick.cli.session")

  local should_send = false

  -- Check for attached Claude in current directory
  local attached = State.get({ attached = true, name = DEFAULT_TOOL, cwd = true })

  if #attached > 0 then
    -- If attached, toggle visibility
    local terminal = attached[1].terminal
    if terminal ~= nil and terminal:is_focused() then
      terminal:hide()
      return
    end
    -- Window is already showing, so we should send in normal mode
    should_send = true
  else
    -- Check if Claude exists for current directory (but not attached)
    local existing = State.get({ name = DEFAULT_TOOL, cwd = true })

    if #existing > 0 then
      -- Attach existing Claude session
      State.attach(existing[1], { show = true, focus = true })
    else
      -- Create new session for current directory with tmux backend
      Session.setup()

      -- Create descriptive session name: tool_dirname_hash
      local cwd = vim.fn.getcwd()
      --[[
      local basename = vim.fn.fnamemodify(cwd, ":t")
      -- Sanitize for tmux (replace spaces and problematic chars with underscores)
      basename = basename:gsub("[^%w%-]", "_")
      -- Create short hash for uniqueness
      local hash = vim.fn.sha256(cwd):sub(1, 8)
      local session_id = string.format("%s_%s_%s", DEFAULT_TOOL, basename, hash)
      --]]
      local session = Session.new({
        -- id = session_id,
        tool = DEFAULT_TOOL,
        cwd = cwd,
        backend = "tmux",
      })
      session = Session.attach(session)
      local state = State.get_state(session)
      State.attach(state, { show = true, focus = true })
    end
    -- Just attached/created, don't send in normal mode
    should_send = false
  end

  -- Only send if in visual mode, or in normal mode with window already showing
  if mode == "v" or (mode == "n" and should_send) then
    cli.send({ msg = "{this}" })
  end
end

return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      mux = {
        enabled = true, -- Enable multiplexer backend for persistent sessions
        backend = "tmux", -- Use tmux (or "zellij")
        create = "terminal", -- Create standalone tmux sessions independent of your tmux
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<M-l>", function() cursor_m_l("n") end, mode = "n", desc = "Toggle Claude (send if showing)" },
    { "<M-l>", function() cursor_m_l("v") end, mode = "v", desc = "Toggle Claude and send selection" },
    { "<M-l>", function() cursor_m_l("t") end, mode = "t", desc = "Toggle Claude" },
  },
}
