#!/opt/homebrew/bin/bash
# Source: https://github.com/tmux-plugins/tmux-online-status/blob/master/scripts/online_status_icon.sh

ping_timeout="3"
ping_route="www.google.com"

is_osx() {
	[ $(uname) == "Darwin" ]
}

is_cygwin() {
	[[ $(uname) =~ CYGWIN ]]
}

is_freebsd() {
	[ $(uname) == FreeBSD ]
}

online_status() {
	if is_osx || is_freebsd; then
		local timeout_flag="-t"
	else
		local timeout_flag="-w"
	fi
	if is_cygwin; then
		local number_pings_flag="-n"
	else
		local number_pings_flag="-c"
	fi
	echo "DEBUG: executing: ping $number_pings_flag 1 $timeout_flag $ping_timeout $ping_route" >&2
	ping "$number_pings_flag" 1 "$timeout_flag" "$ping_timeout" "$ping_route" >/dev/null 2>&1
}


main() {
	if $(online_status); then
		ICON=" "
	else
		ICON="󱚼 "
	fi
	sketchybar --set "$NAME" label="$ICON"
}
main
