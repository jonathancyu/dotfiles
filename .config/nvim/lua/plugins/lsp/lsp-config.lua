local config = function()
	--  This function gets run when an LSP attaches to a particular buffer.
	--    That is to say, every time a new file is opened that is associated with
	--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
	--    function will be executed to configure the current buffer
	vim.api.nvim_create_autocmd('LspAttach', {

		group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc)
				vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
			end
			local telescope = require('telescope.builtin')

			map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
			-- trouble takes care of this
			-- map('gr', telescope.lsp_references, '[G]oto [R]eferences')
			map('gI', telescope.lsp_implementations, '[G]oto [I]mplementation')

			-- Jump to the type of the word under your cursor.
			--  Useful when you're not sure what type a variable is and you want to see
			--  the definition of its *type*, not where it was *defined*.
			map('<leader>D', telescope.lsp_type_definitions, 'Type [D]efinition')

			-- Telescope
			-- Fuzzy find all the symbols in your current document.
			--  Symbols are things like variables, functions, types, etc.
			map('<leader>sD', telescope.lsp_document_symbols, '[D]ocument Symbols')
			-- Fuzzy find all the symbols in your current workspace.
			--  Similar to document symbols, except searches over your entire project.
			map('<leader>sW', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace symbols')

			map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
			-- Map code action to fastaction
			map('<leader>a', vim.lsp.buf.code_action, '[A]ction')
			map('<leader>a', function()
				require('fastaction').code_action()
			end, '[A]ction')

			map('K', vim.lsp.buf.hover, 'Hover Documentation')
			map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
				map('<leader>cv', function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, '[V]irtual Text Hints')
			end
		end,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

	local servers = {
		['cmake-language-server'] = {},
		clangd = {
			cmd = {
				'clangd',
				'--enable-config',
				'--background-index',
				'--clang-tidy',
				'--header-insertion=iwyu',
				'--completion-style=detailed',
				'--function-arg-placeholders',
				'--fallback-style=llvm',
			},
			init_options = {
				usePlaceholders = true,
				completeUnimported = true,
				clangdFileStatus = true,
			},
		},
		-- gopls = {},
		bashls = {},
		basedpyright = {},
		ruff = {
			trace = 'messages',
			init_options = {
				settings = {
					logLevel = 'debug',
				},
			},
		},
		['eslint-lsp'] = {},
		['typescript-language-server'] = {},

		-- rust_analyzer = {}, Don't need b/c we have rustacean.nvim
		jdtls = {
			settings = {
				java = {
					inlayHints = {
						parameterNames = {
							enabled = 'all',
						},
					},
					configuration = {
						runtimes = {
							name = 'default',
							path = '$HOME/.sdkman/candidates/java/current',
							default = true,
						},
					},
				},
			},
		},
		lua_ls = {
			settings = {
				Lua = {
					completion = {
						autoRequire = false,
						callSnippet = 'Replace',
					},
					diagnostics = { disable = { 'missing-fields' } },
				},
			},
		},
	}

	require('mason').setup() -- Ensure Mason is installed

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, { -- Add formatters
		'stylua',
		'black',
	})
	require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

	require('java').setup({
		spring_boot_tools = {
			enable = true,
		},
		jdk = {
			auto_install = false,
		},
	})

	require('mason-lspconfig').setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for tsserver)
				server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
				require('lspconfig')[server_name].setup(server)
			end,
		},
	})
	-- Swift Sourcekit isn't provided in mason
	-- require('lspconfig').sourcekit.setup({
	-- 	capabilities = {
	-- 		workspace = {
	-- 			didChangeWatchedFiles = {
	-- 				dynamicRegistration = true,
	-- 			},
	-- 		},
	-- 	},
	-- })
end
return { -- LSP Configuration & Plugins
	'neovim/nvim-lspconfig',
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ 'williamboman/mason.nvim', config = true },
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',

		-- Useful status updates for LSP.
		-- { 'j-hui/fidget.nvim', opts = {} },
		'nvimtools/none-ls.nvim',
		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		{ 'folke/neodev.nvim', opts = {} },

		-- Must be setup before lspconfig
		{ 'SmiteshP/nvim-navbuddy' },
		{ 'Chaitanyabsprip/fastaction.nvim' },
	},

	config = config,
}
