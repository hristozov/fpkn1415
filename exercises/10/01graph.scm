(load "../../lib/scm/unit.scm")
(load "../08/03filter.scm")

(define (insert! k v a)
  (set-cdr! a
            (cons (list k v)
                  (cdr a))))

(define (create-graph vertices)
  (map (lambda (v)
         (list v '()))
       vertices))

(define (add-vertex! v g)
  (insert! v '() g))

(define (add-edge! a b g)
  (let ((start-vertex (assq a g)))
    (set-cdr! start-vertex
              (list (cons b (cadr start-vertex))))))

(define (vertices g)
  (map car g))

(define (neighbours v g)
  (cadr (assq v g)))

(define g1 (create-graph '(5 7)))
(add-vertex! 1 g1)
(add-vertex! 2 g1)
(add-vertex! 4 g1)
(assert-equal '((5 ()) (4 ()) (2 ()) (1 ()) (7 ())) g1)
(assert-equal '(5 4 2 1 7) (vertices g1))
(assert-equal '() (neighbours 2 g1))

(add-edge! 1 2 g1)
(add-edge! 1 4 g1)
(add-edge! 5 2 g1)
(assert-equal '((5 (2)) (4 ()) (2 ()) (1 (4 2)) (7 ())) g1)

(define g2 '((4 (1 2)) (5 (1 2 3))))
(assert-equal '(1 2 3) (neighbours 5 g2))
