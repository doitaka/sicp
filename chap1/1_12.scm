;; input : row number, column number
;; output : number

;; row number and quantity of row's number is same num.
;; row's most left num and most right num is always 1.
;; 
;; line[x][y]
;; if x == 1
;; 	line[x][y] = 1
;; if x > 1
;; 	line[x][y] = line[x-1][y-1] + line[x-1][y]

;; always x >= y

;; if input is invalid, returns 0.


(define (pascal-iter n m)
  (cond ((< n 1) 0)
	((< m 1) 0)
	((< n m) 0)
	((= n 1) 1)
	((> n 1) (+ (pascal-iter (- n 1) (- m 1)) (pascal-iter (- n 1) m)))))
	

(define (main args)
  (print (apply pascal-iter (map string->number (cdr args))))
  0)

