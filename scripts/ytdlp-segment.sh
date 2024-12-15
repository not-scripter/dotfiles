#arguments: timestamp, duration, url

links=($(yt-dlp --youtube-skip-dash-manifest -g "$3"))
title="$(yt-dlp --simulate --print "%(title)s" $3)"

video_url=$links[0]
audio_url=$links[1]

ffmpeg -ss "$1" -i "$video_url" -ss "$1" -i "$audio_url" -map 0:v -map 1:a -t "$2" -c:v libx264 -c:a aac "$title".mkv

# ffmpeg -ss "$1" -i "$video_url" -ss "$1" -i "$audio_url" -map 0:v -map 1:a -ss 30 -t "$2" -c:v libx264 -c:a aac "$title".mkv



# ffmpeg -ss 41:47 -i 'https://prod-fastly-ap-southeast-2.video.pscp.tv/Transcoding/v1/hls/ea0P592mGNQqUUI3f-VS6YZxbdM_oogFAObUDwdV4nqMuxFTcc-yO4CRNOTrTINyS9eTlZU3za1EeMbnIIuevg/transcode/ap-southeast-2/periscope-replay-direct-prod-ap-southeast-2-public/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsInZlcnNpb24iOiIyIn0.eyJFbmNvZGVyU2V0dGluZyI6ImVuY29kZXJfc2V0dGluZ18xMDgwcDMwXzEwIiwiSGVpZ2h0IjoxMDgwLCJLYnBzIjo1NTAwLCJXaWR0aCI6MTkyMH0.OImMZabKYJ0cs9CnIapU-4aBk6KNBiJxi1hh-6l4BZ4/playlist_16714233038958199966.m3u8?type=replay' -ss time -i 'https://prod-fastly-ap-southeast-2.video.pscp.tv/Transcoding/v1/hls/ea0P592mGNQqUUI3f-VS6YZxbdM_oogFAObUDwdV4nqMuxFTcc-yO4CRNOTrTINyS9eTlZU3za1EeMbnIIuevg/transcode/ap-southeast-2/periscope-replay-direct-prod-ap-southeast-2-public/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsInZlcnNpb24iOiIyIn0.eyJFbmNvZGVyU2V0dGluZyI6ImVuY29kZXJfc2V0dGluZ18xMDgwcDMwXzEwIiwiSGVpZ2h0IjoxMDgwLCJLYnBzIjo1NTAwLCJXaWR0aCI6MTkyMH0.OImMZabKYJ0cs9CnIapU-4aBk6KNBiJxi1hh-6l4BZ4/playlist_16714233038958199966.m3u8?type=replay' -map 0:v -map 1:a -ss 30 -t 01:06 -c:v libx264 -c:a acc ais.mkv


# ffmpeg -ss 41:47 -i 'https://prod-fastly-ap-southeast-2.video.pscp.tv/Transcoding/v1/hls/ea0P592mGNQqUUI3f-VS6YZxbdM_oogFAObUDwdV4nqMuxFTcc-yO4CRNOTrTINyS9eTlZU3za1EeMbnIIuevg/transcode/ap-southeast-2/periscope-replay-direct-prod-ap-southeast-2-public/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsInZlcnNpb24iOiIyIn0.eyJFbmNvZGVyU2V0dGluZyI6ImVuY29kZXJfc2V0dGluZ18xMDgwcDMwXzEwIiwiSGVpZ2h0IjoxMDgwLCJLYnBzIjo1NTAwLCJXaWR0aCI6MTkyMH0.OImMZabKYJ0cs9CnIapU-4aBk6KNBiJxi1hh-6l4BZ4/playlist_16714233038958199966.m3u8?type=replay' -ss time -i 'https://prod-fastly-ap-southeast-2.video.pscp.tv/Transcoding/v1/hls/ea0P592mGNQqUUI3f-VS6YZxbdM_oogFAObUDwdV4nqMuxFTcc-yO4CRNOTrTINyS9eTlZU3za1EeMbnIIuevg/transcode/ap-southeast-2/periscope-replay-direct-prod-ap-southeast-2-public/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsInZlcnNpb24iOiIyIn0.eyJFbmNvZGVyU2V0dGluZyI6ImVuY29kZXJfc2V0dGluZ18xMDgwcDMwXzEwIiwiSGVpZ2h0IjoxMDgwLCJLYnBzIjo1NTAwLCJXaWR0aCI6MTkyMH0.OImMZabKYJ0cs9CnIapU-4aBk6KNBiJxi1hh-6l4BZ4/playlist_16714233038958199966.m3u8?type=replay' -map 0:v -map 1:a -ss 30 -t 01:06 -c:v libx264 ais.mkv
