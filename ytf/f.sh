#!/bin/bash

quality = "480p"
echo "paste the link here : "
read link
echo "select the quality : "
read quality

yt-dlp -f quality link
