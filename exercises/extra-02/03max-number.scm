(load "../../lib/scm/unit.scm")

(load "../09/05tree.scm")

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

(define (list2number l)
  (define (helper current-l result)
    (if (null? current-l)
        result
        (helper (cdr current-l)
                (+ (* 10 result) (car current-l)))))
  (helper l 0))

(define (max-number-root tree)
  (apply max
         (map list2number (list-paths-root tree))))

(define (max-number-leaves tree)
  (apply max
         (map list2number (list-paths-leaves tree))))

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

(assert= 123589 (list2number '(1 2 3 5 8 9)))
(assert= 1972 (max-number-root sample-tree))
(assert= 8631 (max-number-leaves sample-tree))
