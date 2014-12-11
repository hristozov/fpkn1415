(load "../../lib/scm/unit.scm")
(load "02edges.scm")

(define (degree-out v g)
  (length (neighbours v g)))

(define (degree-in v g)
  (length (filter (lambda (vertex)
                    (member v
                            (neighbours vertex g)))
                  (vertices g))))

(define (degree v g)
  (+ (degree-out v g)
     (degree-in v g)))

(define g1 (create-graph '(1 2 3)))
(add-edge! 1 2 g1)
(add-edge! 1 3 g1)
(add-edge! 2 3 g1)
(add-edge! 2 1 g1)
(add-edge! 3 1 g1)

(assert= 2 (degree-out 1 g1))
(assert= 2 (degree-out 2 g1))
(assert= 1 (degree-out 3 g1))
(assert= 2 (degree-in 1 g1))
(assert= 1 (degree-in 2 g1))
(assert= 2 (degree-in 3 g1))
(assert= 4 (degree 1 g1))
(assert= 3 (degree 2 g1))
(assert= 3 (degree 3 g1))
