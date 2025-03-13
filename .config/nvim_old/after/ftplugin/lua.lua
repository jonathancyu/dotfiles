vim.g.disable_autoformat = false
-- require('which-key').add({
-- 	mode = { 'n', 'x' },
-- 	'<CR>',
-- 	function(self)
-- 		local buf = vim.api.nvim_get_current_buf()
-- 		local bufname = vim.api.nvim_buf_get_name(buf)
-- 		Snacks.debug.run({ buf = buf, name = bufname })
-- 	end,
-- 	desc = 'Source buffer',
-- })
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require('luasnip.util.events')
local ai = require('luasnip.nodes.absolute_indexer')
local extras = require('luasnip.extras')
local l = require('luasnip.extras').lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require('luasnip.extras.expand_conditions')
local postfix = require('luasnip.extras.postfix').postfix
local types = require('luasnip.util.types')
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key
local ts_post = require('luasnip.extras.treesitter_postfix').treesitter_postfix

local function indent_str()
	return (' '):rep(4 --[[ @as number]])
end
local match_tsnode = {
	query = [[
		[
			(function_call)
			(identifier)
			(expression_list)
			(dot_index_expression)
			(bracket_index_expression)
		] @prefix
	]], --> INJECT: query
	query_lang = 'lua',
}
local function test(_)
	print()
end

ls.add_snippets('lua', {
	ts_post(
		{
			matchTSNode = {
				query = [[
								[(function_declaration
								  name: (identifier) @fname
								  parameters: (parameters) @params
								  body: (block) @body
								)] @prefix
							]],
				query_lang = 'lua',
			},
			trig = '.var',
		},
		fmt(
			[[
						local {} = function{}
							{}
						end
					]],
			{
				l(l.LS_TSCAPTURE_FNAME),
				l(l.LS_TSCAPTURE_PARAMS),
				l(l.LS_TSCAPTURE_BODY),
			}
		)
	),

	ts_post(
		{
			matchTSNode = {
				query = [[
                (function_declaration
                  name: (identifier) @fname
                  parameters: (parameters) @params
                  body: (block) @body
                ) @prefix
            ]],
				query_lang = 'lua',
			},
			trig = '.var',
		},
		fmt(
			[[
        local {} = function{}
            {}
        end
    ]],
			{
				l(l.LS_TSCAPTURE_FNAME),
				l(l.LS_TSCAPTURE_PARAMS),
				l(l.LS_TSCAPTURE_BODY),
			}
		)
	),
	ts_post(
		{
			trig = '.pairs',
			desc = 'Expands expression to for <key>, <var> in pairs(<exp>) or ipairs(<exp>) dp ... end',
			reparseBuffer = 'live',
			wordTrig = false,
			matchTSNode = match_tsnode,
		},
		c(1, {
			fmt('for {}, {} in pairs({}) do\n{}{}\nend', {
				i(1, 'k'),
				i(2, 'v'),
				l(l.LS_TSMATCH),
				t(indent_str()),
				i(3),
			}),
			fmt('for {}, {} in ipairs({}) do\n{}{}\nend', {
				i(1, 'i'),
				i(2, 'v'),
				l(l.LS_TSMATCH),
				t(indent_str()),
				i(3),
			}),
		})
	),
}, { key = 'asdf' })
