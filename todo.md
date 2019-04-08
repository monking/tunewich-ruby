# todo:
- [ ] 1gor9z: when typing `/note` and there are no existing notes, begin creating a note
- [ ] 1gG4VT: fix /edit swapping first and last tracks
- [ ] 1gG4Ve: optionally use common factors or time signatures to find other good ratios
- [ ] 1gG4fU: change any scoped variables referenced to trigger events with data, if needed, and move this into a static object on Player, or several (base, playing, editing)
	- [x] bindingGroupName
- [ ] 1gG4gW: generalized function to list playlists, their track count, and the average rating among rated tracks
- [ ] 1gG4h6: getDownloadCommand, bind `download_complete`, etc.
- [ ] 1gG4h9: check if editChapter was successful
- [ ] 1gG4hB: it would be nice to make the chapter, if the intent is clear.
- [ ] 1gG4hJ: sorting notes in the same way as sortChapters, combine?
- [ ] 1gG4hV: use the 'turn' command to only sort tracks by their
	similarity to the filter, rather than removing those that don't
	match

	possible solutions:
	- add a paramter to make `filterTracks` only sort, and not `keep_if`/`delete_if`
	- compartmentalize sort and inclusion/exclusion aspects of different filters
		- make another function that uses only the sort parts
		- call this function in the 'turn' command
- [ ] 1gG4hv: seek to either a chapter or a note
	- make chapter functions generic
	- search among chapters and notes as a flat list
- [ ] 1gG4iM: [Toggle ON/off] Change next track's playback speed to BPM of a current track. If either track does not have BPM metadata, then the curent playback speed is maintained.
- [ ] 1gG4iz: add @currentTrack to queue
- [ ] 1gG4j1: catch SIGINT (ctrl+c) & prompt for playlist again
- [ ] 1gG4j4: I shouldn't need to check twice
- [ ] 1gG4j7: fade out and skip to next track (i.e. quit player)
- [ ] 1gG4j9: get time position without unpausing
- [ ] 1gG4jB: maybe this needs pausing_keep (http://www.mplayerhq.hu/DOCS/tech/slave.txt). doesn't quite work in my testing
- [ ] 1gG4jL: find places where stuff is not being saved, and do matchExistingLibraryTrack first
- [ ] 1gG4jN: add a tag fuzzy factor: include tags of tracks that have the current tag (only 1 degree separation to start)
- [ ] 1gG4jP: make a list of IDs and filter tracks against it once, rather than filtering separately for each tag
- [ ] 1gG4jS: getOCRemixSource url
- [ ] 1gG4jU: ruby probably has an easier way of getting an element index in an Array#map block
- [ ] 1gG4jc: stream to a network radio service (SERVER_TYPE: default 'homebrew' or 'Nicecast'", " ") do |streamingServerType = 'homebrew'|
- [ ] 1gG4kV: application/rss+xml, application/rdf+xml;q=0.8, application/atom+xml;q=0.6, application/xml;q=0.4, text/xml;q=0.4
- [ ] 1gG4kY: parse normal & negated options from one list
	```
	hash = {
		:normal => [],
		:negate => []
	}
	```
- [ ] 1gG4ko: also stop mplayer
- [ ] 1gOsMN: run commands from FIFO queue as if they had been typed interactively (this would allow the tent "away" function to fade out before killing, e.g.)
- [ ] 1gSke5: Determine whether a URL is serving a live stream based on some data returned by the source URL
- [ ] 1gSlF1: Do this only if the list being edited is not already the canonical library track list, in which case we cannot determine if there was a change
- [ ] load media in the same player using 'loadfile <file|url> <append>' (http://www.mplayerhq.hu/DOCS/tech/slave.txt) and '-fixed-vo', so that if watching videos, one player can be used continuously, and the video doesn't take user focus when changing.
- [ ] 1gTpuh: implement named sessions, like the web interface of tunewich
	- [ ] allow multiple sessions to be loaded
		- in which case the current session will not be named or saved, unless the user saves it again interactively...
		- e.g. `-S nonet,work,cheer`, which would load those 3 sessions, overwriting each other in reverse of that order, so that the `nonet` session would have no parameters overwritten.
- [ ] 1gnyIc: fix missing input characters while paused
	- perhaps the solution is to put mplayer in the background to avoid it affecting STDIN at all; I would have thought that `-slave -input file="..."` was enough.

## notes

Hashes are generated with tent:bin/hashtime, which turns the decimal seconds since the unix epoch into a base-62 number with these digits: `0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`.
