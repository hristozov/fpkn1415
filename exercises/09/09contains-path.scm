(load "../../lib/scm/unit.scm")
(load "05tree.scm")

(define (contains-path tree path)
  (cond
    ((null? path) (tree-empty? tree))
    ((tree-empty? tree) #f)
    ((not (= (value tree) (car path))) #f)
    (else (or (contains-path (left tree) (cdr path))
              (contains-path (right tree) (cdr path))))))

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

(assert-true (contains-path sample-tree '(1 3 5)))
(assert-false (contains-path sample-tree '(1 3)))
(assert-false (contains-path sample-tree '(3 5)))
(assert-true (contains-path sample-tree '(1 3 6 8)))