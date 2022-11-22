;;;;Generated from https://github.com/obsproject/obs-websocket/blob/master/docs/generated/protocol.json
(in-package :cl-obs-websocket)
(defun document (docs)
  (loop :for (sym . doc) :in docs
        :do (setf (documentation sym 'function) doc)))



(document '((GET-PERSISTENT-DATA
             . "Gets the value of a \"slot\" from the selected persistent data realm.")
            (SET-PERSISTENT-DATA
             . "Sets the value of a \"slot\" from the selected persistent data realm.")
            (GET-SCENE-COLLECTION-LIST . "Gets an array of all scene collections")
            (SET-CURRENT-SCENE-COLLECTION . "Switches to a scene collection.

Note: This will block until the collection has finished changing.")
            (CREATE-SCENE-COLLECTION
             . "Creates a new scene collection, switching to it in the process.

Note: This will block until the collection has finished changing.")
            (GET-PROFILE-LIST . "Gets an array of all profiles")
            (SET-CURRENT-PROFILE . "Switches to a profile.")
            (CREATE-PROFILE . "Creates a new profile, switching to it in the process")
            (REMOVE-PROFILE
             . "Removes a profile. If the current profile is chosen, it will change to a different profile first.")
            (GET-PROFILE-PARAMETER
             . "Gets a parameter from the current profile's configuration.")
            (SET-PROFILE-PARAMETER
             . "Sets the value of a parameter in the current profile's configuration.")
            (GET-VIDEO-SETTINGS . "Gets the current video settings.

Note: To get the true FPS value, divide the FPS numerator by the FPS denominator. Example: `60000/1001`")
            (SET-VIDEO-SETTINGS . "Sets the current video settings.

Note: Fields must be specified in pairs. For example, you cannot set only `baseWidth` without needing to specify `baseHeight`.")
            (GET-STREAM-SERVICE-SETTINGS
             . "Gets the current stream service settings (stream destination).")
            (SET-STREAM-SERVICE-SETTINGS
             . "Sets the current stream service settings (stream destination).

Note: Simple RTMP settings can be set with type `rtmp_custom` and the settings fields `server` and `key`.")
            (GET-RECORD-DIRECTORY
             . "Gets the current directory that the record output is set to.")
            (GET-SOURCE-FILTER-LIST . "Gets an array of all of a source's filters.")
            (GET-SOURCE-FILTER-DEFAULT-SETTINGS
             . "Gets the default settings for a filter kind.")
            (CREATE-SOURCE-FILTER
             . "Creates a new filter, adding it to the specified source.")
            (REMOVE-SOURCE-FILTER . "Removes a filter from a source.")
            (SET-SOURCE-FILTER-NAME . "Sets the name of a source filter (rename).")
            (GET-SOURCE-FILTER . "Gets the info for a specific source filter.")
            (SET-SOURCE-FILTER-INDEX . "Sets the index position of a filter on a source.")
            (SET-SOURCE-FILTER-SETTINGS . "Sets the settings of a source filter.")
            (SET-SOURCE-FILTER-ENABLED . "Sets the enable state of a source filter.")
            (GET-VERSION . "Gets data about the current plugin and RPC version.")
            (GET-STATS
             . "Gets statistics about OBS, obs-websocket, and the current session.")
            (BROADCAST-CUSTOM-EVENT
             . "Broadcasts a `CustomEvent` to all WebSocket clients. Receivers are clients which are identified and subscribed.")
            (CALL-VENDOR-REQUEST . "Call a request registered to a vendor.

A vendor is a unique name registered by a third-party plugin or script, which allows for custom requests and events to be added to obs-websocket.
If a plugin or script implements vendor requests or events, documentation is expected to be provided with them.")
            (GET-HOTKEY-LIST . "Gets an array of all hotkey names in OBS")
            (TRIGGER-HOTKEY-BY-NAME
             . "Triggers a hotkey using its name. See `GetHotkeyList`")
            (TRIGGER-HOTKEY-BY-KEY-SEQUENCE
             . "Triggers a hotkey using a sequence of keys.")
            (SLEEP
             . "Sleeps for a time duration or number of frames. Only available in request batches with types `SERIAL_REALTIME` or `SERIAL_FRAME`.")
            (GET-INPUT-LIST . "Gets an array of all inputs in OBS.")
            (GET-INPUT-KIND-LIST . "Gets an array of all available input kinds in OBS.")
            (GET-SPECIAL-INPUTS . "Gets the names of all special inputs.")
            (CREATE-INPUT
             . "Creates a new input, adding it as a scene item to the specified scene.")
            (REMOVE-INPUT . "Removes an existing input.

Note: Will immediately remove all associated scene items.")
            (SET-INPUT-NAME . "Sets the name of an input (rename).")
            (GET-INPUT-DEFAULT-SETTINGS . "Gets the default settings for an input kind.")
            (GET-INPUT-SETTINGS . "Gets the settings of an input.

Note: Does not include defaults. To create the entire settings object, overlay `inputSettings` over the `defaultInputSettings` provided by `GetInputDefaultSettings`.")
            (SET-INPUT-SETTINGS . "Sets the settings of an input.")
            (GET-INPUT-MUTE . "Gets the audio mute state of an input.")
            (SET-INPUT-MUTE . "Sets the audio mute state of an input.")
            (TOGGLE-INPUT-MUTE . "Toggles the audio mute state of an input.")
            (GET-INPUT-VOLUME . "Gets the current volume setting of an input.")
            (SET-INPUT-VOLUME . "Sets the volume setting of an input.")
            (GET-INPUT-AUDIO-BALANCE . "Gets the audio balance of an input.")
            (SET-INPUT-AUDIO-BALANCE . "Sets the audio balance of an input.")
            (GET-INPUT-AUDIO-SYNC-OFFSET . "Gets the audio sync offset of an input.

Note: The audio sync offset can be negative too!")
            (SET-INPUT-AUDIO-SYNC-OFFSET . "Sets the audio sync offset of an input.")
            (GET-INPUT-AUDIO-MONITOR-TYPE . "Gets the audio monitor type of an input.

The available audio monitor types are:

- `OBS_MONITORING_TYPE_NONE`
- `OBS_MONITORING_TYPE_MONITOR_ONLY`
- `OBS_MONITORING_TYPE_MONITOR_AND_OUTPUT`")
            (SET-INPUT-AUDIO-MONITOR-TYPE . "Sets the audio monitor type of an input.")
            (GET-INPUT-AUDIO-TRACKS
             . "Gets the enable state of all audio tracks of an input.")
            (SET-INPUT-AUDIO-TRACKS
             . "Sets the enable state of audio tracks of an input.")
            (GET-INPUT-PROPERTIES-LIST-PROPERTY-ITEMS
             . "Gets the items of a list property from an input's properties.

Note: Use this in cases where an input provides a dynamic, selectable list of items. For example, display capture, where it provides a list of available displays.")
            (PRESS-INPUT-PROPERTIES-BUTTON
             . "Presses a button in the properties of an input.

Some known `propertyName` values are:

- `refreshnocache` - Browser source reload button

Note: Use this in cases where there is a button in the properties of an input that cannot be accessed in any other way. For example, browser sources, where there is a refresh button.")
            (GET-MEDIA-INPUT-STATUS . "Gets the status of a media input.

Media States:

- `OBS_MEDIA_STATE_NONE`
- `OBS_MEDIA_STATE_PLAYING`
- `OBS_MEDIA_STATE_OPENING`
- `OBS_MEDIA_STATE_BUFFERING`
- `OBS_MEDIA_STATE_PAUSED`
- `OBS_MEDIA_STATE_STOPPED`
- `OBS_MEDIA_STATE_ENDED`
- `OBS_MEDIA_STATE_ERROR`")
            (SET-MEDIA-INPUT-CURSOR . "Sets the cursor position of a media input.

This request does not perform bounds checking of the cursor position.")
            (OFFSET-MEDIA-INPUT-CURSOR
             . "Offsets the current cursor position of a media input by the specified value.

This request does not perform bounds checking of the cursor position.")
            (TRIGGER-MEDIA-INPUT-ACTION . "Triggers an action on a media input.")
            (GET-VIRTUAL-CAM-STATUS . "Gets the status of the virtualcam output.")
            (TOGGLE-VIRTUAL-CAM . "Toggles the state of the virtualcam output.")
            (START-VIRTUAL-CAM . "Starts the virtualcam output.")
            (STOP-VIRTUAL-CAM . "Stops the virtualcam output.")
            (GET-REPLAY-BUFFER-STATUS . "Gets the status of the replay buffer output.")
            (TOGGLE-REPLAY-BUFFER . "Toggles the state of the replay buffer output.")
            (START-REPLAY-BUFFER . "Starts the replay buffer output.")
            (STOP-REPLAY-BUFFER . "Stops the replay buffer output.")
            (SAVE-REPLAY-BUFFER . "Saves the contents of the replay buffer output.")
            (GET-LAST-REPLAY-BUFFER-REPLAY
             . "Gets the filename of the last replay buffer save file.")
            (GET-OUTPUT-LIST . "Gets the list of available outputs.")
            (GET-OUTPUT-STATUS . "Gets the status of an output.")
            (TOGGLE-OUTPUT . "Toggles the status of an output.")
            (START-OUTPUT . "Starts an output.") (STOP-OUTPUT . "Stops an output.")
            (GET-OUTPUT-SETTINGS . "Gets the settings of an output.")
            (SET-OUTPUT-SETTINGS . "Sets the settings of an output.")
            (GET-RECORD-STATUS . "Gets the status of the record output.")
            (TOGGLE-RECORD . "Toggles the status of the record output.")
            (START-RECORD . "Starts the record output.")
            (STOP-RECORD . "Stops the record output.")
            (TOGGLE-RECORD-PAUSE . "Toggles pause on the record output.")
            (PAUSE-RECORD . "Pauses the record output.")
            (RESUME-RECORD . "Resumes the record output.")
            (GET-SCENE-ITEM-LIST . "Gets a list of all scene items in a scene.

Scenes only")
            (GET-GROUP-SCENE-ITEM-LIST . "Basically GetSceneItemList, but for groups.

Using groups at all in OBS is discouraged, as they are very broken under the hood. Please use nested scenes instead.

Groups only")
            (GET-SCENE-ITEM-ID . "Searches a scene for a source, and returns its id.

Scenes and Groups")
            (CREATE-SCENE-ITEM . "Creates a new scene item using a source.

Scenes only")
            (REMOVE-SCENE-ITEM . "Removes a scene item from a scene.

Scenes only")
            (DUPLICATE-SCENE-ITEM
             . "Duplicates a scene item, copying all transform and crop info.

Scenes only")
            (GET-SCENE-ITEM-TRANSFORM . "Gets the transform and crop info of a scene item.

Scenes and Groups")
            (SET-SCENE-ITEM-TRANSFORM
             . "Sets the transform and crop info of a scene item.")
            (GET-SCENE-ITEM-ENABLED . "Gets the enable state of a scene item.

Scenes and Groups")
            (SET-SCENE-ITEM-ENABLED . "Sets the enable state of a scene item.

Scenes and Groups")
            (GET-SCENE-ITEM-LOCKED . "Gets the lock state of a scene item.

Scenes and Groups")
            (SET-SCENE-ITEM-LOCKED . "Sets the lock state of a scene item.

Scenes and Group")
            (GET-SCENE-ITEM-INDEX . "Gets the index position of a scene item in a scene.

An index of 0 is at the bottom of the source list in the UI.

Scenes and Groups")
            (SET-SCENE-ITEM-INDEX . "Sets the index position of a scene item in a scene.

Scenes and Groups")
            (GET-SCENE-ITEM-BLEND-MODE . "Gets the blend mode of a scene item.

Blend modes:

- `OBS_BLEND_NORMAL`
- `OBS_BLEND_ADDITIVE`
- `OBS_BLEND_SUBTRACT`
- `OBS_BLEND_SCREEN`
- `OBS_BLEND_MULTIPLY`
- `OBS_BLEND_LIGHTEN`
- `OBS_BLEND_DARKEN`

Scenes and Groups")
            (SET-SCENE-ITEM-BLEND-MODE . "Sets the blend mode of a scene item.

Scenes and Groups")
            (GET-SCENE-LIST . "Gets an array of all scenes in OBS.")
            (GET-GROUP-LIST . "Gets an array of all groups in OBS.

Groups in OBS are actually scenes, but renamed and modified. In obs-websocket, we treat them as scenes where we can.")
            (GET-CURRENT-PROGRAM-SCENE . "Gets the current program scene.")
            (SET-CURRENT-PROGRAM-SCENE . "Sets the current program scene.")
            (GET-CURRENT-PREVIEW-SCENE . "Gets the current preview scene.

Only available when studio mode is enabled.")
            (SET-CURRENT-PREVIEW-SCENE . "Sets the current preview scene.

Only available when studio mode is enabled.")
            (CREATE-SCENE . "Creates a new scene in OBS.")
            (REMOVE-SCENE . "Removes a scene from OBS.")
            (SET-SCENE-NAME . "Sets the name of a scene (rename).")
            (GET-SCENE-SCENE-TRANSITION-OVERRIDE
             . "Gets the scene transition overridden for a scene.")
            (SET-SCENE-SCENE-TRANSITION-OVERRIDE
             . "Gets the scene transition overridden for a scene.")
            (GET-SOURCE-ACTIVE . "Gets the active and show state of a source.

**Compatible with inputs and scenes.**")
            (GET-SOURCE-SCREENSHOT . "Gets a Base64-encoded screenshot of a source.

The `imageWidth` and `imageHeight` parameters are treated as \"scale to inner\", meaning the smallest ratio will be used and the aspect ratio of the original resolution is kept.
If `imageWidth` and `imageHeight` are not specified, the compressed image will use the full resolution of the source.

**Compatible with inputs and scenes.**")
            (SAVE-SOURCE-SCREENSHOT . "Saves a screenshot of a source to the filesystem.

The `imageWidth` and `imageHeight` parameters are treated as \"scale to inner\", meaning the smallest ratio will be used and the aspect ratio of the original resolution is kept.
If `imageWidth` and `imageHeight` are not specified, the compressed image will use the full resolution of the source.

**Compatible with inputs and scenes.**")
            (GET-STREAM-STATUS . "Gets the status of the stream output.")
            (TOGGLE-STREAM . "Toggles the status of the stream output.")
            (START-STREAM . "Starts the stream output.")
            (STOP-STREAM . "Stops the stream output.")
            (SEND-STREAM-CAPTION . "Sends CEA-608 caption text over the stream output.")
            (GET-TRANSITION-KIND-LIST . "Gets an array of all available transition kinds.

Similar to `GetInputKindList`")
            (GET-SCENE-TRANSITION-LIST . "Gets an array of all scene transitions in OBS.")
            (GET-CURRENT-SCENE-TRANSITION
             . "Gets information about the current scene transition.")
            (SET-CURRENT-SCENE-TRANSITION . "Sets the current scene transition.

Small note: While the namespace of scene transitions is generally unique, that uniqueness is not a guarantee as it is with other resources like inputs.")
            (SET-CURRENT-SCENE-TRANSITION-DURATION
             . "Sets the duration of the current scene transition, if it is not fixed.")
            (SET-CURRENT-SCENE-TRANSITION-SETTINGS
             . "Sets the settings of the current scene transition.")
            (GET-CURRENT-SCENE-TRANSITION-CURSOR
             . "Gets the cursor position of the current scene transition.

Note: `transitionCursor` will return 1.0 when the transition is inactive.")
            (TRIGGER-STUDIO-MODE-TRANSITION
             . "Triggers the current scene transition. Same functionality as the `Transition` button in studio mode.")
            (SET-T-BAR-POSITION . "Sets the position of the TBar.

**Very important note**: This will be deprecated and replaced in a future version of obs-websocket.")
            (GET-STUDIO-MODE-ENABLED . "Gets whether studio is enabled.")
            (SET-STUDIO-MODE-ENABLED . "Enables or disables studio mode")
            (OPEN-INPUT-PROPERTIES-DIALOG . "Opens the properties dialog of an input.")
            (OPEN-INPUT-FILTERS-DIALOG . "Opens the filters dialog of an input.")
            (OPEN-INPUT-INTERACT-DIALOG . "Opens the interact dialog of an input.")
            (GET-MONITOR-LIST
             . "Gets a list of connected monitors and information about them.")
            (OPEN-VIDEO-MIX-PROJECTOR . "Opens a projector for a specific output video mix.

Mix types:

- `OBS_WEBSOCKET_VIDEO_MIX_TYPE_PREVIEW`
- `OBS_WEBSOCKET_VIDEO_MIX_TYPE_PROGRAM`
- `OBS_WEBSOCKET_VIDEO_MIX_TYPE_MULTIVIEW`

Note: This request serves to provide feature parity with 4.x. It is very likely to be changed/deprecated in a future release.")
            (OPEN-SOURCE-PROJECTOR . "Opens a projector for a source.

Note: This request serves to provide feature parity with 4.x. It is very likely to be changed/deprecated in a future release.")))
