# Lichess Gource

Generate [gource](https://gource.io/) visualization of the lichess source code activity.

## Usage

1. Clone the repos on https://lichess.org/source
2. `./write-logs.sh`
3. `./record-video.sh`

## Extras

The video continues after the end of the commit history. To truncate it:

```
ffmpeg -ss 00:00:00 -i out/lichess-code.mp4 -to 00:04:00 -c copy out/lichess-code-truncated.mp4
```
