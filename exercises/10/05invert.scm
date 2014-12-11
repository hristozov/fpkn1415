(load "../../lib/scm/unit.scm")
(load "01graph.scm")

(define (invert g)
  (let ((result (create-graph (vertices g))))
    (map
      (lambda (edge)
        (add-edge! (cadr edge) (car edge) result))
      (edges g))
    result))

(define g1 (create-graph '(1 2 3 4)))
(add-edge! 1 2 g1)
(add-edge! 2 3 g1)
(add-edge! 4 3 g1)

(define g2 (invert g1))
(assert-equal '((1 ()) (2 (1)) (3 (4 2)) (4 ())) g2)
