return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
		'MunifTanjim/nui.nvim',
	},
	opts = {
		auto_clean_after_session_restore = true, -- Don't brick tree when restoring session
		name = {
			trailing_slash = true,
			use_git_status_colors = true,
		},
		filesystem = {
			filtered_items = {
				hide_gitignored = false,
				hide_dotfiles = false,
			},
			follow_current_file = {
				enabled = true,
				leave_dirs_open = true,
			},
		},
		window = {
			mappings = {
				['Z'] = 'expand_all_nodes',
				['\\'] = 'close_window',
			},
		},
		default_component_configs = {
			file_size = {
				enabled = false,
			},
		},
	},
	keys = {
		{
			'<leader>\\',
			function()
				vim.cmd('Neotree close')
			end,
			desc = 'Reveal neoTree',
		},
		{
			'\\',
			function()
				vim.cmd('Neotree reveal')
			end,
			desc = 'Reveal neoTree',
		},
	},
}
