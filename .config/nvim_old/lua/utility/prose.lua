local function setup()
	local opt = vim.opt
	opt.colorcolumn = '0'
	opt.wrap = true
	opt.spell = true
	opt.linebreak = true
end

return {
	setup = setup,
}
