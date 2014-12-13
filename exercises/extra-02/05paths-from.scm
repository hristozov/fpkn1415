(load "../../lib/scm/unit.scm")
(load "03extend.scm")

; За да намерим всички възможни пътища от връх в графа, ще използваме
; деструктивно добавяне в списък. Идеята е да започнем с път, който съдържа само
; този връх. На всяка стъпка чрез extend-acyclic от предишната задача, ще
; намираме всички възможни разширения на пътя. Ще обхождаме всяко от тях и така
; докато extend-acyclic не започне да връща празни списъци (т.е. стигнали сме до
; пътища, който няма накъде да се разширят).
(define (paths-from v g)
  ; За начална стойност на резултата ползваме пътя, който съдържа само началния
  ; връх.
  (define result (list (list v)))
  (define (helper current-path)
    (let ((current-vertex (last-element current-path)))
      ; Ако този път все още го няма...
      (if (not (member current-path result))
          ; ...ще го добавим в резултата
          (set-cdr! result (cons current-path
                                 (cdr result))))
      ; Повтаряме helper за всички възможни ациклични разширения с една стъпка 
      ; на пътя. В даден момент гарантирано extend-acyclic ще започне да връща
      ; празни списъци, тъй като няма да има как да разширим още пътищата.
      (map helper
           (extend-acyclic current-path g))))
  (helper (list v))
  ; Накрая връщаме резултата.
  result)

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

(assert-equal '((1)
                (1 2 3 4)
                (1 2 3)
                (1 2 4)
                (1 2)
                (1 3 4 2)
                (1 3 4)
                (1 3))
              (acyclic-from 1 g1))
