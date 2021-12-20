#!/bin/sh
text="${QUTE_TITLE:-$QUTE_SELECTED_TEXT}"
notify-send -u low -a youtube "Streaming to mpv" "$text"
HOST_PLATO(`
mpv --script-opts=ytdl_hook-ytdl_path=yt-dlp --ytdl-raw-options='format=best[height<=900]' "$QUTE_URL"
',`
mpv --script-opts=ytdl_hook-ytdl_path=yt-dlp "$QUTE_URL"
')
