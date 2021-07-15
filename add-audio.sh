#!/bin/sh

audiofile=~/music/Plantasia\ --\ Mort\ Garson\ \(1976\).opus

ffmpeg -i out/lichess-code.mp4 -i $audiofile -map 0:v -map 1:a -c:v copy -shortest out/lichess-code-audio.mp4
