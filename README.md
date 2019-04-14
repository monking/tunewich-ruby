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
- `/exit` - Exits tunewich
- `/stop` - Stops playback, while keeping the interactive tools available. This is the same as starting the player with `--mode edit`.
- `/play` - Start playing a track from `edit` mode
- `/mute`, `/unmute`, `/fade VOLUME [DURATION]` - Fade the volume, from 0-100. You can also fade `out`/`in`, which is like mute/unmute; i.e. if the volume is 100, `/fade 0` changes the volume to 0, while `/fade out` . The default fade DURATION is 2 seconds.
- `/ COMMAND` - A slash followed by a space lets you send commands directly to the player application (which can be configured with the environment variable `TUNEWICH_PLAYER_APP`). `mplayer` is the only player application that actually supports this command fully. Other players have hacked support for the `/ q` command.
	- `/ q` - Quit the player application. In other words, skip the current track.
- `/shuffle` - Toggle the shuffle setting.
- `/go TITLE` - Play a specific track next. You can type any exploded substring of the track TITLE, and press the `tab` key to find a matching title. The first "closest" match will be used, even if you don't press the `tab` key..

Any command you type without a `/` in front of it will be sent straight to the player application. So, to skip a track, you can type just `q` and `Enter`.

Commands can also be strung together, like `/`.

Run `tw -h` for help, or while running tunewich, type `/help`

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
