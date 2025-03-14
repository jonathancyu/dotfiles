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
			{ 'xiyaowong/telescope-emoji.nvim' },
			{ 'MagicDuck/grug-far.nvim' },
			{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
			{ 'folke/trouble.nvim' },
			{ 'benfowler/telescope-luasnip.nvim' },
		},
		config = function()
			local builtin = require('telescope.builtin')
			local cycle_find_files = require('telescope.cycle_find_files')
			-- Enable cycling between git files and normal files
			-- Open telescope results with Trouble
			local open_with_trouble = require('trouble.sources.telescope').open
			require('telescope').setup({
				defaults = {
					mappings = {
						i = {
							['<C-x>'] = open_with_trouble,
							['<C-Space>'] = cycle_find_files.next,
						},
						n = { ['<C-x>'] = open_with_trouble },
					},
				},
				pickers = {
					find_files = {
						theme = 'ivy',
					},
					git_files = {
						theme = 'ivy',
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
			pcall(require('telescope').load_extension, 'emoji')
			pcall(require('telescope').load_extension, 'luasnip')

			local dropdown = require('telescope.themes').get_dropdown({})
			local wk = require('which-key')
			-- Files
			vim.keymap.set('n', '<leader>sF', function()
				require('telescope.find_in_project').setup()
			end, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>sf', function()
				cycle_find_files()
			end, { desc = '[S]earch [F]iles' })
			-- vim.keymap.set('n', '<leader>sr', builtin.git_files, { desc = '[S]earch in [R]epository' })
			vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch recent files ("." for repeat)' })

			-- Meta
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
			vim.keymap.set('n', '<leader>st', builtin.filetypes, { desc = '[S]earch file [T]ypes' })
			vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

			-- Text
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [g]rep' })
			vim.keymap.set('n', '<leader>sG', function()
				require('grug-far').open()
			end, { desc = '[S]earch by [G]rug' })
			vim.keymap.set('n', '<leader>sc', builtin.resume, { desc = '[S]earch [C]ontinue' })
			vim.keymap.set('n', '<leader>so', builtin.buffers, { desc = '[S]earch [O]pen buffers' })

			-- Other
			vim.keymap.set('n', '<leader>se', function()
				vim.cmd('Telescope emoji')
			end, { desc = '[S]earch [E]mojis' })
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

			vim.keymap.set('n', '<leader>sl', function()
				builtin.find_files({ cwd = vim.fn.stdpath('data') })
			end, { desc = '[S]earch [N]eovim files' })
			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files({ cwd = vim.fn.stdpath('config') })
			end, { desc = '[S]earch [N]eovim files' })
		end,
	},
}
