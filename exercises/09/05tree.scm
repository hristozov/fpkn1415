(load "../../lib/scm/unit.scm")

(define (left tree) (cadr tree))

(define (right tree) (caddr tree))

(define (value tree) (car tree))

(define (make-tree value left right)
  (list value left right))

(define (empty-tree) '())

(define (tree-empty? tree)
  (null? tree))

(define (leaf? tree)
  (and (not (tree-empty? tree))
       (tree-empty? (left tree))
       (tree-empty? (right tree))))

(assert-equal 
  '(1
    (3
      (5 () ())
      (6
        (8 () ())
        ()))
    (9
      ()
      (7
        (2 () ())
        (1 () ()))))
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

(assert-true (tree-empty? (empty-tree)))
(assert-false (tree-empty? (make-tree 1 (empty-tree) (empty-tree))))
(assert-equal 1 (value (make-tree 1 (empty-tree) (empty-tree))))
(assert-equal (empty-tree) (left (make-tree 1 (empty-tree) (empty-tree))))
(assert-equal (empty-tree) (right (make-tree 1 (empty-tree) (empty-tree))))
(assert-false (leaf? (make-tree 1 (make-tree 3 (empty-tree) (empty-tree)) (empty-tree))))
(assert-false (leaf? (empty-tree)))
(assert-true (leaf? (make-tree 1 (empty-tree) (empty-tree))))
