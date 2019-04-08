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

## radio (in-progress)

- Install [Soundflower](https://github.com/mattingalls/Soundflower).
- Install `darkice`, `icecast`, and `jack`.
	- Mac: `brew install darkice icecast jack`
