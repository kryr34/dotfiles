#!/bin/sh
player_status=$(playerctl status 2> /dev/null)
title=$(playerctl metadata title)
album=$(playerctl metadata album)
artist=$(playerctl metadata artist)

len=${#title}

maxlen=$1
if ([ $# -ge 1 ]&&[ $len -gt $maxlen ])
then
	speed=$((maxlen * 2/10))
	i=$(($(date +%S) * speed % $len))
	text="$title   $title"
	text=${text:i:maxlen}
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
	\"class\": \"$player_status\"\
}"	
