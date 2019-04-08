# todo:
- [ ] should tracks in tags be stored in an object, with track IDs being the keys? This would allow data like thie time in a track when it was added, as well as a timestamp of when it was added.
	- However, this could also bloat the library data footprint.
	- Migration:
		- `library.tags[tagName].tracks: string[]` : `library.tags[tagName].tracks[trackId]: object`
		- merge `library.tags[tagName].times: object` into ^
- [ ] 1gor9z: when typing `/note` and there are no existing notes, begin creating a note
- [ ] 1gG4VT: fix /edit swapping first and last tracks
- [ ] 1gG4Ve: optionally use common factors or time signatures to find other good ratios
- [ ] 1gG4fU @refactor: change any scoped variables referenced to trigger events with data, if needed, and move this into a static object on Player, or several (base, playing, editing)
	- [x] bindingGroupName
- [ ] 1gG4hJ: sorting notes in the same way as sortChapters, combine?
- [ ] 1gG4hV: use the 'turn' command to only sort tracks by their similarity to the filter, rather than removing those that don't match
	possible solutions:
	- add a parameter to make `filterTracks` only sort, and not `keep_if`/`delete_if`
	- compartmentalize sort and inclusion/exclusion aspects of different filters
		- make another function that uses only the sort parts
		- call this function in the 'turn' command
- [ ] 1gG4hv: seek to either a chapter or a note
	- [x] make chapter functions generic
	- search among chapters and notes as a flat list
- [ ] 1gG4iz: add @currentTrack to queue
- [ ] 1gG4j1: catch SIGINT (ctrl+c) & prompt for playlist again
- [ ] 1gG4j4: I shouldn't need to check twice
- [ ] 1gG4jN: @enhancement optionally grow tag set by linking through tracks with explicitly chosen tags
	- add a tag fuzzy factor: include tags of tracks that have the current tag (only 1 degree separation to start)
- [ ] 1gG4jP: make a list of IDs and filter tracks against it once, rather than filtering separately for each tag
- [ ] 1gG4jS: getOCRemixSource url
- [ ] 1gG4jc: stream to a network radio service (SERVER_TYPE: default 'homebrew' or 'Nicecast'", " ") do |streamingServerType = 'homebrew'|
- [ ] 1gG4kV: application/rss+xml, application/rdf+xml;q=0.8, application/atom+xml;q=0.6, application/xml;q=0.4, text/xml;q=0.4
- [ ] 1gG4kY: parse normal & negated options from one list
	```
	hash = {
		:normal => [],
		:negate => []
	}
	```
- [+] 1gG4ko: pause mplayer with doing ^Z: and unpause after
- [ ] 1gSke5: Determine whether a URL is serving a live stream based on some data returned by the source URL
- [ ] 1gSlF1: Do this only if the list being edited is not already the canonical library track list, in which case we cannot determine if there was a change
- [ ] load media in the same player using 'loadfile <file|url> <append>' (http://www.mplayerhq.hu/DOCS/tech/slave.txt) and '-fixed-vo', so that if watching videos, one player can be used continuously, and the video doesn't take user focus when changing.
- [ ] 1gTpuh: implement named sessions, like the web interface of tunewich
	- [ ] allow multiple sessions to be loaded
		- in which case the current session will not be named or saved, unless the user saves it again interactively...
		- e.g. `-S nonet,work,cheer`, which would load those 3 sessions, overwriting each other in reverse of that order, so that the `nonet` session would have no parameters overwritten.
- [ ] 1gnyIc: fix missing input characters while paused
	- perhaps the solution is to put mplayer in the background to avoid it affecting STDIN at all; I would have thought that `-slave -input file="..."` was enough.
- [ ] 1gpaYC (lost reference): wouldn't this title always be wrong when shuffling, since @shuffleIndex (in @nextTrack) is called after it's announced?
- [ ] FIXME 1gpalq: avoiding calling filterTracksOnDeck because of fragile trackIndex?
- [ ] FIXME 1gpanQ: don't assume mp3 file extension
- [ ] FIXME 1gpani: why does this stall when writing to a FIFO before something is reading from it?
- [ ] FIXME 1gpao6: this deletion _is_ saved, but for some reason, playing the track again immediately starts again from the mark.
- [ ] FIXME 1gpaoG: sometimes the STDIN is not editable after this
- [ ] FIXME 1gpaoS: seems to be skipping the first recommended track
- [ ] FIXME 1gpaoe: always process this option first, even if it's provided last
- [ ] FIXME 1gpaoq: what's a good baseline score for a playlist match?
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

@ruby 1gzG6x; Is `guessTag` initialized in the "else" of this case? `guessTag = ... if lastInputToken...`

- [ ] 1gzQHH set volume with multipliers, enabling track loudness and fade
	- [ ] implementation plan:
		- when should the state @volume change?
		- make sure that sequential volume operations are cohesive
			- how to handle interrupting /fade operations?

- [ ] enable loop rules for a track, like "loop this during the time window 13:00:00-13:59:59"
	- [ ] enable setting these rules on tracks in a playlist, so that different lists can use the same tracks with different rules (and so that playing a track in isolation doesn't necessarily cause weird playback behavior).

## notes

Hashes are generated with tent:bin/hashtime, which turns the decimal seconds since the unix epoch into a base-62 number with these digits: `0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz`.
