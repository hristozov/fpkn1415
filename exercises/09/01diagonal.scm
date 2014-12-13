(load "../../lib/scm/unit.scm")
(load "../06/06nth.scm")

; Първи вариант - работа изцяло с индекси. Вземаме i-тия елемент от i-тия ред.
(define (diagonal m)
  (define (helper i)
    (if (>= i (length m))
        '()
        (cons (nth (nth m i)
                   i)
              (helper (+ i 1)))))
  (helper 0))

; Втори вариант, без индекси - взема елементът най-горе и най-вляво в матрицата.
; Изпълнява се рекурсивно като от матрицата се махат първия ред и първата колона
; и пак вземаме елемента най-горе и най-вляво (т.е. следващият елемент в
; диагонала).
(define (diagonal2 m)
  (if (null? m)
      '()
      (cons (caar m)
            (diagonal2 (cdr (map cdr m))))))

; Вторичен диагонал с индекси, подобен на diagonal. Разликата е, че смятаме
; съответния индекс на колоната.
(define (second-diagonal m)
  (define (helper i)
    (if (>= i (length m))
        '()
        (cons (nth (nth m i)
                   (- (length m) i 1))
              (helper (+ i 1)))))
  (helper 0))

(define (last l)
  (if (null? (cdr l))
      (car l)
      (last (cdr l))))

(define (strip-last l)
  (if (null? (cdr l))
      '()
      (cons (car l)
            (strip-last (cdr l)))))

; Вариант без индекси на вторичния диагонал. Идеята отново е подобна на варианта
; без индекси на главния диагонал (diagonal2) - вземаме елемента най-горе и
; най-вдясно, след което на рекурсивното извикване махаме първия ред и
; последната колона.
(define (second-diagonal2 m)
  (if (null? m)
      '()
      (cons (last (car m))
            (second-diagonal2 (cdr (map strip-last m))))))

(assert-equal '(1 5 9) (diagonal '((1 2 3) (4 5 6) (7 8 9))))
(assert-equal '(1) (diagonal '((1))))
(assert-equal '() (diagonal '()))
(assert-equal '(1 5 9) (diagonal2 '((1 2 3) (4 5 6) (7 8 9))))
(assert-equal '(1) (diagonal2 '((1))))
(assert-equal '() (diagonal2 '()))
(assert-equal '(3 5 7) (second-diagonal '((1 2 3) (4 5 6) (7 8 9))))
(assert-equal '(1 2) (strip-last '(1 2 3)))
(assert-equal '((1 2 3) (4 5 6)) (strip-last '((1 2 3) (4 5 6) (7 8 9))))
(assert-equal '((1 2) (4 5) (7 8)) (map strip-last '((1 2 3) (4 5 6) (7 8 9))))
(assert-equal 3 (last '(1 2 3)))
(assert-equal '(3 5 7) (second-diagonal2 '((1 2 3) (4 5 6) (7 8 9))))
