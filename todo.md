# todo:
- [ ] fix /edit swapping first and last tracks #1pnp8J9btX6
- [ ] optionally use common factors or time signatures to find other good ratios #1pnp8VG9YA4
- [ ] change any scoped variables referenced to trigger events with data, if needed, and move this into a static object on Player, or several (base, playing, editing) #1pnpJF2KIY4
	- [x] bindingGroupName
- [ ] generalized function to list playlists, their track count, and the average rating among rated tracks #1pnpKMgOD2m
- [ ] getDownloadCommand, bind `download_complete`, etc. #1pnpL0cTQwS
- [ ] check if editChapter was successful #1pnpL3Do9W4
- [ ] it would be nice to make the chapter, if the intent is clear. #1pnpL5bWrGa
- [ ] sorting notes in the same way as sortChapters, combine? #1pnpLF55sNk
- [ ] use the 'turn' command to only sort tracks by their #1pnpLRdDbCi
	similarity to the filter, rather than removing those that don't
	match

	possible solutions:
	- add a paramter to make `filterTracks` only sort, and not `keep_if`/`delete_if`
	- compartmentalize sort and inclusion/exclusion aspects of different filters
		- make another function that uses only the sort parts
		- call this function in the 'turn' command
- [ ] seek to either a chapter or a note #1pnpLuPzN72
	- make chapter functions generic
	- search among chapters and notes as a flat list
- [ ] [Toggle ON/off] Change next track's playback speed to BPM of a current track. If either track does not have BPM metadata, then the curent playback speed is maintained. #1pnpMNOiSmO
- [ ] add @currentTrack to queue #1pnpN3wDVqi
- [ ] catch SIGINT (ctrl+c) & prompt for playlist again #1pnpN6rMo7U
- [ ] I shouldn't need to check twice #1pnpNACYZQO
- [ ] fade out and skip to next track (i.e. quit player) #1pnpNCgNj0y
- [ ] get time position without unpausing #1pnpNEtDDLE
- [ ] maybe this needs pausing_keep (http://www.mplayerhq.hu/DOCS/tech/slave.txt). doesn't quite work in my testing #1pnpNHGx9JY
- [ ] find places where stuff is not being saved, and do matchExistingLibraryTrack first #1pnpNSNN0Hw
- [ ] add a tag fuzzy factor: include tags of tracks that have the current tag (only 1 degree separation to start) #1pnpNUIDYRc
- [ ] make a list of IDs and filter tracks against it once, rather than filtering separately for each tag #1pnpNWljGG8
- [ ] getOCRemixSource url #1pnpNaBZyEi
- [ ] ruby probably has an easier way of getting an element index in an Array#map block #1pnpNcT25tY
- [ ] stream to a network radio service (SERVER_TYPE: default 'homebrew' or 'Nicecast'", " ") do |streamingServerType = 'homebrew'| #1pnpNkTKjoO
- [ ] application/rss+xml, application/rdf+xml;q=0.8, application/atom+xml;q=0.6, application/xml;q=0.4, text/xml;q=0.4 #1pnpOj709xo
- [ ] parse normal & negated options from one list #1pnpOluGteS
	```
	hash = {
		:normal => [],
		:negate => []
	}
	```
- [ ] also stop mplayer #1pnpP3BJJnE
- [ ] run commands from FIFO queue as if they had been typed interactively (this would allow the tent "away" function to fade out before killing, e.g.) #1pxQxMENEem
- [ ] Determine whether a URL is serving a live stream based on some data returned by the source URL #1gSke5
- [ ] Do this only if the list being edited is not already the canonical library track list, in which case we cannot determine if there was a change #1gSlF1
- [ ] load media in the same player using 'loadfile <file|url> <append>' (http://www.mplayerhq.hu/DOCS/tech/slave.txt) and '-fixed-vo', so that if watching videos, one player can be used continuously, and the video doesn't take user focus when changing.
- [ ] implement named sessions, like the web interface of tunewich #1gTpuh
	- [ ] allow multiple sessions to be loaded
		- in which case the current session will not be named or saved, unless the user saves it again interactively...
		- e.g. `-S nonet,work,cheer`, which would load those 3 sessions, overwriting each other in reverse of that order, so that the `nonet` session would have no parameters overwritten.
- [ ] fix missing input characters while paused (1gnyIc)
	- perhaps the solution is to put mplayer in the background to avoid it affecting STDIN at all; I would have thought that `-slave -input file="..."` was enough.
