(load "../../lib/scm/unit.scm")

(define (vertices g)
  (map car g))

(define (neighbours v g)
  (cadr (assoc v g)))

(define (intersection l1 l2)
  (if (null? l1)
      '()
      (let ((l1-head (car l1)))
        (if (member l1-head l2)
            (cons l1-head (intersection (cdr l1) l2))
            (intersection (cdr l1) l2)))))

(define (graph-intersection g1 g2)
  (let* ((vertices-g1 (vertices g1))
         (vertices-g2 (vertices g2))
         (common-vertices (intersection vertices-g1 vertices-g2)))
    (map (lambda (vertex)
           (list vertex
                 (intersection (neighbours vertex g1)
                               (neighbours vertex g2))))
         common-vertices)))

(assert-equal '((1 (2)) (2 (1)))
              (graph-intersection
                '((1 (2 3)) (2 (1 3)) (3 (1)))
                '((1 (2)) (2 (1)))))