(in-package #:cl-obs-websocket)

(defmacro with-keys (keys obj &body body)
  (let ((pkeys (process-keys keys)))
    `(destructuring-bind (&key ,@pkeys &allow-other-keys) (process-obj ',keys ,obj)
       (declare (ignorable ,@pkeys))
       ,@body)))

(defmacro define-request (id &optional data-fields optional)
  (let ((name (if (listp id) (car id) (intern (de-camel id)))))
    `(progn
       (defun ,name (,@(get-args data-fields) &optional,@(get-args optional) (client *client*))
         (multiple-value-bind (request id)
             (make-request
              ,(if (listp id)
                   (second id)
                   id)
              (list* :obj (remove nil (cdr (jsown:new-js
                                             ,@(get-fields data-fields)
                                             ,@(get-fields optional))) :key #'cdr))) ;:fixme remove :false?
           (send-message (make-message 6 request) client)
           (values (get-response id client (client-js-parser client))
                   id)))
       (export ',name :cl-obs-websocket))))

(defun make-exports (name slots)
  (append (list name)
          (loop :for slot :in slots
                :collect (intern (s+ name '- slot)))))

(defmacro define-event (name &optional slots)
  (let* ((name (intern (de-camel name)))
         (slot-names  (mapcar (lambda (s) (intern (de-camel s))) slots))
         (reader (intern (s+ 'read- name)))
         (exports (make-exports name slot-names)))
    `(progn (defstruct (,name (:include event))
              ,@slot-names)
            (defun ,reader  (msg)
              (with-keys (,@(loop :for slot :in slots
                                  :for name :in slot-names
                                  :collect `(,name ,slot)))msg
                (,(intern (string-upcase (s+ 'make- name))) ,@(make-plist slot-names))))
            (export ',exports))))
