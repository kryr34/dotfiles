#!/bin/sh
player_status=$(playerctl status 2> /dev/null)
title=$(playerctl metadata title)
album=$(playerctl metadata album)
artist=$(playerctl metadata artist)

len=${#title}
if ((len > 20))
then
	i=$(($(date +%S) * 4 % $len))
	text="$title   $title"
	text=${text:i:40}
else
	text=$title
fi

tooltip="$title"
if [ ${#album} != 0 ]; then
	tooltip="$tooltip -- $album"
fi
if [ ${#artist} != 0 ]; then
	tooltip="$tooltip -- $artist"
fi

echo -n "{\
	\"alt\": \"$player_status\",\
	\"text\": \"$text\",\
	\"tooltip\": \"$tooltip\",\
	\"class\": \"$player_status\",\
}"	
