(define (func1-11-2 n)
  (cond ((< n 3) n)
		(else (f2iter 2 1 0 3 n))))

(define (f2calc a b c) (+ a (* 2 b) (* 3 c)))

(define (f2iter a b c count n)
  (cond ((>= count n) (f2calc a b c))
		(else (f2iter (f2calc a b c) a b (+ count 1) n))))
				

(define (main args)
  (print (apply func1-11-2 (map string->number (cdr args))))
  0)


