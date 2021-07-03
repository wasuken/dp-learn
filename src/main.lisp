(defpackage dp-learn
  (:use :cl)
  (:export :frog))
(in-package :dp-learn)

;;; https://atcoder.jp/contests/dp/tasks/dp_a

;;; 参考: https://www.amazon.co.jp/dp/4065128447
;;; 5.3 動的計画法に関する諸概念 code 5.3
(defun chmin (lst i v)
  (let ((newl lst))
	(cond ((> (nth i lst) v)
		   (setf (nth i lst) v))
		  (t lst))))

(defun dp (i lst dpl)
  (cond ((< i (length lst))
		 dpl)
		(t
		 (let ((newdpl (chmin dpl i (+ (nth (1- i) dpl)
									   (abs (- (nth i lst)
											   (nth (1- i) lst)))))))
		   (if (> i 1)
			   (dp (1+ i) lst (chmin newdpl i (+ (nth (- i 2) dpl)
												 (abs (- (nth i lst)
														 (nth (- i 2) lst))))))
			   (dp (1+ i) lst newdpl))))))

(defun frog (points)
  (let* ((len (length points))
		 (dpl (cons 0 (loop for i from 0 to (1- len)
							   collect most-positive-fixnum))))
	(car (reverse (dp 1 points dpl)))))
