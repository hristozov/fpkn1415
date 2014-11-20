(load "../../lib/scm/unit.scm")

(define (max_dig n)
  (if (< n 10)
      n
      (let ((current-max-digit (max_dig (quotient n 10)))
            (current-digit (remainder n 10)))
        (if (> current-digit current-max-digit)
            current-digit
            current-max-digit))))

(assert= 6 (max_dig 1654))
(assert= 6 (max_dig 1065))
(assert= 6 (max_dig 1640))
(assert= 9 (max_dig 9000))
(assert= 2 (max_dig 1222))
(assert= 2 (max_dig 2111))
(assert= 2 (max_dig 1112))
(assert= 0 (max_dig 0))
(assert= 9 (max_dig 9))