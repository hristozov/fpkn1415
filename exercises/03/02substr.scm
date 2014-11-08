(load "../../lib/scm/unit.scm")
(load "../02/04count-digits-iter.scm")

; Проверяваме дали числото a се съдържа в числото n като последователност от
; цифри. За целта отделяме „маска“ от вида 10^m, където m е дължината на a.
; След това на всяка стъпка гледаме остатъка на n при деление на тази маска, за
; да вадим последните му m цифри и да ги сравним с a. Ако a се съдържа в n, на
; някоя от стъпките този остатък ще е равен на a.
(define (substr? n a)
  (let ((mask (expt 10 (count-digits-iter a))))
    (define (helper i)
      (cond
         ((< i a) #f)
         ((= a (remainder i mask)) #t)
         (else (helper (quotient i 10)))))
    (helper n)))

(assert-true (substr? 1234 23))
(assert-true (substr? 1234 12))
(assert-true (substr? 1234 1))
(assert-true (substr? 1234 2))
(assert-true (substr? 1234 4))
