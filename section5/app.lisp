(ql:quickload '(:ningle :cl-mustache :yubin) :silent t)

(defun render (template &optional context)
  (format nil "\
<!doctype html>
  <html>
  <head>
  <meta charset='utf-8'>
  <title>yubin</title>
  </head>
  <body>
    ~A
  </body>
</html>"
          (mustache:render* template context)))

(defvar *app* (make-instance 'ningle:app))

(defun root-handler (params)
  (let ((postal-code (cdr (assoc "postal_code" params :test #'equal))))
    (if (stringp postal-code)
        (handler-case (render "〒{{postal-code}}は「{{place}}」です"
                              `(("postal-code" . ,postal-code)
                                ("place" . ,(yubin:get-place postal-code))))
          (error (e)
                 (render (princ-to-string e))))
      (render "\
<form>
  郵便番号: <input type='text' name='postal_code'> 
  <input type='submit'>
</form>"))))

(setf (ningle:route *app* "/") #'root-handler)

*app*
