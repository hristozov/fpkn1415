(load "../../lib/scm/unit.scm")

; Проверката дали дадено число е палиндром използва за база идеята на reverse -
; с итеративен процес постепенно обръщаме числото. Разликата е, че тук на всяка
; стъпка проверяваме дали междинният резултат (обърнатото число до тук) е равен
; на оставащата част от числото, което обръщаме. Ако се затруднявате с това
; решение, опитайте се първо да разгледате reverse.
(define (palindrome? n)
  (define (helper i reverse-i)
    (cond
      ((or (= 0 (remainder i 10)) (< i reverse-i)) #f)
      ((or (= i reverse-i) (= (quotient i 10) reverse-i)) #t)
      (else (helper (quotient i 10)
                    (+ (* reverse-i 10) (remainder i 10))))))
  (helper n 0))

(assert-true (palindrome? 1))
(assert-false (palindrome? 10))
(assert-true (palindrome? 121))
(assert-false (palindrome? 122))
(assert-false (palindrome? 221))
(assert-false (palindrome? 1220))
(assert-true (palindrome? 1221))
(assert-false (palindrome? 12210))
(assert-true (palindrome? 1234321))
(assert-true (palindrome? 12344321))
(assert-false (palindrome? 123421))
(assert-false (palindrome? 124321))
