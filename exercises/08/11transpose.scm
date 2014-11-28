(load "../../lib/scm/unit.scm")
(load "../06/06nth.scm")

(define (get-nth-column m n)
  (map (lambda (row) 
         (nth row n)) 
       m))

(define (transpose m)
  (define (helper i)
    (if (= i (length m))
        '()
        (cons (get-nth-column m i)
              (helper (+ i 1)))))
  (helper 0))

(assert-equal '((1 4 7) (2 5 8) (3 6 9)) (transpose '((1 2 3) (4 5 6) (7 8 9))))