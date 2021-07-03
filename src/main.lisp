(defpackage dp-learn
  (:use :cl)
  (:export :frog :knap))
(in-package :dp-learn)

;;; https://atcoder.jp/contests/dp/tasks/dp_a

;;; 参考: https://www.amazon.co.jp/dp/4065128447
;;; 5.3 動的計画法に関する諸概念 code 5.3
(defun chmin (lst i v)
  (let ((newl lst))
	(cond ((> (nth i lst) v)
		   (setf (nth i lst) v)
		   lst)
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


;;; 参考: https://www.amazon.co.jp/dp/4065128447
;;; code 5.7

;;; 問題: https://atcoder.jp/contests/dp/tasks/dp_d
(defun chmax (dpm i w v)
  (let ((newdpm dpm))
	(cond ((< (nth w (nth i dpm)) v)
		   (setf (nth w (nth i newdpm)) v)
		   newdpm)
		  (t dpm)))
  )

(defun knap-w-dp (i w n wei vw-lst dpm)
  (cond ((> w wei)
		 dpm)
		(t
		 (let ((newdpm dpm))
		   (when (>= (- w (car (nth i vw-lst))) 0)
			 (setf newdpm
				   (chmax dpm (1+ i) w (+ (nth (- w (car (nth i vw-lst)))
											   (nth i dpm))
										  (cdr (nth i vw-lst)))))
			 )
		   (knap-w-dp i (1+ w) n wei vw-lst
					  (chmax newdpm (1+ i) w (nth w (nth i newdpm)))
					  ))
		 ))
  )

(defun knap-n-dp (i n wei vw-lst dpm)
  (cond ((>= i n)
		 dpm)
		(t
		 (knap-n-dp (1+ i) n wei vw-lst
					(knap-w-dp i 0 n wei vw-lst dpm)))))

;;; Knapsack
(defun knap (n wei vw-lst)
  (let ((dpm (loop for i from 0 to n
				   collect (loop for j from 0 to wei
								 collect 0))))
	(car (reverse (car (reverse (knap-n-dp 0 n wei vw-lst dpm)))))
	))
