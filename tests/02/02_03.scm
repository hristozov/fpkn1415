(load "../../lib/scm/unit.scm")

(define (vertices g)
  (map car g))

(define (neighbours v g)
  (cadr (assoc v g)))

(define (union l1 l2)
  (if (null? l1)
      l2
      (let ((l1-head (car l1)))
        (if (member l1-head l2)
            (union (cdr l1) l2)
            (cons l1-head (union (cdr l1) l2))))))

(define (graph-union g1 g2)
  (let* ((vertices-g1 (vertices g1))
         (vertices-g2 (vertices g2))
         (all-vertices (union vertices-g1 vertices-g2)))
    (map (lambda (vertex)
           (list vertex
                 (union (neighbours vertex g1)
                        (neighbours vertex g2))))
         all-vertices)))

(assert-equal '((1 (2 3 5)) (2 (1 3 4)) (3 (1)) (4 (2)) (5 (2)))
              (graph-union
                '((1 (2 3)) (2 (1 3)) (3 (1)) (4 ()) (5 ()))
                '((1 (5)) (2 (4)) (3 ()) (4 (2)) (5 (2)))))