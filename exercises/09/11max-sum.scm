(load "../../lib/scm/unit.scm")
(load "10list-paths.scm")

(define (max-number tree)
  (apply max
         (map (lambda (x) (apply + x)) (list-paths-root tree))))

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

(assert= 19 (max-number sample-tree))
