function SetColorScheme(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)
end

SetColorScheme()
