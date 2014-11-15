(load "../../lib/scm/unit.scm")
(load "../04/04accumulate.scm")

(define (fact n)
  (accumulate identity * 1 1 plus1 n))

(define (plus1 x)
  (+ x 1))

(define (left-side m n)
  (define (term i)
    (/ 1
       (accumulate (lambda (j)
                     (+ i j))
                   *
                   1
                   0
                   plus1
                   m)))
  (accumulate term
              +
              0
              1
              plus1
              n))
(define (right-side m n)
  (* (/ 1 m)
     (- (/ 1 (fact m))
        (/ 1 (accumulate (lambda (i)
                           (+ n i))
                         *
                         1
                         1
                         plus1
                         m)))))

(define (check m n)
  (= (left-side m n)
     (right-side m n)))

(assert-true (check 2 2))