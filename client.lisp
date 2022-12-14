(in-package :cl-obs-websocket)

(defparameter *client* nil)

(defstruct client
  ws
  js-parser
  subscriptions
  (responses (make-hash-table :size 300))
  password )

(defmethod print-object ((client client) stream)
  (if *print-readably*
      (call-next-method)
      (print-unreadable-object (client stream)
        (format stream "OBS WS client:~a" (websocket-driver.ws.client::url  (client-ws *client*))))))

(defun new-client (host port path subscriptions &optional password (js-parser #'jsown:parse))
  (let ((client (make-client :ws (ws:make-client (format nil "ws://~a:~a~a"host port path))
                             :js-parser js-parser
                             :subscriptions subscriptions
                             :password password)))    
    (setf *client* client)))

(defun connect (client)
  (let ((ws (client-ws client)))
    (ws:start-connection ws)
    (ws:on :message ws #'process-message)
    (ws:on :error ws #'print-error)
    (ws:on :close ws #'print-error)
    client))

(defun disconnect (client)
  (ws:close-connection (client-ws client))
  (setf (client-ws client) nil)
  client)


