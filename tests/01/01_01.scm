(load "../../lib/scm/unit.scm")

(define (min_dig n)
  (if (< n 10)
      n
      (let ((current-min-digit (min_dig (quotient n 10)))
            (current-digit (remainder n 10)))
        (if (< current-digit current-min-digit)
            current-digit
            current-min-digit))))

(assert= 1 (min_dig 1654))
(assert= 0 (min_dig 1065))
(assert= 0 (min_dig 1640))
(assert= 1 (min_dig 1111))
(assert= 1 (min_dig 1112))
(assert= 1 (min_dig 2112))
(assert= 1 (min_dig 2111))
(assert= 0 (min_dig 0))
(assert= 9 (min_dig 9))