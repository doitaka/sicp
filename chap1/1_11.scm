
(define (func1-11 n)
  (cond ((< n 3) n)
		(else (+ (func1-11 (- n 1))
				 (* 2 (func1-11 (- n 2)))
				 (* 3 (func1-11 (- n 3)))))))
				

(define (main args)
  (print (apply func1-11 (map string->number (cdr args))))
  0)


