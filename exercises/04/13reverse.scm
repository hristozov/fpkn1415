(load "../../lib/scm/unit.scm")
(load "04accumulate.scm")

(define (count-digits-iter n)
  (define (helper i result)
    (if (<= i 0)
        result
        (helper (quotient i 10) 
                (+ result 1))))
  (helper n 0))

; Това е реализация на добре познатия ни алгоритъм за reverse.
; - term отделя x-тата цифра от х на всяка стъпка.
; - acc добавя нова цифра на края на резултата.
(define (my-reverse-accumulate n)
  (let ((len-n (count-digits-iter n)))
    (define (term x)
      (remainder (quotient n (expt 10 (- len-n x))) 10))
    (define (acc a b)
      (+ (* b 10) a))
    (accumulate term acc 0 1 plus1 len-n)))

(assert= 0 (my-reverse-accumulate 0))
(assert= 5 (my-reverse-accumulate 5))
(assert= 1 (my-reverse-accumulate 10))
(assert= 21 (my-reverse-accumulate 12))
(assert= 1 (my-reverse-accumulate 1000))
(assert= 1234 (my-reverse-accumulate 432100))
(assert= 10234 (my-reverse-accumulate 43201))
