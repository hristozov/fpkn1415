(load "../../lib/scm/unit.scm")
(load "05tree.scm")

(define (list-paths-leaves tree)
  (define (helper current-tree current-path)
    (cond
      ((leaf? current-tree) (list 
                              (cons (value current-tree)
                                    current-path)))
      ((tree-empty? current-tree) '())
      (else (append (helper (left current-tree)
                            (cons (value current-tree)
                                  current-path))
                    (helper (right current-tree)
                            (cons (value current-tree)
                                  current-path))))))
  (helper tree '()))

(define (list-paths-root tree)
  (define (helper current-tree current-path)
    (cond
      ((leaf? current-tree) (list 
                              (append current-path
                                      (list (value current-tree)))))
      ((tree-empty? current-tree) '())
      (else (append (helper (left current-tree)
                            (append current-path
                                    (list (value current-tree))))
                    (helper (right current-tree)
                            (append current-path
                                    (list (value current-tree))))))))
  (helper tree '()))

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

(assert-equal '((5 3 1) (8 6 3 1) (2 7 9 1) (1 7 9 1))
              (list-paths-leaves sample-tree))

(assert-equal '((1 3 5) (1 3 6 8) (1 9 7 2) (1 9 7 1))
              (list-paths-root sample-tree))
