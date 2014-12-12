(load "../../lib/scm/unit.scm")
(load "05tree.scm")

(define (level tree n)
  (define (helper current-tree current-level)
    (cond
      ((tree-empty? current-tree) '())
      ((= current-level n) (list (value current-tree)))
      (else (append (helper (left current-tree) (+ current-level 1))
                    (helper (right current-tree) (+ current-level 1))))))
  (helper tree 0))

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

(assert-equal '(1) (level sample-tree 0))
(assert-equal '(3 9) (level sample-tree 1))
(assert-equal '(5 6 7) (level sample-tree 2))
(assert-equal '(8 2 1) (level sample-tree 3))
(assert-equal '() (level sample-tree 4))
