#lang sicp
; Tree Data structures : BST

; make-tree : return a list of (current-node value, left tree list, right tree )
(define (make-tree current_node left_tree right_tree)
        (list current_node left_tree right_tree))
(define (datum t) (car t))
(define (left t) (cadr t))
(define (right t) (caddr t) )
;Insert a value in a BST
(define (insert value t)
        (cond ((eq? '() t) (make-tree value '()  '()))
              ((< value (datum t)) (make-tree (datum t) (insert value (left t)) (right t)))
              ((> value (datum t))(make-tree (datum t) (left t) (insert value (right t)))) ))

;Convert a list to BSt
(define (list2tree t list)
        (if (null? list) t
            (list2tree (insert (car list) t) (cdr list))))

;Inorder traversal - sorted 
(define (inorder t)
        (if (null? t) '()
            (append (inorder (left t) ) (list (datum t)) (inorder (right t) )))) 
;Preorder
(define (preorder t)
        (if (null? t) '()
            (append (list (datum t)) (preorder (left t)) (preorder (right t)))))
;postorder
(define (postorder t)
        (if (null? t) '()
            (append (postorder (left t)) (postorder (right t)) (list (datum t)))))

(define (search t value)
        (cond ((null? t) #f)
              ((eq? (datum t) value) #t)
               ((if (< value (datum t)) (search (left t) value) (search (right t) value)) )))


(define l '(1 4 2 3 7 6 5 8 9 11) )
(define tree (list2tree '() l)   )
(inorder tree)
(search tree 4)
