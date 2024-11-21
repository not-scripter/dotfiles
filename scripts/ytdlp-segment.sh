#arguments: timestamp, duration, url

links=($(yt-dlp --youtube-skip-dash-manifest -g "$3"))
title="$(yt-dlp --simulate --print "%(title)s" $3)"

video_url=$links[0]
audio_url=$links[1]


ffmpeg -ss "$1" -i "$video_url" -ss "$1" -i "$audio_url" -map 0:v -map 1:a -ss 30 -t "$2" -c:v libx264 -c:a aac "$title".mkv
