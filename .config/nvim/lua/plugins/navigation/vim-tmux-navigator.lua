return {
	'christoomey/vim-tmux-navigator',
	cmd = {
		'TmuxNavigateLeft',
		'TmuxNavigateDown',
		'TmuxNavigateUp',
		'TmuxNavigateRight',
		'TmuxNavigatePrevious',
	},
	keys = {
		{ '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', { 'n' } },
		{ '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>', { 'n' } },
		{ '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>', { 'n' } },
		{ '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>', { 'n' } },
		{ '<C-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', { 'n' } },
	},
}
