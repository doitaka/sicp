
(define (square-root-iter guess x)
  (if (good-enough? guess x)
	guess
	(square-root-iter (improve guess x) x)
	)
  )

(define (improve guess x)
  (average guess (/ x guess))
  )

(define (average x y)
  (/ (+ x y) 2)
  )

(define (square x)
  (* x x)
  )

(define (good-enough? guess x)
  (define new-guess (improve guess x))
  (< (/ (abs (- guess new-guess)) (abs guess)) 0.001)
  )

(define (square-root x)
  (square-root-iter 1.0 x)
  )


(define (main args)
  (print (apply square-root (map string->number (cdr args))))
  0)

;; 1_7.scm の精度の問題を解消するために
;; good-enough? の実装を変更。
;; guess と (improve guess x) の値を比較し、値の変化量が guess に対して一定割合未満に
;; なった場合に true が返るものとした。
;; これにより、小さい値、大きい値でも処理が正常に行われるようになった。


