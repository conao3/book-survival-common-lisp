(defpackage #:yubin
  (:use #:cl)
  (:export #:get-place))
(in-package #:yubin)

(defun get-place (zipcode)              ; ②
  (let* ((url (quri:make-uri :defaults "http://zipcloud.ibsnet.co.jp/api/search"
                             :query `(("zipcode" . ,zipcode)))) ; Quri で URL を作る
         (response (jonathan:parse (dex:get url))) ; HTTP リクエストを⾏う
         (result (first (getf response :|results|))))
    (if result (concatenate 'string     ; 結果を返す
                            (getf result :|address1|)
                            (getf result :|address2|)
                            (getf result :|address3|))
      (error (format nil "~A: ~S (Code=~A)" ; エラーにする
                     (getf response :|message|)
                     zipcode
                     (getf response :|status|))))))
