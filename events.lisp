(in-package #:cl-obs-websocket)

(defstruct event)

(defgeneric handle-event (event)
  (:method (event) (print event)
     ;(print (trivial-json-codec:deserialize-raw (jsown:to-json event)))
    ))
(defun create-event (type obj)
  (declare (optimize debug))
  (let ((reader (find-symbol (u:fp (u:s+ 'read- (de-snake type))) :cl-obs-websocket)))
    (funcall reader obj)))

;;;; General Events

(define-event "ExitStarted")
(define-event "VendorEvent" ("vendorName" "eventData" "eventType"))
(define-event "CustomEvent" ("eventData"))

;;;; Config Events

(define-event "CurrentSceneCollectionChanging" ("sceneCollectionName"))
(define-event "CurrentScenecollectionchanged" ("sceneCollectionName"))
(define-event "SceneCollectionListChanged" ("sceneCollections"))
(define-event "CurrentProfileChanging" ("profileName"))
(define-event "CurrentProfileChanged" ("profileName"))
(define-event "ProfileListChanged" ("profiles"))

;;;; Scenes Events

(define-event "SceneCreated" ("sceneName" "isGroup"))
(define-event "SceneRemoved" ("sceneName" "isGroup"))
(define-event "SceneNameChanged" ("oldSceneName" "sceneName"))
(define-event "CurrentProgramSceneChanged" ("sceneName"))
(define-event "CurrentPreviewSceneChanged" ("sceneName"))
(define-event "SceneListChanged" ("scenes"))

;;;; Inputs Events

(define-event "InputCreated" ("inputName" "inputKind" "unversionedInputKind" "inputSettings" "defaultInputSettings"))
(define-event "InputRemoved" ("inputName"))
(define-event "InputNameChanged" ("oldInputName" "inputName"))
(define-event "InputActiveStateChanged" ("inputName" "videoActive"))
(define-event "InputShowStateChanged" ("inputName" "videoShowing"))
(define-event "InputMuteStateChanged" ("inputName" "inputMuted"))
(define-event "InputVolumeChanged" ("inputName" "inputVolumeMul" "inputVolumeDb"))
(define-event "InputAudioBalanceChanged" ("inputName" "inputAudioBalance"))
(define-event "InputAudioSyncOffsetChanged" ("inputName" "inputAudioSyncOffset"))
(define-event "InputAudioTracksChanged" ("inputName" "inputAudioTracks"))
(define-event "InputAudioMonitorTypeChanged" ("inputName" "monitorType"))
(define-event "InputVolumeMeters" ("inputs"))

;;;; Transition Events

+(define-event "CurrentSceneTransitionChanged" ("transitionName"))
(define-event "CurrentSceneTransitionDurationChanged" ("transitionDuration"))
(define-event "SceneTransitionStarted" ("transitionName"))
(define-event "SceneTransitionEnded" ("transitionName"))
(define-event "SceneTransitionVideoEnded" ("transitionName"))

;;;; Filters Events

(define-event "SourceFilterListReindexed" ("sourceName" "filters"))
(define-event "SourceFilterCreated" ("sourceName" "filterName" " filterKind" "filterIndex" "filterSettings" "defaultFilterSettings"))
(define-event "SourceFilterRemoved" ("sourceName" "filterName"))
(define-event "SourceFilterNameChanged" ("sourceName" "oldFilterName" "filterName"))
(define-event "SourceFilterEnableStateChanged" ("sourceName" "filterName" "filterEnabled"))

;;;; Scene Items Events

(define-event "SceneItemCreated" ("sceneName" "sourceName" "sceneItemId" "sceneItemIndex"))
(define-event "SceneItemRemoved" ("sceneName" "sourceName" "sceneItemId"))
(define-event "SceneItemListReindexed" ("sceneName" "sceneItems"))
(define-event "SceneItemEnableStateChanged" ("sceneName" "sceneItemId" "sceneItemEnabled"))
(define-event "SceneItemLockStateChanged" ("sceneName" "sceneItemId" "sceneItemLocked"))
(define-event "SceneItemSelected" ("sceneName" "sceneItemId"))
(define-event "SceneItemTransformChanged" ("sceneName" "sceneItemId" "sceneItemTransform"))

;;;; Outputs Events

(define-event "StreamStateChanged" ("outputActive" "outputState"))
(define-event "RecordStateChanged" ("outputActive" "outputState" "outputPath"))
(define-event "ReplayBufferStateChanged" ("outputActive" "outputState"))
(define-event "VirtualcamStateChanged" ("outputActive" "outputState"))
(define-event "ReplayBufferSaved" ("savedReplayPath"))

;;;; Media Inputs Events

(define-event "MediaInputPlaybackStarted" ("inputName"))
(define-event "MediaInputPlaybackEnded"  ("inputName"))
(define-event "MediaInputActionTriggered" ("inputName" "mediaAction"))

;;;; UI events

(define-event "StudioModeStateChanged" ("studioModeEnabled"))



