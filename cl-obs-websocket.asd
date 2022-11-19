(in-package :asdf-user)
(defsystem "cl-obs-websocket"
  :description "Websocket interface to OBS"
  :version "0.0.1"
  :licence "LGPL"
  :author "Johannes Martinez Calzada"
  :depends-on ("websocket-driver" "ironclad" "jsown")
  :components ((:file "package")
               (:file "keys")
               (:file "utils")
               (:file "macros")
               (:file "enums")
               (:file "messages")
               (:file "events")
               (:file "client")
               (:file "requests")))
