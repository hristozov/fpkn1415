(load "../../lib/scm/unit.scm")

(define (min_dig n)
  (if (= n 0)
      0
      (let ((current-min-digit (min_dig (quotient n 10)))
            (current-digit (remainder n 10)))
        (if (< current-digit current-min-digit)
            current-digit
            current-min-digit))))

(assert= 1 (min_dig 1654))