
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x) x)
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
  (< (abs (- (square guess) x)) 0.001)
  )

(define (sqrt x)
  (sqrt-iter 1.0 x)
  )


(define (main args)
  (print (apply sqrt (map string->number (cdr args))))
  0)


;; 小さい値に対して用いる場合。
;; 平方根の値が0.001より小さくなる場合に満足な結果が得られない。
;; 例えば、 x = 0.00001 の場合と、x = 0.000001 の場合で得られる結果が同じになる。
;;
;; 大きい値に対して用いる場合。
;;
