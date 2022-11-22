(defpackage #:cl-obs-websocket
  (:use :cl)
  (:shadow cl:sleep)
  (:export #:client
           #:client-js-parser
           #:client-subscriptions
           #:client-responses
           #:client-password

           #:new-client
           #:connect
           #:disconnect
           #:*client*)
  (:local-nicknames (ws websocket-driver)))
(in-package #:cl-obs-websocket)
