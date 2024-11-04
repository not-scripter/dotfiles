#!/bin/bash

read -p "paste url : " link
read -p "select quality : " quality


yt-dlp -f link

# f(){
#   yt-dlp -f $1
# }
#
# select mode in audioOnly videoOnly
# do
#   case $mode in
#     audioOnly)
#       f $link
#     ;;
#     videoOnly)
#       f $link
#     ;;
#   *)
#     echo "invalid"
#     ;;
#   esac
# done
