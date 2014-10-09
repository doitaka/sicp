
(define (print-pascal-line n)
  (print n))


(define (print-pascal-iter count n)
  (cond ((<= count n) (print-pascal-line count)
					  (print-pascal-iter (+ count 1) n))))

(define (print-pascal n)
  (cond ((>= n 1) (print-pascal-iter 1 n))))

(define (main args)
  (apply print-pascal (map string->number (cdr args)))
  0)


