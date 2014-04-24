
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
		(else else-clause)
		)
  )


(define (sqrt-iter guess x)
  (if (good-enough? guess x)
;;  (new-if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x) x)
	)
  )

;; (define (sqrt-iter guess x)
;;   (cond ((good-enough? guess x) guess)
;; 		(else (sqrt-iter (improve guess x) x))
;; 		)
;;   )

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


;; 通常手続き（new-if）の場合、適用順序評価のため predicate の値に関わらず、
;; 手続き呼び出しの時点で then-clause と else-clause がどちらも評価される。
;; このため、good-enough? が true になっても sqrt-iter が呼び出され続け、プログラムの実行が終了しなくなる。
;;
;; if は特殊形式なので、predicate の値により then-clause と else-clause のどちらかだけが評価される。
;; このため、good-enough? が true になると、 guess のみが評価され、sqrt-iter の再帰呼び出しが止まり、
;; プログラムの実行が終了する。
;;
;; なお、new-if を使わず、直接 sqrt-iter 内で cond を使用した際は、if の場合と同様の結果となる。
