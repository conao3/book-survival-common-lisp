(defpackage yubin/tests/main
  (:use :cl
        :yubin
        :rove))
(in-package :yubin/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :yubin)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))

(deftest get-place
  (testing "should return the address for a given postal code in a number"
           (ok (equal (yubin:get-place 6380321) "奈良県吉野郡天川村坪内") "6380321 -> 奈良県吉野郡天川村坪内")
           (ok (equal (yubin:get-place 1500000) "東京都渋⾕区") "1500000 -> 東京都渋⾕区"))
  (testing "should return the address for a given postal code in a string"
           (ok (equal (yubin:get-place "6380321") "奈良県吉野郡天川村坪内") "\"6380321\" -> 奈良県吉野郡天川村坪内")
           (ok (equal (yubin:get-place "150-0000") "東京都渋⾕区") "\"150-0000\" -> 東京都渋⾕区"))
  (testing "should raise an error for an unknown postal code"
           (ok (signals (yubin:get-place 6068501))))
  (testing "should raise an error for non postal code"
           (ok (signals (yubin:get-place "clfreaks")))))                                               
