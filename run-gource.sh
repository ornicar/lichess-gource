#!/bin/sh

outfile="out/gource.mp4"
resolution="2560x1440"

time gource out/combined.txt \
    -s 0.25 \
    -$resolution \
    --title "lichess.org source code" \
    --background-colour 121212 \
    --background-image background.png \
    --dir-colour dddddd \
    --filename-colour cccccc \
    --highlight-colour ffffff \
    --filename-time 10 \
    --file-extensions \
    --file-extension-fallback \
    --date-format "%d/%m/%Y" \
    --auto-skip-seconds 0.001 \
    --multi-sampling  \
    --highlight-users \
    --max-files 0 \
    --hide mouse,progress \
    --stop-at-end \
    --output-framerate 60 \
    --file-idle-time 30 \
    --output-ppm-stream - \
    | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset medium -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 lichess.mp4
