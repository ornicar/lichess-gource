#!/bin/sh

outfile="out/lichess-code.mp4"
resolution="2560x1440"
fps=60
speed=0.03
timescale=0.6

time gource out/combined.txt \
    -s $speed \
    -c $timescale \
    -$resolution \
    --title "lichess.org/source" \
    --background-colour 121212 \
    --background-image background.jpg \
    --dir-colour eeeeee \
    --filename-colour cccccc \
    --highlight-colour ffffff \
    --font-size 25 \
    --user-font-size 18 \
    --filename-time 2 \
    --file-extensions \
    --file-filter "(.+\.(yml|png|jpg|jpeg|gif|jar|svg|ogg|mp3|wav|pgn|ico|ttf|eot|woff|woff2|otf|rtf|confbak|bak|gitignore|gitmodules|example|m3u|aifc|log|jshintrc|eslintrc|default|p12|o|swp|h5|service|babelrc|npmrc|npmignore|pdf|ps1|lock|xcworkspace|editorconfig|gitattributes|pbxproj|BIN|sha512|prettierignore|eslintignore|ignore|dockerfile|ai_dist|dist|old|cur|perft|plist|storyboard|bz2))$" \
    --key \
    --date-format "%d/%m/%Y" \
    --auto-skip-seconds 0.001 \
    --multi-sampling  \
    --highlight-users \
    --max-files 0 \
    --stop-at-end \
    --output-framerate $fps \
    --file-idle-time 15 \
    --hide mouse,progress \
    --output-ppm-stream - \
    | ffmpeg -y -r $fps -f image2pipe -vcodec ppm -i - -vcodec libx265 -preset medium -crf 15 -threads 12 $outfile
    # --start-date "2020-01-01" \
    # --stop-at-time 10 \
