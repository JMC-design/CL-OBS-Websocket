(in-package #:cl-obs-websocket)

(defmacro with-keys (keys obj &body body)
  (let ((pkeys (process-keys keys)))
    `(destructuring-bind (&key ,@pkeys &allow-other-keys) (process-obj ',keys ,obj)
       (declare (ignorable ,@pkeys))
       ,@body)))


(defmacro define-request (id &optional data-fields optional)
  (let ((name (if (listp id) (car id) (intern (de-snake id)))))
    `(defun ,name (,@(get-args data-fields)
                   &optional,@(get-args optional) (client *client*))
       (multiple-value-bind (request id)
           (make-request
            ,(if (listp id)
                 (second id)
                 id)
            (jsown:new-js
              ,@(get-fields data-fields)
              ,@(get-fields optional))) ;:fixme
         (send-message (make-message 6 request) client)
         (get-response id client (client-js-parser client))))))

-(defmacro define-event (name &optional slots)
  (let* ((name (intern (de-snake name)))
         (slot-names  (mapcar (lambda (s) (intern (de-snake s))) slots))
         (reader (intern (u:s+ 'read- name))))
    `(progn (defstruct (,name (:include event))
              ,@slot-names)
            (defun ,reader  (msg)
              (with-keys (,@(loop :for slot :in slots
                                  :for name :in slot-names
                                  :collect `(,name ,slot)))msg
                (,(intern (string-upcase (u:s+ 'make- name))) ,@(make-plist slot-names)))))))
