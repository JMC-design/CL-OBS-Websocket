(in-package #:cl-obs-websocket)

(defparameter *socket-close-code*
  '((0 . :dont-close)
    (4000 . :unknown-reason)
    (4002 . :message-decode-error)
    (4003 . :missing-data-field)
    (4004 . :invalid-data-field-type)
    (4005 . :invalid-data-field-value)
    (4006 . :unknown-op-code)
    (4007 . :not-identified)
    (4008 . :already-identified)
    (4009 . :authentication-failed)
    (4010 . :unsupported-rpc-version)
    (4011 . :session-invalidated)
    (4012 . :unsupported-feature)))

(defparameter *request-batch-execution-type*
  '((-1 . :none)
    (0 . :serial-realtime)
    (1 . :serial-frame)
    (2 . :parallel)))

(defparameter *request-status*
  '((0 . :unknown)
    (10 . :no-error)
    (100 . :success)
    (203 . :missing-request-type)
    (204 . :uknown-request-type)
    (205 . :generic-error)
    (206 . :unsupported-request-batch-execution-type)
    (300 . :missing-request-field)
    (301 . :missing-request-data)
    (400 . :invalid-request-field)
    (401 . :invalid-request-field-type)
    (402 . :request-field-out-of-range)
    (403 . :request-field-empty)
    (404 . :too-many-request-fields)
    (500 . :output-running)
    (501 . :output-not-runing)
    (502 . :output-paused)
    (503 . :output-not-paused)
    (504 . :output-disabled)
    (505 . :studio-mode-active)
    (506 . :studio-mode-not-active)
    (600 . :resource-not-found)
    (601 . :resource-already-exists)
    (602 . :invalid-resource-type)
    (603 . :not-enough-resources)
    (604 . :invalid-resource-state)
    (605 . :invalid-input-kind)
    (606 . :resource-not-configurable)
    (607 . :invalid-filter-kind)
    (700 . :resource-creation-failed)
    (701 . :resource-action-failed)
    (702 . :request-processing-failed)
    (703 . :cannot-act)))

(defparameter *subscriptions*
  '(:general :config :scenes :inputs :transitions :filters :outputs :scene-items :media-input
    :vendors :ui :input-volume-meters :input-active-state-changed
    :input-show-stated-changed :scene-item-transformed-changed))

(defparameter *event-subscription*
  #(:none :general :config :scenes :inputs :transitions :filters :outputs :scene-items :media-input :vendors :ui nil nil nil nil nil :input-volume-meters :input-active-state-changed :input-show-stated-changed :scene-item-transformed-changed))

(defun encode-subscriptions (subscriptions)
  (loop :for sub :in subscriptions :sum (ash 1 (1- (position sub *event-subscription*)))))

(defun decode-subscriptions (integer)
  (loop :for i :below (integer-length integer)
        :when (logbitp i integer)
          :collect (aref *event-subscription* (1+ i))))

(defmacro agets (name list)
  `(defun ,name (i)
     (cdr (assoc i ,list ))))

(agets get-request-status *request-status*)
(agets get-close-code *socket-close-code*)
(agets get-batch-execution-type *request-batch-execution-type*)
