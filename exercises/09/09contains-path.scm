(load "../../lib/scm/unit.scm")
(load "05tree.scm")

; Проверява дали пътят path (списък от числа) се съдържа в дървото tree, като
; започва в корена и завършва в листо.
;
; Рекурсията обхожда дървото и на всяка стъпка маха първия елемент на path.
(define (contains-path tree path)
  (cond
    ; Изчерпали сме дървото или пътя - прекратяваме.
    ((or (tree-empty? tree) (null? path)) #f)
    ; Текущият връх и главата на пътя се различават. Не сме на правилен път.
    ((not (= (value tree) (car path))) #f)
    ; Стигнали сме до листо и в пътя е останал само един елемент. Също така,
    ; този единствен елемент е равен на стойноста в дървото (иначе щяхме да
    ; отпаднем на горното условие). Следователно, намерили сме края на пътя.
    ((and (leaf? tree) (null? (cdr path)) #t))
    (else (or (contains-path (left tree) (cdr path))
              (contains-path (right tree) (cdr path))))))

(define sample-tree
  (make-tree 1 
             (make-tree 3
                        (make-tree 5
                                   (empty-tree)
                                   (empty-tree))
                        (make-tree 6
                                   (make-tree 8 (empty-tree) (empty-tree))
                                   (empty-tree)))
             (make-tree 9
                        (empty-tree)
                        (make-tree 7
                                   (make-tree 2 (empty-tree) (empty-tree))
                                   (make-tree 1 (empty-tree) (empty-tree))))))

(assert-true (contains-path sample-tree '(1 3 5)))
(assert-false (contains-path sample-tree '(1 3)))
(assert-false (contains-path sample-tree '(1 3 6)))
(assert-false (contains-path sample-tree '(3 5)))
(assert-true (contains-path sample-tree '(1 3 6 8)))
