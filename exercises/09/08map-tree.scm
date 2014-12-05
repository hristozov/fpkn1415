(load "../../lib/scm/unit.scm")
(load "05tree.scm")

(define (map-tree f tree)
  (if (tree-empty? tree)
    '()
    (make-tree (f (value tree))
      (map-tree f (left tree))
      (map-tree f (right tree)))))

(define sample-tree
  (make-tree 1 
             (make-tree 3
                        (make-tree 5
                                   (empty-tree)
                                   (empty-tree))
                        (make-tree 6
                                   (make-tree 8 (empty-tree) (empty-tree))
                                   (empty-tree)))
             (make-tree 9
                        (empty-tree)
                        (make-tree 7
                                   (make-tree 2 (empty-tree) (empty-tree))
                                   (make-tree 1 (empty-tree) (empty-tree))))))

(assert-equal 
  '(1
    (9
      (25 () ())
      (36
        (64 () ())
        ()))
    (81
      ()
      (49
        (4 () ())
        (1 () ())))) 
  (map-tree (lambda (x) (* x x)) sample-tree))