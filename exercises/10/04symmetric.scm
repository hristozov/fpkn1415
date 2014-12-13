(load "../../lib/scm/unit.scm")
(load "03edges.scm")

; За да проверим дали е симетричен обхождаме всички ребра и проверяваме за всяко
; ребро (a b) дали съществува съответно ребро (b a). Ако не съществува -
; премахваме го с filter. Накрая проверяваме дали филтрирания списък е със
; същата дължина като списъка на ребрата - т.е. дали има отпаднали ребра, които
; не са симетрични.
(define (symmetric? g)
  (let ((g-edges (edges g)))
    (= (length g-edges)
       (length (filter (lambda (edge)
                         (member (list (cadr edge)
                                       (car edge))
                                 g-edges))
                       g-edges)))))

(define g1 (create-graph '(1 2 3 4)))
(add-edge! 1 2 g1)
(add-edge! 1 3 g1)
(add-edge! 3 1 g1)
(add-edge! 2 1 g1)

(assert-true (symmetric? g1))
(add-edge! 3 4 g1)
(assert-false (symmetric? g1))
(add-edge! 4 3 g1)
(assert-true (symmetric? g1))
