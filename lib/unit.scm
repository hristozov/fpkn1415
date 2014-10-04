(define (assert message boolean)
  (if boolean
      (display "PASSED: ")
      (display "FAILED: "))
  (display message)
  (newline))

(define (assert= expected actual)
  (assert 
    (string-append (number->string actual) " (actual) = " (number->string expected) " (expected)")
    (= expected actual)))
          