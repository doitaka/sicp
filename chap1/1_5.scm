(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y)
  )


(define (main args)
  (print (test 0 (p)))
  0)

;; 適用順評価（applicative-order evaluation）の場合、(test 0 (p)) において、まず (p) が評価されるため、
;; 無限ループに陥り、プログラムは正常に終了しない。
;; 正規順評価（normal-order evaluation）の場合、(test 0 (p)) において、まず (= 0 0) が評価され、
;; 結果 true が得られ、値として 0 が返され、プログラムの実行が正常終了する。
;; (p) が評価されることはない。
