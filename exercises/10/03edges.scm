(load "01graph.scm")

(define (edges g)
  (apply 
    append 
    (map (lambda (vertex)
           (map (lambda (neighbour)
                  (list vertex neighbour))
                (neighbours vertex g)))
         (filter (lambda (vertex)
                   (> (length (neighbours vertex g))
                      0))
                 (vertices g)))))

(define g1 (create-graph '(5 7)))
(add-vertex! 1 g1)
(add-vertex! 2 g1)
(add-vertex! 4 g1)
(add-edge! 1 2 g1)
(add-edge! 1 4 g1)
(add-edge! 5 2 g1)
(assert-equal '((5 2) (1 4) (1 2)) (edges g1))
