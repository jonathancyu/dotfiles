local header_text = [[
           ╭──────────────────────────────────────────────────╮
           │   ╭─────────────────────────────────────────╮    │
           │   │  5    }                                 │    │
           │   │  4  }                                   │    │
           │   │  3                                      │    │
           │   │  2  pub struct Tensor {                 │    │
           │   │  1    pub name: String,                 │    │
           │   │ 52    pub data: Vec<Vec<f64>>,          │    │
           │   │  1    pub size: (usize, usize),         │    │
           │   │  2    pub gradient: Rc<RefCell<Gradient>│    │
           │   │  3  }                                   │    │
           │   │  4                                      │    │
           │   │  5                                      │    │
           │   │  6  impl<'a> Mul<&'a Tensor> for &'a Ten│    │
           │   │_________________________________________│    │
           │   │ main  󰀪 2  alpha.lua         52:47 │    │
           │   ╰─────────────────────────────────────────╯    │
           ╰──────────────────────────────────────────────────╯
           ,──────────────────────────────────────────────────,
          /        /.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.\        \
         /        /.---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.\        \
        /        /.---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`\        \
       /        /.-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.----.\        \
      /        /.---.-. .-------------------------. .-.--.\        \
     /        ,--------------------------------------------,        \
    /                  /                           \                 \
   /                  /                             \                 \
  /                  /                               \                 \
 /                  '─────────────────────────────────`                 \
┌────────────────────────────────────────────────────────────────────────┐
╰────────────────────────────────────────────────────────────────────────╯
]]
return {
	'goolord/alpha-nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'folke/persistence.nvim',
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
		dashboard.section.buttons.val = {
			dashboard.button('r', '    [R]estore Last Session', ':lua require("persistence").load() <CR>'),
			dashboard.button('f', '    [F]ind File', '<leader>sf'),
			dashboard.button('Q', '󰅚    [Q]uit', ':qa<CR>'),
		}
		local handle = io.popen('fortune')
		local fortune = handle:read('*a')
		handle:close()
		dashboard.section.footer.val = fortune

		dashboard.config.opts.noautocmd = true

		vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
}
