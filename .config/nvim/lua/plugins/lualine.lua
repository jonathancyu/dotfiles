local _file_count = 0
local _last_update = 0

local function refresh_file_count()
  local now = vim.uv.now()
  if now - _last_update < 2000 then return end
  _last_update = now
  vim.system({ "git", "diff", "--name-only" }, { text = true }, function(result)
    if result.code == 0 then
      local lines = vim.split(result.stdout or "", "\n", { trimempty = true })
      _file_count = #lines
    end
  end)
end

local function unstaged_changes()
  refresh_file_count()
  local ok, gs = pcall(require, "gitsigns")
  if not ok then return "" end
  local hunks = gs.get_hunks() or {}
  local hunk_count = #hunks
  if hunk_count == 0 and _file_count == 0 then return "" end
  return string.format("󰏫 %d  󰈙 %d", hunk_count, _file_count)
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, 1, {
      unstaged_changes,
      color = { fg = "#e5c07b" },
    })
    return opts
  end,
}
