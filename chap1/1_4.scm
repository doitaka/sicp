(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)
  )


(define (main args)
  (print (apply a-plus-abs-b (map string->number (cdr args))))
  0)
