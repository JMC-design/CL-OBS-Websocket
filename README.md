# CL-OBS-Websocket
Low level interface to OBS Websockets

Refer to [OBS protocol](https://github.com/obsproject/obs-websocket/blob/master/docs/generated/protocol.md).

This library is not meant to be :USE'd.  Use a package prefix at all times. Take advantage of local nicknames, we will be using obs: as nickname here.

## Getting Started

Make sure to enable websockets in OBS! Tools>obs-websocket Settings

This library provides a low level, no frills, interface to the protocol.  All protocol request names have been changed from camel case to standard lisp kebobs, e.g. "GetHotkeyList" -> get-hotkey-list.  Doc strings have been pulled from the protocol.  All requests that require objects, e.g. trigger-hotkey-by-key-sequence, require jsown objects or a json object string.

`obs:*subscriptions*` will show you all event types you can subscribe to. If no subscriptions are specified with a new client, you get subscribed to all events except high volume ones.  Refer to the protool. 

Clients are stored, for now, in the special obs:*client* and do not have to be supplied on every request.  I don't really see a case for controlling multiple OBS instances at a time, feel free to change my mind.

Get a client. 
If you do not supply a json-parsing-fn, responses will be returned as Jsown objects. #'identity will return a json string.

`(obs:new-client host port path list-of-subscriptions &optional password json-parsing-fn)`

Connect your client.

`(obs:connect client)`

Make a request.

`(obs:get-version)`

Disconnect your client.

`(obs:disconnect client)`

