(load "../../lib/scm/unit.scm")
(load "02palyndrome.scm")

(define (count-palyndromes start end)
  (define (helper current count)
    ;(display current) (display " ") (display (palyndrome? current)) (newline)
    (cond
      ((> current end) count)
      ((palyndrome? current) (helper (+ current 1) (+ count 1)))
      (else (helper (+ current 1) count))))
  (helper start 0))

(assert= 9 (count-palyndromes 1 10))
(assert= 11 (count-palyndromes 1 22))
(assert= 15 (count-palyndromes 1 66))
