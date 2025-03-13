local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values

local M = {}
local find_in_project = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()
	local finder = finders.new_oneshot_job({ 'find-in-project', opts.cwd }, opts)
	pickers
		.new(opts, {
			finder = finder,
			previewer = conf.previewer,
		})
		:find()
end

M.setup = function()
	find_in_project()
end

return M
