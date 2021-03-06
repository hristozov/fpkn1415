(load "../../lib/scm/unit.scm")
(load "../10/01graph.scm")

(define (last-element l)
  (car (reverse l)))

; Интересува ни последният връх в пътя - вземаме го с last-element. Следващата
; стъпка е да обходим съседите му и да „залепим“ всеки от тях в края на пътя.
(define (extend p g)
  (let* ((last-vertex (last-element p))
         (neighbours-of-last (neighbours last-vertex g)))
    (map (lambda (neighbour)
           (append p (list neighbour)))         
         neighbours-of-last)))

; Ако искаме да получаваме само ацикличен път като резултат, трябва да направим
; абсолютно същото като единствената разлика е филтрирането на съседите -
; интересуват ни само тези, които още не са били посетени.
(define (extend-acyclic p g)
  (let* ((last-vertex (last-element p))
         (neighbours-of-last (neighbours last-vertex g)))
    (map (lambda (neighbour)
           (append p (list neighbour)))
         (filter (lambda (neighbour)
                   (not (member neighbour p)))
                 neighbours-of-last))))

(define g1 (create-graph '(1 2 3 4)))
(add-edge! 1 2 g1)
(add-edge! 1 3 g1)
(add-edge! 1 1 g1)
(add-edge! 2 3 g1)
(add-edge! 2 4 g1)
(add-edge! 3 4 g1)
(add-edge! 3 1 g1)
(add-edge! 4 2 g1)
(add-edge! 4 1 g1)

(assert-equal '((1 2 4) (1 2 3)) (extend '(1 2) g1))
(assert-equal '((1 1) (1 3) (1 2)) (extend '(1) g1))
(assert-equal '((2 3 1) (2 3 4)) (extend '(2 3) g1))
(assert-equal '((1 2 3 4 1) (1 2 3 4 2)) (extend '(1 2 3 4) g1))

(assert-equal '((1 2 4) (1 2 3)) (extend-acyclic '(1 2) g1))
(assert-equal '((1 3) (1 2)) (extend-acyclic '(1) g1))
(assert-equal '((2 3 1) (2 3 4)) (extend-acyclic '(2 3) g1))
(assert-equal '() (extend-acyclic '(1 2 3 4) g1))
