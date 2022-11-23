(in-package #:cl-obs-websocket)

(let ((counter 0)) ;:fixme rollover or strings
  (defun make-request (request data)
    (let ((id (incf counter)))
      (values (jsown:new-js
                ("requestType" request)
                ("requestId" id)
                ("requestData" (if (cdr data)
                                   data
                                   nil)))
              id))))
(defun find-sym (string keys)
  (loop :for key :in keys
        :for found := (or (and (listp key) (string-equal string (second key)) (car key))
                          (and (atom key) (string-equal string (string-downcase (symbol-name key))) key))
        :until found
        :finally (return found)))

;;;; General Requests
(define-request "GetVersion")
(define-request "GetStats")
(DEFINE-REQUEST "BroadcastCustomEvent" ((event "eventData")))
(define-request "CallVendorRequest"
                ((name "vendorName")
                 (type "requestType")
                 (data "requestData")))
(define-request "GetHotkeyList")
(define-request "TriggerHotkeyByName" ((name "hotkeyName")))
(define-request "TriggerHotkeyByKeySequence" ((string "keyId")) ((modifiers "keyModifiers")))
(define-request "Sleep" nil ((ms "sleepMillis") (frames "sleepFrames")))

;;;; Config requests
(DEFINE-REQUEST "GetPersistentData" ((realm "realm") (slot-name "slotName")))
(DEFINE-REQUEST "SetPersistentData" ((realm "realm") (slot-name "slotName") (value "slotValue")))
(define-request "GetSceneCollectionList")
(DEFINE-REQUEST "SetCurrentSceneCollection" ((name "sceneCollectionName")))
(DEFINE-REQUEST "CreateSceneCollection" ((name "sceneCollectionName")))
(define-request "GetProfileList")
(DEFINE-REQUEST "SetCurrentProfile" ((name "profileName")))
(DEFINE-REQUEST "CreateProfile" ((name "profileName")))
(DEFINE-REQUEST "RemoveProfile" ((name "profileName")))
(DEFINE-REQUEST "GetProfileParameter" ((name "parameterName") (category "parameterCategory")))
(DEFINE-REQUEST "setProfileParameter" ((name "parameterName") (category "parameterCategory") (value "parameterValue")))
(DEFINE-REQUEST "GetVideoSettings")
(DEFINE-REQUEST "SetVideoSettings" ()
  ((fps-numerator "fpsNumerator")
   (fps-denominator "fpsDenominator")
   (base-width "baseWidth")
   (base-height "baseHeight")
   (output-width "outputWidth")
   (output-height "outputHeight")))
(DEFINE-REQUEST "GetStreamServiceSettings")
(DEFINE-REQUEST "SetStreamServiceSettings" ((type "streamServiceType") (settings "streamServiceSettings")))
(DEFINE-REQUEST "GetRecordDirectory")

;;;;  Sources Requests

(DEFINE-REQUEST "GetSourceActive" ((source "sourceName")))
(DEFINE-REQUEST "GetSourceScreenshot"
  ((source "sourceName") (format "imageFormat"))
  ((width "imageWidth") (height "imageHeight") (quality "imageCompressionQuality")))

(DEFINE-REQUEST "SaveSourceScreenshot"
  ((source "sourceName") (format "imageFormat") (path "imageFilePath"))
  ((width "imageWidth") (height "imageHeight") (quality "imageCompressionQuality")))

;;;;  Scenes Requests

(DEFINE-REQUEST "GetSceneList")
(DEFINE-REQUEST "GetGroupList" )
(DEFINE-REQUEST "GetCurrentProgramScene")
(DEFINE-REQUEST "SetCurrentProgramScene" ((scene "sceneName")))
(DEFINE-REQUEST "GetCurrentPreviewScene" )
(DEFINE-REQUEST "SetCurrentPreviewScene" ((scene "sceneName")))
(DEFINE-REQUEST "CreateScene" ((scene "sceneName")))
(DEFINE-REQUEST "RemoveScene" ((scene "sceneName")))
(DEFINE-REQUEST "SetSceneName" ((old "sceneName") (new "newSceneName")))
(DEFINE-REQUEST "GetSceneSceneTransitionOverride" ((scene "sceneName")))
(DEFINE-REQUEST "SetSceneSceneTransitionOverride"
    ((scene "sceneName")(transition "transitionName") (duration "transitionDuration")))

;;;;  Inputs Requests

(DEFINE-REQUEST "GetInputList" () ((kind "InputKind")))
(DEFINE-REQUEST "GetInputKindList" () ((unversioned? "unversioned")) )
(DEFINE-REQUEST "GetSpecialInputs")
(DEFINE-REQUEST "CreateInput"
  ((name "inputName") (kind "inputKind") (scene "sceneName"))
  ((settings "inputSettings") (enabled? "sceneItemEnabled")))
(DEFINE-REQUEST "RemoveInput" ((name "inputName")))
(DEFINE-REQUEST "SetInputName" ((old "inputName") (new "newInputName")))
(DEFINE-REQUEST "GetInputDefaultSettings" ((kind "inputKind")))
(DEFINE-REQUEST "GetInputSettings" ((name "inputName")))
(DEFINE-REQUEST "SetInputSettings"
  ((name "inputName") (settings "inputSettings"))
  ((overlay? "overlay")))

(DEFINE-REQUEST "GetInputMute" ((name "inputName")))
(DEFINE-REQUEST "SetInputMute" ((name "inputName") (muted? "inputMuted")))
(DEFINE-REQUEST "ToggleInputMute" ((name "inputName")))

(DEFINE-REQUEST "GetInputVolume" ((name "inputName")))
(DEFINE-REQUEST "SetInputVolume" ((name "inputName"))
  ((multiplier "inputVolumeMul") (db "inputVolumeDb")));:fixme

(DEFINE-REQUEST "GetInputAudioBalance" ((name "inputName")))
(DEFINE-REQUEST "SetInputAudioBalance" ((name "inputName") (balance "inputAudioBalance")))

(DEFINE-REQUEST "GetInputAudioSyncOffset" ((name "inputName")))
(DEFINE-REQUEST "SetInputAudioSyncOffset" ((name "inputName") (offset "inputAudioSyncOffset")))

(DEFINE-REQUEST "GetInputAudioMonitorType" ((name "inputName")))
(DEFINE-REQUEST "SetInputAudioMonitorType" ((name "inputName") (type "monitorType")))

(DEFINE-REQUEST "GetInputAudioTracks" ((name "inputName")))
(DEFINE-REQUEST "SetInputAudioTracks" ((name "inputName") (tracks "inputAudioTracks")))

(DEFINE-REQUEST "GetInputPropertiesListPropertyItems" ((name "inputName") (property "propertyName")))

(DEFINE-REQUEST "PressInputPropertiesButton" ((name "inputName") (property "propertyName")))

;;;; Transitions Requests

(DEFINE-REQUEST "GetTransitionKindList")
(DEFINE-REQUEST "GetSceneTransitionList")
(DEFINE-REQUEST "GetCurrentSceneTransition")
(DEFINE-REQUEST "SetCurrentSceneTransition" ((name "transitionName")))
(DEFINE-REQUEST "SetCurrentSceneTransitionDuration" ((ms "transitionDuration")))
(DEFINE-REQUEST "SetCurrentSceneTransitionSettings" ((settings "transitionSettings")) ((overlay? "overlay")))
(DEFINE-REQUEST "GetCurrentSceneTransitionCursor")
(DEFINE-REQUEST "TriggerStudioModeTransition")
(DEFINE-REQUEST "SetTBarPosition" ((position "position")) ((release? "release")))

;;;;  Filters Requests

(DEFINE-REQUEST "GetSourceFilterList" ((name "sourceName")))
(DEFINE-REQUEST "GetSourceFilterDefaultSettings"  ((name "filterKind")))
(DEFINE-REQUEST "CreateSourceFilter"
  ((name "sourceName") (filter "filterName") (kind "filterKind"))
  ((settings "filterSettings")))
(DEFINE-REQUEST "RemoveSourceFilter" ((name "sourceName") (filter "filterName")))
(DEFINE-REQUEST "SetSourceFilterName"  ((name "sourceName") (old "filterName") (new "newFilterName")))
(DEFINE-REQUEST "GetSourceFilter" ((name "sourceName") (filter "filterName")))
(DEFINE-REQUEST "SetSourceFilterIndex" ((name "sourceName") (filter "filterName") (index "filterIndex")))
(DEFINE-REQUEST "SetSourceFilterSettings"
  ((Name "sourceName") (filter "filterName") (settings "filterSettings"))
  ((overlay? "overlay")))
(DEFINE-REQUEST "SetSourceFilterEnabled"
    ((Name "sourceName") (filter "filterName") (enabled? "filterEnabled")))

;;;;  Scene Items Requests

(DEFINE-REQUEST "GetSceneItemList" ((name "sceneName")))
(DEFINE-REQUEST "GetGroupSceneItemList" ((name "sceneName")))
(DEFINE-REQUEST "GetSceneItemId"
  ((name "sceneName") (source "sourceName"))
  ((offset "searchOffset")))
(DEFINE-REQUEST "CreateSceneItem"
  ((name "sceneName") (source "sourceName"))
  ((enabled? "sceneItemEnabled")))
(DEFINE-REQUEST "RemoveSceneItem" ((name "sceneName") (id "sceneItemId")))
(DEFINE-REQUEST "DuplicateSceneItem"
    ((name "sceneName") (id "sceneItemId")) ((scene "destinationSceneName")))
(DEFINE-REQUEST "GetSceneItemTransform" ((name "sceneName") (id "sceneItemId")))
(DEFINE-REQUEST "SetSceneItemTransform" ((Name "sceneName")(id "sceneItemId") (transform "sceneItemTransform")))
(DEFINE-REQUEST "GetSceneItemEnabled" ((Name "sceneName")(id "sceneItemId")))
(DEFINE-REQUEST "SetSceneItemEnabled" ((Name "sceneName")(id "sceneItemId") (enabled? "sceneItemEnabled")))
(DEFINE-REQUEST "GetSceneItemLocked" ((Name "sceneName")(id "sceneItemId")))
(DEFINE-REQUEST "SetSceneItemLocked" ((Name "sceneName")(id "sceneItemId")(locked? "sceneItemLocked")))
(DEFINE-REQUEST "GetSceneItemIndex"  ((Name "sceneName")(id "sceneItemId")))
(DEFINE-REQUEST "SetSceneItemIndex" ((Name "sceneName")(id "sceneItemId") (index "sceneItemIndex")))
(DEFINE-REQUEST "GetSceneItemBlendMode" ((Name "sceneName")(id "sceneItemId")))
(DEFINE-REQUEST "SetSceneItemBlendMode" ((Name "sceneName")(id "sceneItemId") (mode "sceneItemBlendMode")))

;;;;  Outputs Requests

(DEFINE-REQUEST "GetVirtualCamStatus")
(DEFINE-REQUEST "ToggleVirtualCam")
(DEFINE-REQUEST "StartVirtualCam")
(DEFINE-REQUEST "StopVirtualCam")
(DEFINE-REQUEST "GetReplayBufferStatus")
(DEFINE-REQUEST "ToggleReplayBuffer")
(DEFINE-REQUEST "StartReplayBuffer")
(DEFINE-REQUEST "StopReplayBuffer")
(DEFINE-REQUEST "SaveReplayBuffer")
(DEFINE-REQUEST "GetLastReplayBufferReplay")
(DEFINE-REQUEST "GetOutputList")
(DEFINE-REQUEST "GetOutputStatus" ((name "outputName")))
(DEFINE-REQUEST "ToggleOutput" ((name "outputName")))
(DEFINE-REQUEST "StartOutput" ((name "outputName")))
(DEFINE-REQUEST "StopOutput" ((name "outputName")))
(DEFINE-REQUEST "GetOutputSettings" ((name "outputName")))
(DEFINE-REQUEST "SetOutputSettings" ((name "outputName") (settings "outputSettings")))

;;;; Stream Requests

(DEFINE-REQUEST "GetStreamStatus")
(DEFINE-REQUEST "ToggleStream")
(DEFINE-REQUEST "StartStream")
(DEFINE-REQUEST "StopStream")
(DEFINE-REQUEST "SendStreamCaption" ((string "captionText")))

;;;;  Record Requests

(DEFINE-REQUEST "GetRecordStatus")
(DEFINE-REQUEST "ToggleRecord")
(DEFINE-REQUEST "StartRecord")
(DEFINE-REQUEST "StopRecord")
(DEFINE-REQUEST "ToggleRecordPause")
(DEFINE-REQUEST "PauseRecord")
(DEFINE-REQUEST "ResumeRecord")

;;;;  Media Inputs Requests

(DEFINE-REQUEST "GetMediaInputStatus" ((name "inputName")))
(DEFINE-REQUEST "SetMediaInputCursor" ((name "inputName") (cursor "mediaCursor")))
(DEFINE-REQUEST "OffsetMediaInputCursor" ((name "inputName") (cursor "mediaCursorOffset")))
(DEFINE-REQUEST "TriggerMediaInputAction" ((name "inputName") (action "mediaAction")))

;;;;  UI Requests

(DEFINE-REQUEST "GetStudioModeEnabled")
(DEFINE-REQUEST "SetStudioModeEnabled" ((enabled? "studioModeEnabled")))
(DEFINE-REQUEST "OpenInputPropertiesDialog" ((name "inputName")))
(DEFINE-REQUEST "OpenInputFiltersDialog" ((name "inputName")))
(DEFINE-REQUEST "OpenInputInteractDialog"((name "inputName")))
(DEFINE-REQUEST "GetMonitorList")
(DEFINE-REQUEST "OpenVideoMixProjector" ((type "videoMixType")) ((index "monitorIndex") (geometry "projectorGeometry")))
(DEFINE-REQUEST "OpenSourceProjector"((name "sourceName")) ((index "monitorIndex") (geometry "projectorGeometry")))

;;;; Not documented, OBS says not documented to discourage use.

(DEFINE-REQUEST "GetSceneItemPrivateSettings" ((Name "sceneName")(id "sceneItemId")))
(DEFINE-REQUEST "GetSourcePrivateSettings" ((source "sourceName")));:test me
(DEFINE-REQUEST "SetSourcePrivateSettings" ((source "sourceName") (settings "sourcePrivateSettings")));:test me
(DEFINE-REQUEST "SetSceneItemPrivateSettings" ((Name "sceneName")(id "sceneItemId") (settings "sceneItemPrivateSettings")));:test me






