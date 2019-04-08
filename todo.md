# todo:
- [ ] 1gor9z: when typing `/note` and there are no existing notes, begin creating a note
- [ ] 1gG4VT: fix /edit swapping first and last tracks
- [ ] 1gG4Ve: optionally use common factors or time signatures to find other good ratios
- [ ] 1gG4fU: change any scoped variables referenced to trigger events with data, if needed, and move this into a static object on Player, or several (base, playing, editing)
	- [x] bindingGroupName
- [ ] 1gG4gW: generalized function to list playlists, their track count, and the average rating among rated tracks
- [ ] 1gG4h6: getDownloadCommand, bind `download_complete`, etc.
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
- [x] 1gOsMN: run commands from FIFO queue as if they had been typed interactively (this would allow the tent "away" function to fade out before killing, e.g.)
	- this works for the most part, but I'm only getting text, not key codes, so arrow keys and such won't work
- [ ] 1gSke5: Determine whether a URL is serving a live stream based on some data returned by the source URL
- [ ] 1gSlF1: Do this only if the list being edited is not already the canonical library track list, in which case we cannot determine if there was a change
- [ ] load media in the same player using 'loadfile <file|url> <append>' (http://www.mplayerhq.hu/DOCS/tech/slave.txt) and '-fixed-vo', so that if watching videos, one player can be used continuously, and the video doesn't take user focus when changing.
- [ ] 1gTpuh: implement named sessions, like the web interface of tunewich
	- [ ] allow multiple sessions to be loaded
		- in which case the current session will not be named or saved, unless the user saves it again interactively...
		- e.g. `-S nonet,work,cheer`, which would load those 3 sessions, overwriting each other in reverse of that order, so that the `nonet` session would have no parameters overwritten.
- [ ] 1gnyIc: fix missing input characters while paused
	- perhaps the solution is to put mplayer in the background to avoid it affecting STDIN at all; I would have thought that `-slave -input file="..."` was enough.
- [ ] 1gpaYC: wouldn't this title always be wrong when shuffling, since @shuffleIndex (in @nextTrack) is called after it's announced?
- [ ] FIXME 1gpalq: avoiding calling filterTracksOnDeck because of fragile trackIndex?
- [ ] FIXME 1gpanQ: don't assume mp3 file extension
- [ ] FIXME 1gpani: why does this stall when writing to a FIFO before something is reading from it?
- [ ] FIXME 1gpao6: this deletion _is_ saved, but for some reason, playing the track again immediately starts again from the mark.
- [ ] FIXME 1gpaoG: sometimes the STDIN is not editable after this
- [ ] FIXME 1gpaoS: seems to be skipping the first recommended track
- [ ] FIXME 1gpaoe: always process this option first, even if it's provided last
- [ ] FIXME 1gpaoq: what's a good baseline score for a playlist match?
- [ ] FIXME 1gpapK: can I target `af_clr` at _just_ `equalizer`? I don't want to also remove scaletempo, for instance
- [ ] FIXME 1gpapS: save current volume relative to default in library.
- [ ] 1gpapl: killing the @inputThread if it's truthy. overkill?
- [ ] TODO 1gparD: output youtube-dl error messages to user
	- e.g. `ERROR: requested format not available`
- [ ] FIXME 1gpb0C: Somehow the library is being written as a completely empty string, despite this check.
- [ ] FIXME 1gpbAe: somehow this entry got into the library JSON tracks object: `"undefined": "nhTdDLVS_Sk"`, and again somehow it is referenced again and again, resulting in this error:
	```
	tunewich:2325:in `extendHash': undefined method `each' for "nhTdDLVS_Sk":String (NoMethodError)
					from tunewich:2334:in `block in matchExistingLibraryTrack'
					from tunewich:2332:in `each'
					from tunewich:2332:in `matchExistingLibraryTrack'
					from tunewich:2683:in `block in loadLibrary'
					from tunewich:2682:in `each'
					from tunewich:2682:in `each_with_index'
					from tunewich:2682:in `loadLibrary'
					from tunewich:1589:in `interactivePlayback'
					from tunewich:140:in `initialize'
					from tunewich:4157:in `new'
					from tunewich:4157:in `<main>'
	```
- [ ] 1gpzVv: change tags to map with key of track ID, and value of score\*, default 1
  - \*or object containing score, if that doesn't explode data size too much
  - add 1 to the score of this track's association with the tag (`tags.focus.tracks[currentTrackId].score`)
    - times 2^(# of +/- preceding tag name)
    - e.g. `/tag focus` = focus + 1
    - e.g. `/tag ++work-music verbal-sample` = focus + 4, verbal-sample + 1
      - maybe this association could be used to gently override some excluded tags. For instance, if I filter out the "distracting" tag, and thus all tags associated with it (including "verbal", and "verbal-sample"), I may want to let a track squeak through that has a very low "verbal-sample" score (i.e. maybe it only happens once or twice in the background, and so I want to describe the track without affecting its filtering much)
      - On this point, what does it mean for a track to have zero or negative affiliation with a tag?
        - Zero would seem to fit what I'm describing here: neglible in terms of filtering, but descriptive only.
        - I think negative would imply some other tag that would be better suited. It could reverse the filter effect, also: if I'm filtering to include only "focus" things, I may want to exclude things that have negative "focus" scores. In that case, it would be a placeholder for something more descriptive, so I think I would discourage using negative scores.
          - But :shrug:, maybe it'll be useful one day. I think my real fear here is that my data structure is not efficient, and complicating it futher will slow down the operation of my player. But when considering how the app should work, I shouldn't be concerned so much with that. Let the desired feature be a pressure to make the data store more efficient.

## notes

Hashes are generated with tent:bin/hashtime, which turns the decimal seconds since the unix epoch into a base-62 number with these digits: `0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`.
