-- local styles = {
--   double = to_border_map({ "╔", "═", "╗", "║", "╝", "═", "╚", "║" }),
--   none = "none",
--   rounded = to_border_map({ "╭", "─", "╮", "│", "╯", "─", "╰", "│" }),
--   shadow = "shadow",
--   single = to_border_map({ "┌", "─", "┐", "│", "┘", "─", "└", "│" }),
--   solid = to_border_map({ " ", " ", " ", " ", " ", " ", " ", " " }),
-- }
local header_text = [[
           ╭──────────────────────────────────────────────────────────╮
           │ ╭─────────────────────╮          ╭─────────────────────╮ │
           │ │  5    }             ╰──────────╯            11:09 PM │ │
           │ │  4  }                                                │ │
           │ │  3                                                   │ │
           │ │  2  pub struct Tensor {                              │ │
           │ │  1    pub name: String,                              │ │
           │ │ 52    pub data: Vec<Vec<f64>>,                       │ │
           │ │  1    pub size: (usize, usize),                      │ │
           │ │  2    pub gradient: Rc<RefCell<Gradient>             │ │
           │ │  3  }                                                │ │
           │ │  4                                                   │ │
           │ │  5                                                   │ │
           │ │  6  impl<'a> Mul<&'a Tensor> for &'a Tensor {        │ │
           │ │______________________________________________________│ │
           │ │ main  󰀪 2  tensor.rs                      52:47 │ │
           │ ╰──────────────────────────────────────────────────────╯ │
           ╰──────────────────────────────────────────────────────────╯
           /          ______________________________________          \
          /          /.──.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.o.\          \
         /          /.───.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.──.\          \
        /          /.───.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.────.\          \
       /          /.─────.─.─.─.─.─.─.─.─.─.─.─.─.─.─.─.──────.\          \
      /          /.───.─.──. .─────────────────────.──.─.─.─.─.─\          \
     /          '────────────────────────────────────────────────'          \
    /                      /                           \                     \
   /                      /                             \                     \
  /                      /                               \                     \
 /                      '─────────────────────────────────`                     \
┌────────────────────────────────────────────────────────────────────────────────┐
╰────────────────────────────────────────────────────────────────────────────────╯
]]
return {
	'goolord/alpha-nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'folke/persistence.nvim',
		'jonathancyu/kanagawa.nvim',
	},
	config = function()
		local alpha = require('alpha')
		local dashboard = require('alpha.themes.dashboard')
		local header = dashboard.section.header
		header.val = vim.split(header_text, '\n', { plain = true })
		-- header.val = {
		-- 	[[                               __                ]],
		-- 	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		-- 	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		-- 	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		-- 	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		-- 	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		-- }
		-- TODO: can we make button color different than the shortcut?
		local header_hl = 'Comment'
		local footer_hl = 'Text'
		local button_hl = 'Normal'
		local shortcut_hl = 'Text'

		local buttons = {
			dashboard.button('r', '    [R]estore Last Session', ':lua require("persistence").load() <CR>'),
			dashboard.button('f', '    [F]ind File', '<leader>sf'),
			dashboard.button('n', '    [N]ew File', '[[<cmd> ene <BAR> startinsert <cr>]]'),
			dashboard.button('-', '    Browse Files', '-'),
			dashboard.button('l', '󰒲    [L]azy', '<cmd> Lazy <cr>'),
			dashboard.button('Q', '    [Q]uit', ':qa<CR>'),
		}

		for _, button in ipairs(buttons) do
			button.opts.hl = button_hl
			button.opts.hl_shortcut = shortcut_hl
		end
		dashboard.section.buttons.val = buttons

		dashboard.section.header.opts.hl = header_hl
		dashboard.section.buttons.opts.hl = button_hl
		dashboard.section.footer.opts.hl = footer_hl

		local handle = io.popen('fortune')
		local fortune = handle:read('*a')
		handle:close()
		dashboard.section.footer.val = fortune

		dashboard.config.opts.noautocmd = true

		vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
}