(load "../../lib/scm/unit.scm")
(load "05tree.scm")

; Проверява дали пътят path (списък от числа) се съдържа в дървото tree, като
; започва в корена и завършва в листо.
;
; Рекурсията обхожда дървото и на всяка стъпка маха първия елемент на path.
(define (contains-path tree path)
  (cond
    ; Пътят е празен. Понеже по дефиниция пътят е от корен до листо, то трябва
    ; да проверим дали и дървото е празно - т.е. дали с изчерпването на пътя
    ; сме подминали последното листо.
    ((null? path) (tree-empty? tree))
    ; Пътят не е празен (иначе нямаше как да стигнем дотук, заради горното
    ; условие), но дървото е празно. Значи не сме открили път.
    ((tree-empty? tree) #f)
    ; Текущият връх и главата на пътя се различават. Не сме на правилен път.
    ((not (= (value tree) (car path))) #f)
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
(assert-false (contains-path sample-tree '(3 5)))
(assert-true (contains-path sample-tree '(1 3 6 8)))