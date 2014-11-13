(define (_get-approx-comparator delta)
  (lambda (e a) 
    (> delta (abs (- e a)))))

(define (_is-approx-comparator f)
  ; Obviously wrong, but I can't figure out how to "compare" lambdas in R5RS
  ; without the need to write them to a temporary I/O port, to get their
  ; "signatures". And we aren't talking about portability yet!
  ; This may be probably solved by "importing" the eqv? from Racket, but it may
  ; break the whole environment.
  (procedure? f))

(define (_bool-stringify val)
  (if val "#t" "#f"))

(define (_number-stringify val)
  (if (exact? val)
      (_number-stringify (exact->inexact val))
      (number->string val)))

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
    ((number? val) (_number-stringify val))
    ((symbol? val) (symbol->string val))
    ((eq? '() val) "")
    ((_is-approx-comparator val) "<approx>")
    ((list? val) (string-append
                   "("
                   (_list-stringify val) 
                   ")"))
    (else "<unknown>")))

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
                  (_assert '=
                           expected
                           actual
                           (quote actual)))))

(define-syntax assert-approx
               (syntax-rules ()
                 ((assert-approx expected delta actual)
                  (_assert (_get-approx-comparator delta)
                           expected
                           actual
                           (quote actual)))))

(define-syntax assert-eq
               (syntax-rules ()
                 ((assert-eq expected actual)
                  (_assert 'eq?
                           expected
                           actual
                           (quote actual)))))

(define-syntax assert-equal
               (syntax-rules ()
                 ((assert-equal expected actual)
                  (_assert 'equal?
                           expected
                           actual
                           (quote actual)))))

(define-syntax assert-true
               (syntax-rules ()
                 ((assert-true expr)
                  (assert-eq #t expr))))

(define-syntax assert-false
               (syntax-rules ()
                 ((assert-true expr)
                  (assert-eq #f expr))))
