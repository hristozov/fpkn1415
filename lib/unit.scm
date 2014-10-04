(define (_bool-stringify val)
  (if val "#t" "#f"))

(define (_stringify val)
  (cond
    ((boolean? val) (_bool-stringify val))
    ((number? val) (number->string val))))

(define (assert message boolean)
  (if boolean
      (display "PASSED: ")
      (display "FAILED: "))
  (display message)
  (newline))

(define (assert= expected actual)
  (assert 
    (string-append (_stringify actual) " (actual) = " (_stringify expected) " (expected)")
    (= expected actual)))

(define (assert-eq expected actual)
  (assert 
    (string-append (_stringify actual) " (actual) eq? " (_stringify expected) " (expected)")
    (eq? expected actual)))

(define (assert-true bool)
  (assert-eq bool #t))

(define (assert-false bool)
  (assert-eq bool #f))
          