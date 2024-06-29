return {
	{
		'danielfalk/smart-open.nvim',
		branch = '0.2.x',
		config = function()
			require('telescope').load_extension('smart_open')
			vim.keymap.set('n', '<leader>sp', function()
				require('telescope').extensions.smart_open.smart_open()
			end, { desc = '[S]earch [P]roject', noremap = true, silent = true })
		end,
		dependencies = {
			'kkharji/sqlite.lua',
			-- Only required if using match_algorithm fzf
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
			-- Optional.  If installed, native fzy will be used when match_algorithm is fzy
			{ 'nvim-telescope/telescope-fzy-native.nvim' },
		},
	},
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable('make') == 1
				end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
			{ 'folke/trouble.nvim' },
		},
		config = function()
			-- Open telescope results with Trouble
			local open_with_trouble = require('trouble.sources.telescope').open
			require('telescope').setup({
				defaults = {
					mappings = {
						i = { ['<C-t>'] = open_with_trouble },
						n = { ['<C-t>'] = open_with_trouble },
					},
				},
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown(),
					},
				},
			})

			-- Load extensions
			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>st', builtin.filetypes, { desc = '[S]earch file [T]ypes' })
			vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sr', builtin.git_files, { desc = '[S]earch in [R]epository' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>sc', builtin.resume, { desc = '[S]earch [C]ontinue' })
			vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch recent files ("." for repeat)' })
			vim.keymap.set('n', '<leader>so', builtin.buffers, { desc = '[S]earch [O]pen buffers' })

			vim.keymap.set('n', '<leader>sb', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = '[Search] current [B]uffer' })

			vim.keymap.set('n', '<leader>s/', function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = 'Live Grep in Open Files',
				})
			end, { desc = '[S]earch [/] in Open Files' })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files({ cwd = vim.fn.stdpath('config') })
			end, { desc = '[S]earch [N]eovim files' })
		end,
	},
}
