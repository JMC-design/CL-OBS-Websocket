(in-package #:cl-obs-websocket)

(defun find-sym (string keys)
  (loop :for key :in keys
        :for found := (or (and (listp key) (string-equal string (second key)) (car key))
                          (and (string-equal (u::stringify key #'string-downcase) string)key))
        :until found
        :finally (return found)))

(defun process-obj (keys obj)
  (declare (optimize debug))
  (loop :with pkeys := (process-keys keys t)
        :for (key . value) :in (cdr obj)
        :for sym := (find-sym key keys)
        :when (member key pkeys :test #'string-equal)
          :collect (u:kintern sym t)
          :and
            :collect value))

(defun encode-strings (a b)
  (cl-base64:usb8-array-to-base64-string
   (ironclad:digest-sequence :sha256 (ironclad:ascii-string-to-byte-array (u:s+ a b)))))

(defun get-args (list)
  (loop :for (symbol string) :in list
        :collect symbol))

(defun get-fields (list)
  (loop :for (symbol string) :in list
        :collect `(,string ,symbol)))

(defun make-plist (names)
  (loop :for name :in names
        :collect (u:kintern name)
        :collect name))

(defun process-keys (keys &optional strings)
  (declare (optimize debug))
  (loop :for thing :in keys
        :if (listp thing)
          :collect (if strings
                       (second thing)
                       (car thing))
        :else
          :collect (if strings
                       (u::stringify thing #'string-downcase)
                       thing)))

(defun de-camel (string)
  (string-upcase (concatenate 'string
                              (loop :for char :across string
                                    :for i :from 0
                                    :if (and (upper-case-p char)
                                             (not (zerop i)))
                                      :collect #\-
                                      :and
                                        :collect char
                                    :else
                                      :collect char))))
(defun get-response (id client js-parser)
  (loop :repeat 18
        :for i := .000001 :then (+ i i) ;:fixme
        :for msg := (gethash id (client-responses client))
        :until msg
        :finally (return (if (eql js-parser #'jsown:parse)
                             msg
                             (funcall js-parser (jsown:to-json msg))))
        :do (cl:sleep i)))


(defgeneric handle-event (event)
  (:method (event) (print event)))

(defun create-event (type obj)
  (declare (optimize debug))'
  (let ((reader (find-symbol (u:s+ 'read- (de-camel type)) :cl-obs-websocket)))
    (funcall reader obj)))

(defun make-mods (&optional control shift alt command)
  (macrolet ((switch (a)  `(if ,a t :false)))
   (jsown:new-js ("control" (switch control)) ("shift" (switch shift)) ("alt" (switch alt)) ("command" (switch command)))))
