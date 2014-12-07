(load "../../lib/scm/unit.scm")
(load "05tree.scm")

; Връща списък от всички пътища (като списъци от числа) в дървото tree, като
; всеки от тези списъци започва от корена и свършва в листата. Т.е. броят на
; върнатите списъци ще е равен на броя на листата в дървото.
(define (list-paths-root tree)
  ; current-tree служи за обхождане на дървото, подобно на предишните задачи.
  ; current-path е списък с числа, който съдържа пътя към текущо разглежданото
  ; дърво.
  (define (helper current-tree current-path)
    (cond
      ; Стигнали сме до листо - значи сме намерили път в дървото. Добавяме
      ; стойността на текущия елемент на края на current-path и го връщаме.
      ; Тук имаме списък от един елемент, за да може накрая да append-нем всички
      ; клонове на рекурсията и така да игнорираме празните списъци върнати в
      ; други краища на дървото.
      ((leaf? current-tree) (list 
                              (append current-path
                                      (list (value current-tree)))))
      ; Стигнали сме празно дърво. Тук можем да дойдем само след като сме
      ; обходили връх само с един наследник, т.е. нямаме листо и няма как да
      ; сме открили път. Затова връщаме празен списък - при крайния append той
      ; ще се елиминира.
      ((tree-empty? current-tree) '())
      ; Рекурсивно извикване - append-ваме същата операция за двете поддървета.
      ; Ако някъде са се намерили пътища, то те ще са списъци от списъци и при
      ; append-ването няма да се наруши структурата им. Ако пък сме получили
      ; празни списъци (напр. в горния случай), те ще се елиминират, тъй като не
      ; ни интересуват.
      (else (append (helper (left current-tree)
                            (append current-path
                                    (list (value current-tree))))
                    (helper (right current-tree)
                            (append current-path
                                    (list (value current-tree))))))))
  (helper tree '()))

; Връща списък от всички пътища (като списъци от числа) в дървото tree, като
; всеки от тези списъци започва от листата и свършва в корена. Тук обхождането
; отново започва в корена, като единствената разлика е добавянето на елементи
; в current-path.
(define (list-paths-leaves tree)
  (define (helper current-tree current-path)
    (cond
      ((leaf? current-tree) (list 
                              (cons (value current-tree)
                                    current-path)))
      ((tree-empty? current-tree) '())
      (else (append (helper (left current-tree)
                            (cons (value current-tree)
                                  current-path))
                    (helper (right current-tree)
                            (cons (value current-tree)
                                  current-path))))))
  (helper tree '()))

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

(assert-equal '((5 3 1) (8 6 3 1) (2 7 9 1) (1 7 9 1))
              (list-paths-leaves sample-tree))

(assert-equal '((1 3 5) (1 3 6 8) (1 9 7 2) (1 9 7 1))
              (list-paths-root sample-tree))
