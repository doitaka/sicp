
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
	guess
	(cube-root-iter (improve guess x) x)
	)
  )

(define (improve guess x)
  (average guess (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
  )

(define (average x y)
  (/ (+ x y) 2)
  )

(define (cube x)
  (* x x x)
  )

(define (good-enough? guess x)
  (define new-guess (improve guess x))
  (< (/ (abs (- (cube guess) (cube new-guess))) (abs guess)) 0.001)
  )

(define (cube-root x)
  (cube-root-iter 1.0 x)
  )


(define (main args)
  (print (apply cube-root (map string->number (cdr args))))
  0)

;; 1_7_2.scm を元に作成した立方根を求めるプログラム。


