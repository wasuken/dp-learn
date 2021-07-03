(defpackage dp-learn/tests/main
  (:use :cl
   :dp-learn
        :rove))
(in-package :dp-learn/tests/main)

;;; 問題: https://atcoder.jp/contests/dp/tasks/dp_a
(deftest frog-test
	(let ((len 4)
		  (points '(10 30 40 20)))
	  (testing "act1. "
			   (ok (= (frog points))
				   30)))
  (let ((len 2)
		(points '(10 10)))
	(testing "act2. "
			 (ok (= (frog points))
				 0)))
  (let ((len 6)
		(points '(30 10 60 10 60 50)))
	(testing "act3. "
			 (ok (= (frog points))
				 40))))

(deftest knap-test
	(let ((vw-lst '(
					(3 . 30)
					(4 . 50)
					(5 . 60)
					))
		  (n 3)
		  (w 8))
	  (testing "act1."
			   (ok (= (knap n w vw-lst)
					  90))))
  (let ((vw-lst '(
				  (1 . 1000000000)
				  (1 . 1000000000)
				  (1 . 1000000000)
				  (1 . 1000000000)
				  (1 . 1000000000)
				  ))
		(n 5)
		(w 5))
	(testing "act2."
			 (ok (= (knap n w vw-lst)
					5000000000))))
  (let ((vw-lst '(
				  (6 . 5)
				  (5 . 6)
				  (6 . 4)
				  (6 . 6)
				  (3 . 5)
				  (7 . 2)
				  ))
		(n 6)
		(w 15))
	(testing "act3."
			 (ok (= (knap n w vw-lst)
					17))))
  )
