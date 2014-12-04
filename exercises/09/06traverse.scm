(load "../../lib/scm/unit.scm")
(load "05tree.scm")

(define (pre-order tree)
  (if (tree-empty? tree)
      '()
      (append (list (value tree))
              (pre-order (left tree))
              (pre-order (right tree)))))

(define (post-order tree)
  (if (tree-empty? tree)
      '()
      (append (post-order (left tree))
              (post-order (right tree))
              (list (value tree)))))

(define (in-order tree)
  (if (tree-empty? tree)
      '()
      (append (in-order (left tree))
              (list (value tree))
              (in-order (right tree)))))

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

(assert-equal '(1 3 5 6 8 9 7 2 1) (pre-order sample-tree))
(assert-equal '(5 8 6 3 2 1 7 9 1) (post-order sample-tree))
(assert-equal '(5 3 8 6 1 9 2 7 1) (in-order sample-tree))