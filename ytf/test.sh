#!/bin/bash

url=$1

yt-dlp -F $url

yt-dlp -f 135+140-drc $url
