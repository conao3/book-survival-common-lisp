(defpackage yubin/tests/main
  (:use :cl
        :yubin
        :rove))
(in-package :yubin/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :yubin)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
