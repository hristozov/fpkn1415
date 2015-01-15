(load "../../lib/scm/unit.scm")

(define (solve l)
  (define (helper-asc l)
    (cond
      ((or (null? l) (null? (cdr l))) l)
      ((>= (car l) (cadr l)) (cons (car l) (helper-desc (cdr l))))
      (else (helper-asc (cdr l)))))
  (define (helper-desc l)
    (cond
      ((or (null? l) (null? (cdr l))) l)
      ((<= (car l) (cadr l)) (cons (car l) (helper-asc (cdr l))))
      (else (helper-desc (cdr l)))))
  (helper-desc l))

(assert-equal '(1 6 1 16 10)
              (solve '(10 8 6 4 1 3 5 6 4 2 1 9 12 16 14 13 10)))