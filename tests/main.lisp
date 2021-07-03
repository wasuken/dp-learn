(defpackage dp-learn/tests/main
  (:use :cl
   :dp-learn
        :rove))
(in-package :dp-learn/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :dp-learn)' in your Lisp.

;; (deftest test-target-1
;;   (testing "should (= 1 1) to be true"
;;     (ok (= 1 1))))


(deftest frog-test
	(let ((len 4)
		  (points '(10 30 40 20)))
	  (testing "act1. "
			   (ok (= (frog points))
				   30)))
  (let ((len 2)
		(points '(10 10)))
	(testing "act1. "
			 (ok (= (frog points))
				 0)))
  (let ((len 6)
		(points '(30 10 60 10 60 50)))
	(testing "act1. "
			 (ok (= (frog points))
				 40))))
