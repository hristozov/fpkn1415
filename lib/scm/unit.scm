(define (_bool-stringify val)
  (if val "#t" "#f"))

(define (_list-stringify val)
  (if (eq? '() val)
      ""
      (string-append (_stringify (car val))
                     (if (eq? '() (cdr val))
                         ""
                         " ")
                     (_list-stringify (cdr val)))))

(define (_stringify val)
  (cond
    ((boolean? val) (_bool-stringify val))
    ((number? val) (number->string val))
    ((symbol? val) (symbol->string val))
    ((eq? '() val) "")
    ((list? val) (string-append
                   "("
                   (_list-stringify val) 
                   ")"))))

(define (_assert-with-message message boolean)
  (if boolean
      (display "PASSED: ")
      (display "FAILED: "))
  (display message)
  (newline))

(define (_assert p expected actual actual-sexp)
  (_assert-with-message
    (string-append 
      (_stringify actual-sexp)
      " -> "
      (_stringify actual) 
      " (actual) " (_stringify p)
      " " (_stringify expected)
      " (expected)")
    ((eval p (scheme-report-environment 5))
     expected
     actual)))

(define-syntax assert=
               (syntax-rules ()
                 ((assert= expected actual)
                  (_assert '= expected actual (quote actual)))))

(define-syntax assert-approx
               (syntax-rules ()
                 ((assert-approx expected delta actual)
                  (assert-true (> delta (abs (- expected actual)))))))

(define-syntax assert-eq
               (syntax-rules ()
                 ((assert= expected actual)
                  (_assert 'eq? expected actual (quote actual)))))

(define-syntax assert-true
               (syntax-rules ()
                 ((assert-true expr)
                  (assert-eq #t expr))))

(define-syntax assert-false
               (syntax-rules ()
                 ((assert-true expr)
                  (assert-eq #f expr))))
