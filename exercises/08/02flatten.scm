(load "../../lib/scm/unit.scm")

(define (flatten l)
  (cond
    ((null? l) l)
    ((list? (car l)) (append 
                       (flatten (car l)) 
                       (flatten (cdr l))))
    (else (cons (car l)
                (flatten (cdr l))))))

(assert-equal '(1 2 3 4 5 6) (flatten '((() 1) 2 (3 4 5 ()) ((6)) ())))
