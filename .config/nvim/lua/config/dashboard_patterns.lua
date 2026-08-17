local M = {}

local ok, data = pcall(require, "config.dashboard_pattern_options")
data = ok and data or {}

M.max_height = data.max_height or 18

local fallback = [[
 _      _      _      _      _      _
| |    / \    | |    / \    | |    / \
| |__ / _ \   | |__ / _ \   | |__ / _ \
|____/_/ \_\  |____/_/ \_\  |____/_/ \_\
]]

local seeded = false

local function seed_random()
  if seeded then
    return
  end
  seeded = true
  local hrtime = vim.uv and vim.uv.hrtime() or os.time()
  math.randomseed(os.time() + tonumber(tostring(hrtime):sub(-6)))
end

local function to_lines(art)
  local lines = vim.split(art or "", "\n", { plain = true, trimempty = false })
  while #lines > 0 and lines[1] == "" do
    table.remove(lines, 1)
  end
  while #lines > 0 and lines[#lines] == "" do
    table.remove(lines)
  end
  return lines
end

local function max_width(lines)
  local width = 0
  for _, line in ipairs(lines) do
    width = math.max(width, vim.api.nvim_strwidth(line))
  end
  return width
end

local function normalize(raw, index)
  local entry
  if type(raw) == "string" then
    entry = { art = raw }
  elseif type(raw) == "table" then
    entry = vim.deepcopy(raw)
    entry.art = entry.art or entry[1]
  end

  if not entry or not entry.art or entry.art == "" then
    return nil
  end

  entry.index = index
  entry.name = entry.name or ("pattern_%02d"):format(index)
  entry.lines = to_lines(entry.art)
  entry.line_count = #entry.lines
  entry.width = max_width(entry.lines)
  entry.weight = entry.weight or 1
  return entry
end

local function normalize_options(raw_options)
  local options = {}
  for index, raw in ipairs(raw_options or {}) do
    local entry = normalize(raw, index)
    if entry then
      options[#options + 1] = entry
    end
  end
  return options
end

M.options = normalize_options(data.options or data)
M.source = data.source

local function enabled(entry)
  return entry and entry.enabled ~= false and (entry.weight or 1) > 0 and entry.art
end

local function resolve(selector)
  if selector == nil or selector == "" then
    return nil
  end

  local index = tonumber(selector)
  if index and M.options[index] then
    return M.options[index], index
  end

  for i, entry in ipairs(M.options) do
    if entry.name == selector then
      return entry, i
    end
  end
end

local function slice_lines(lines, entry, max_height)
  max_height = max_height or M.max_height
  if #lines <= max_height then
    return lines
  end

  seed_random()
  local slice_height = math.max(max_height - 1, 1)
  local max_start = math.max(#lines - slice_height + 1, 1)
  local start = math.min(math.max(entry.dashboard_start or math.random(max_start), 1), max_start)
  local stop = math.min(start + slice_height - 1, #lines)
  local ret = {}

  for line = start, stop do
    ret[#ret + 1] = lines[line]
  end
  ret[#ret + 1] = ("[%s %d-%d/%d]"):format(entry.name or "pattern", start, stop, #lines)
  return ret
end

function M.choose()
  seed_random()

  local total = 0
  for _, entry in ipairs(M.options) do
    if enabled(entry) then
      total = total + math.max(math.floor(entry.weight or 1), 0)
    end
  end

  if total == 0 then
    return nil
  end

  local pick = math.random(total)
  local cursor = 0
  for _, entry in ipairs(M.options) do
    if enabled(entry) then
      cursor = cursor + math.max(math.floor(entry.weight or 1), 0)
      if pick <= cursor then
        return entry
      end
    end
  end
end

function M.header(selector)
  local entry = selector and resolve(selector) or M.choose()
  if not entry then
    return fallback
  end
  return table.concat(slice_lines(entry.lines, entry, entry.max_height or M.max_height), "\n")
end

function M.preview(selector)
  local entry, index = resolve(selector)
  if not entry then
    entry = M.choose()
    for i, option in ipairs(M.options) do
      if option == entry then
        index = i
        break
      end
    end
  end

  if not entry then
    vim.notify("No dashboard patterns are enabled", vim.log.levels.WARN)
    return
  end

  vim.cmd("tabnew")
  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "text"
  vim.api.nvim_buf_set_name(
    buf,
    ("dashboard-pattern:%02d:%s:%dx%d"):format(index or 0, entry.name or "pattern", entry.line_count, entry.width)
  )
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, entry.lines)
  vim.bo[buf].modified = false
  vim.wo.wrap = false
  vim.wo.number = false
  vim.wo.relativenumber = false
end

function M.open_options()
  local module_path = debug.getinfo(1, "S").source:sub(2)
  local nvim_root = vim.fn.fnamemodify(module_path, ":h:h:h")
  vim.cmd.edit(vim.fn.fnameescape(nvim_root .. "/lua/config/dashboard_pattern_options.lua"))
end

function M.complete(arg_lead)
  local choices = {}
  for index, entry in ipairs(M.options) do
    choices[#choices + 1] = tostring(index)
    if entry.name then
      choices[#choices + 1] = entry.name
    end
  end

  return vim.tbl_filter(function(choice)
    return choice:find(vim.pesc(arg_lead), 1) == 1
  end, choices)
end

function M.setup()
  vim.api.nvim_create_user_command("DashboardPatternPreview", function(opts)
    M.preview(opts.args)
  end, {
    nargs = "?",
    complete = function(arg_lead)
      return M.complete(arg_lead)
    end,
  })

  vim.api.nvim_create_user_command("DashboardPatternOptions", function()
    M.open_options()
  end, {})
end

return M
