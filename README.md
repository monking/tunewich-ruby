# tunewich CLI

A shell script to play music with `youtube-dl` and `mplayer`

## install

requires `mplayer`, or `mpv`, or `termux-media-player`

add this to your `~/.profile` (or similar) file:
```
export TUNEWICH_DIR="</path/to/your/music/directory>"
```

You can also store your library database elsewhere, if, for example, you want to back it up separately.
```
export TUNEWICH_DB="</path/to>/tunewich-library.json"
```

Now call tunewich with `tw` or `tunewich`.

## usage

While using tunewich, there are several interactive commands that let you control what's playing.

Some of the most useful commands are:
- `/help` - Show all commands with usage information. same as `tw -h` from the command line.
- `/exit` - Exit tunewich
- `/volume VOLUME`
	- `/mute` - mute audio, but remember your volume level
	- `/unmute` - return volume to last level
	- `/fade VOLUME [DURATION]` - Change the volume, from 0-100. You can also fade `out`/`in`, which is like mute/unmute. The default fade DURATION is 2 seconds.
- `/go TITLE` - Play a specific track next. You can type any exploded substring of the track TITLE, and press the `tab` key to find a matching title. The first "closest" match will be used, even if you don't press the `tab` key..
- `/shuffle [on/off]` - Toggle the shuffle setting.
- `/ COMMAND` - Send a command directly to the player application. The environment variable `TUNEWICH_PLAYER_APP` determines which application this is (`mplayer` by default, and the only application currently supporting more commands than `q`).
	- `/ q` - Quit the player application. In other words, skip the current track.

Any command you type without a `/` in front of it will be sent straight to the player application. So, to skip a track, you can type just `q` and `Enter`.

Commands can also be strung together, like `/`.

## tips

It's suggested that you make an alias with your favorite settings, such as:

```
alias tw='tunewich --exclude-filter --player-opts "-volume 50 -novideo"
```

It's a good idea to include `--player-opts "-novideo"`, if you want to only
listen. By default, `youtube-dl` picks the file with the best audio, which may
still contain a video channel.

## radio (in-progress/broken)

- Install [Soundflower](https://github.com/mattingalls/Soundflower).
- Install `darkice`, `icecast`, and `jack`.
	- Mac: `brew install darkice icecast jack`
