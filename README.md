# tunewich CLI

A shell script to play music with `youtube-dl` and `mplayer`

## install

add this to your `~/.profile` (or similar) file:
```
export TUNEWICH_DIR="<path/to/your/music/directory>"
alias tw="<path/to/tunewich"
```

Now call tunewich with `tw`.

## usage

`tw -h` for help

## tips

It's suggested that you make an alias with your favorite settings, such as:

```
alias tw='tunewich --exclude-filter --player-opts "-volume 50 -novideo"
```

It's a good idea to include `--player-opts "-novideo"`, if you want to only
listen. By default, `youtube-dl` picks the video with the best audio, which may
be a video file. This is made an option so that you can use `tunewich` as a
video player, too.

## radio (in-progress)

- Install [Soundflower](https://github.com/mattingalls/Soundflower).
- Install `darkice`, `icecast`, and `jack`.
	- Mac: `brew install darkice icecast jack`
