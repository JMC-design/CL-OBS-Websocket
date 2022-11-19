(in-package #:cl-obs-websocket)

(defun print-error (&key code reason);:fixme 
  (u:fp (get-close-code code) reason))

(defun make-message (opcode data)
  (jsown:to-json (jsown:new-js
                   ("op" opcode)
                   ("d" data))))

(defun send-message (msg client)
  (ws:send (client-ws client) msg :type :text))

(defun gen-auth-string (authentication)
  (with-keys (salt challenge) authentication
      (encode-strings (encode-strings (client-password *client*) salt) challenge)))

(defun identify (data)
  (with-keys (authentication) data
    (let ((auth-string (gen-auth-string authentication)))
      (send-message
       (make-message
        1 (jsown:new-js
            ("rpcVersion" 1)
            ("authentication" auth-string)
            ("eventSubscriptions" (encode-subscriptions
                                   (client-subscriptions *client*)))))
       *client*))))

(defun reidentify (client &rest subs)
  (send-message
   (make-message
    3 (jsown:new-js ("eventSubscriptions"
                     (encode-subscriptions subs))))
   client))


(defun process-event (data)
  (declare (optimize debug))
  (with-keys ((type "eventType") (data "eventData") (intent "eventIntent")) data
    (handle-event (create-event type data))))

(defun process-response (data) ;:fixme standardize return values
  (with-keys ((type "requestType")
              (id "requestId")
              (status "requestStatus")
              (d "responseData")) data
    (with-keys (result code) status
      (let ((return-code (get-request-status code)))
        (if result
            (setf (gethash id (client-responses *client*)) (if d
                                               d 
                                               return-code))
            (setf (gethash id (client-responses *client*)) return-code))))))

(defun process-batch (data)
  data)

(defun verify-rpc-version (d)
  (with-keys ((version "negotiatedRpcVersion")) d
    version))

(defun process-message (msg)
  (declare (optimize debug))
  (with-keys (op d) (jsown:parse msg)
    (if op
        (case op
          (0 (identify d))
          (2 (verify-rpc-version d))
          (5 (process-event d))
          (7 (process-response d))
          (9 (process-batch d)))
        msg)))



 
