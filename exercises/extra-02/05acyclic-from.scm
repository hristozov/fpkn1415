(load "../../lib/scm/unit.scm")
(load "03extend.scm")

(define (acyclic-from v g)
  (define result (list (list v)))
  (define (helper current-path)
    (let ((current-vertex (last-element current-path)))
      (if (not (member current-path result))
          (set-cdr! result (cons current-path
                                 (cdr result))))
      (map helper
           (extend-acyclic current-path g))))
  (helper (list v))
  result)

(define g1 (create-graph '(1 2 3 4)))
(add-edge! 1 2 g1)
(add-edge! 1 3 g1)
(add-edge! 1 1 g1)
(add-edge! 2 3 g1)
(add-edge! 2 4 g1)
(add-edge! 3 4 g1)
(add-edge! 3 1 g1)
(add-edge! 4 2 g1)
(add-edge! 4 1 g1)

(assert-equal '((1)
                (1 2 3 4)
                (1 2 3)
                (1 2 4)
                (1 2)
                (1 3 4 2)
                (1 3 4)
                (1 3))
              (acyclic-from 1 g1))
