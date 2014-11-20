(load "../../lib/scm/unit.scm")

(define (cartesian-product l1 l2)
  (define (mul-l2 x l2)
    (if (null? l2)
        '()
        (cons (list x (car l2))
              (mul-l2 x (cdr l2)))))
  (if (null? l1)
      '()
      (append (mul-l2 (car l1) l2)
              (cartesian-product (cdr l1) l2))))

(assert-equal '((1 4) (1 5) (1 6) (2 4) (2 5) (2 6) (3 4) (3 5) (3 6))
              (cartesian-product '(1 2 3) '(4 5 6)))