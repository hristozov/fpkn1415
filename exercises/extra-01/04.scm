(load "../../lib/scm/unit.scm")
(load "../06/01composition.scm")
(load "../04/04accumulate.scm")

; n-та композиция на f. кодът е същият като този от упражнение 6.
; взима процедура с ЕДИН аргумент и връща процедура с ЕДИН аргумент
(define (repeat-f f n)
  (define (helper result i)
    (if (= i 0)
        result
        (helper (compose f result) (- i 1))))
  (helper (lambda (x) x) n))

; първа частна производна на f по z
; взима процедура с ТРИ аргумента и връща процедура с ТРИ аргумента.
(define (derive-z f eps)
  (lambda (x y z)
    (let ((z0 (+ z eps)))
      (/ (- (f x y z) (f x y z0))
         (- z z0)))))

; n-та частна производна на f(x,y,z) по z
; приема за аргумент процедура с ТРИ аргумента и връща процедура с ТРИ аргумента
(define (derive-z-n f n eps)
  ((repeat-f (lambda (procedure) (derive-z procedure eps)) n) f))

; решение на задачата
(define (sum f n eps)
  ; долната lambda реално е тялото на търсената процедура h(z)
  (lambda (z)
    (accumulate 
      ; в term-а правим следното:
      ; 1. намираме k-тата частна производна по z.
      ; 2. викаме тази производна с 1, 1 и z.
      (lambda (k) ((derive-z-n f k eps) 1 1 z))
      + 0 0 plus1 n)))

; примерна процедура за тестване
(define (g x y z)
  (+ x y (expt z 4)))

(assert-approx 18 0.5 ((derive-z-n g 0 0.01) 1 1 2))
(assert-approx 32 0.5 ((derive-z-n g 1 0.01) 1 1 2))
(assert-approx 48 0.5 ((derive-z-n g 2 0.01) 1 1 2))
(assert-approx 48 0.5 ((derive-z-n g 3 0.01) 1 1 2))
(assert-approx 24 0.5 ((derive-z-n g 4 0.01) 1 1 2))
(assert-approx 0 0.5 ((derive-z-n g 5 0.01) 1 1 2))

(assert-approx 18 0.5 ((sum g 0 0.01) 2))
(assert-approx 50 0.5 ((sum g 1 0.01) 2))
(assert-approx 98 1 ((sum g 2 0.01) 2))
(assert-approx 146 2 ((sum g 3 0.01) 2))
(assert-approx 170 2 ((sum g 4 0.01) 2))
(assert-approx 170 2 ((sum g 5 0.01) 2))
