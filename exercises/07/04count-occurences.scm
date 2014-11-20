(load "../../lib/scm/unit.scm")
(load "../06/04member.scm")

(define (count-occurences l1 l2)
  (define (l1-starts-with-l2? current-l1 current-l2)
    (cond 
      ((null? current-l2) #t)
      ((null? current-l1) #f)
      ((not (= (car current-l1) (car current-l2))) #f)
      (else (l1-starts-with-l2? (cdr current-l1) (cdr current-l2)))))
  (cond
    ((null? l1) 0)
    ((l1-starts-with-l2? l1 l2) (+ 1 (count-occurences (cdr l1) l2)))
    (else (count-occurences (cdr l1) l2))))

(assert= 2 (count-occurences '(1 2 3 4 1 5 1 2 7) '(1 2)))
(assert= 1 (count-occurences '(1 2 3 4 1 5 1 2 7) '(1 2 3)))
(assert= 1 (count-occurences '(1 2 3 4 1 5 1 2 7) '(7)))
(assert= 0 (count-occurences '(1 2 3 4 1 5 1 2 7) '(1 3)))
(assert= 0 (count-occurences '(1 2 3 4 1 5 1 2 7) '(3 7)))
(assert= 1 (count-occurences '(1 2) '(1 2)))
(assert= 1 (count-occurences '(1 2) '(1)))