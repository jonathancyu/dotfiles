on open theFiles
	repeat with aFile in theFiles
		openPath(POSIX path of aFile)
	end repeat
end open

on run argv
	if (count of argv) is 0 then
		error "usage: osascript codex-open-in-tmux-nvim.applescript <path> [path ...]"
	end if

	repeat with rawPath in argv
		openPath(rawPath as text)
	end repeat
end run

on openPath(posixPath)
	do shell script "/Users/jonathan/.local/scripts/codex-open-in-tmux-nvim " & quoted form of posixPath
end openPath
