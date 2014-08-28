
(define (count-change amount) (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
		((or (< amount 0) (= kinds-of-coins 0)) 0)
		(else (+ (cc amount (- kinds-of-coins 1))
				 (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
		((= kinds-of-coins 2) 5)
		((= kinds-of-coins 3) 10)
		((= kinds-of-coins 4) 25)
		((= kinds-of-coins 5) 50)))



(define (main args)
  (print (apply count-change (map string->number (cdr args))))
  0)


;; (cc 100 5)
;; - (cc 100 4)
;;   - (cc 100 3)
;;     - (cc 100 2)
;;       - (cc 100 1)
;;         - (cc 100 0) = 0
;;         - (cc 99 1)
;;           - (cc 99 0) = 0
;;           - (cc 98 1)
;;             - (cc 98 0) = 0
;;             - (cc 97 1)
;;               ...
;;       - (cc 95 2)
;;         - (cc 95 1)
;;           - (cc 95 0)
;;           - (cc 94 1)
;;             ...
;;         - (cc 90 2)
;;           - (cc 90 1)
;;             ...
;;           - (cc 85 2)
;;             ...
;;     - (cc 90 3)
;;       - (cc 90 2)
;;       - (cc 80 3)
;;   - (cc 75 4)
;;     - (cc 75 3)
;;     - (cc 50 4)
;;
;; - (cc 50 5)
;;   - (cc 50 4)
;;   - (cc 25 5)
