
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
;; 例えば、4.0e100 の平方根は 2.0e50 だが、
;; (* 2.0e50 2.0e50) を実行しても結果は 4.0e100 にはならず 4.000000000000001e100 になる。
;; このような実数計算上の誤差が、精度の制限により常に 0.001 より大きくなるため、
;; good-enough? が true になることがなく、sqrt の実行が終了しなくなる。


