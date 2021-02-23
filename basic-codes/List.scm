#lang racket
; List Data structures
(define l (list 1 2 3 4) )
;Get first element of list
(car l)
;Get a list from second element
(cdr l)
;Get nth element from a list, 0 based indexing- 
(define (get-n list n)
  (if (= n 0)
      (car list)
      (get-n (cdr list) (- n 1))))
(define (length-iter list ans)
  (if (null? list) ans
      (length-iter (cdr list) (+ ans 1))))
(get-n l 3)
(get-n l 0)

;Get length of list: Recursive procedure
(define (length list)
  (if (null? list)
      0
        (+ 1 (length (cdr list)))))
(length l)

;Get length of list: Iterative procedur
(define (length-itr list ans)
  (if (null? list)
      ans
       (length-itr (cdr list) (+ ans 1))))
(length-itr l 0)  ;zero as argument is must.

;Get sum of a list: Recursive procedure 
(define (sum list)
        (if (null? list)
             0
             (+ (car list) (sum (cdr list)))))
(display 'sum)
(sum l)

;Get sum of a list: Iterative procedure

(define (sum-itr list ans)
  (if (null? list)
      ans
      (sum-itr (cdr list) (+ ans (car list)))))
(sum-itr l 0)
;Take n elemets from a list: Iterative procedure
(define (take list n)
         (if (= n 0)
              '()
              (cons (car list) (take (cdr list) (- n 1)))))
(take l 2)

;Get a list after dropping starting n elements
(define (drop list n)
  (if (= n 0)
      list
      (drop (cdr list) (- n 1))))
(display 'drop-fn)
(drop l 1)
(drop l 3)

;Reverse a given list
(define (reverse list )
         (if (null? list)
              '()
              (cons (reverse (cdr list)) (car list))))
;(define (reverse1 list n ans)
;         (if (eq? n 0) ans
;          (reverse1 list (- n 1) (append ans (get-n list n)))) )
 ;(reverse1 l (- (length l) 1) '()) 
(reverse l)


;(define  (sublist l1 l2 it)
 ;         (cond ((= (length l1) it) #t)
 ;                (if (= (get-n l1 it) (car l2)) (sublist l1 (cdr l2) (+ it 1) ) (sublist l1 (cdr l2) 0) ) ) )
   ; (sublist '(1 2 3) '(1 2 5 1 3) 0)

(define (list-func l1 l2 i ctr)
        (cond ((= (length l1) ctr ) #t)
              ( (not (eq? (get-n l1 ctr) (get-n l2 (+ i ctr)))) #f)
              ((eq? (get-n l1 ctr) (get-n l2 (+ i ctr))) (list-func l1 l2 i (+ ctr 1))) ))
               ; (list-func '(1 2 3) '(1 2 5 4 1 2 1 2 3) 6  0)
(define (list-func2 l1 l2 ctr)
        (if (<= ctr (- (length l2) (length l1)) ) 
            (if (eq? (list-func l1 l2  ctr 0) #t)
            #t
            (list-func2 l1 l2 (+ ctr 1) ))
         #f))

(define (sublist l1 l2)
        (list-func2 l1 l2 0) )
         ;  (list-func2 '(1 2 3 45 567 899) '(4 5 6 1 2 4 56 1 2 34 12 1 1 2 3 1 2 3 45 899 345 1 2 3 45 567) 0)

(list-func2 '(a) '(a b) 0)
(sublist '(c d e) '(a b c d e f g))
 (sublist '(f) '(a b c d e f g))
  (sublist '(a c e) '(a b c d e f g))

(define (lgrep l1 l2)
        (if (null? l2)
            '()
            (if (eq? (sublist l1 ( car l2)) #t)
                (cons (car l2) (lgrep l1 (cdr l2)))
                (lgrep l1 (cdr l2)))))

(lgrep '(1 2 3) '((1 2 3) (1 2 4 1 2 3) (2 3 4 5 6 7 8 9 2 3 4 5 6 7 89 1 2 3 89)))   
(lgrep '(c d e) '((a b c d e f g)
                  (c d c d e)
                  (a b c d)
                  (h i c d e k)
                  (x y z)))
(define (unique-list l)
  (cond ((null? l)
         '())
        ((member (car l) (cdr l))
         (unique-list (cdr l)))
        (else
         (cons (car l) (unique-list (cdr l))))))

(define (all-subsequences l1 b index)
       (if (eq? index (length l1))  (list b      )     
           ( if (eq? '() (all-subsequences l1 b (+ index 1)) ) (all-subsequences  l1 (append b (list (get-n l1 index))) (+ index 1))  (append (all-subsequences  l1 (append b (list (get-n l1 index))) (+ index 1)) (all-subsequences l1 b (+ index 1)) )
 
           )))

(define (subsequences l1)
         (all-subsequences l1 '() 0))

(all-subsequences '(1 1 1 3) '() 0)
(unique-list (all-subsequences '(1 1 1   3) '() 0))

(define (longest-subsequences l1 l2)
         (cond ((null? l1) '())
                ((member (car l1) l2) 
                    (append (list (car l1)) (longest-subsequences (cdr l1) l2)))(else  (longest-subsequences (cdr l1) l2))))

(define (max-length l1)
        (if (null? l1) 0
            (max (length (car l1)) (max-length (cdr l1)))))

(define (maximal-longest-subsequences l1 len)
         (cond ((null? l1) '())
               ((= (length (car l1)) len)
             (cons (car l1) (maximal-longest-subsequences (cdr l1) len))) (else (maximal-longest-subsequences (cdr l1) len) ) ))
(maximal-longest-subsequences '((1 1 1 3) (1 1 1) (1 1 3) (1 1) (1 3) (1) (3) ()) 3)
(define (lcs l1 l2)
  (maximal-longest-subsequences (longest-subsequences (unique-list (subsequences l1 ))  (unique-list (subsequences l2 ))) (max-length (longest-subsequences (unique-list (subsequences l1 ))  (unique-list (subsequences l2 )))) ))

  ;(lcs '(1 2 3) '( 1 2 3 4))
(lcs '(a b c b d a b) '(b d c a b a))

(define (foldr func iden l)
  (if (null? l)
      iden
      (func (car l) (foldr func iden (cdr l)))))

(define (foldl func iden l)
  (if (null? l) iden
      (foldl func (func iden (car l)) (cdr l))))
(define (is-even num)
  (if (eq? (modulo num 2) 0)
      #t
      #f))
(define (filter func list)
  (if (null? list) '()
      (if (eq? (func (car list)) #t)
          (cons (car list) (filter func (cdr list)))
          (filter func (cdr list)))))
(define (square x)
  (* x x))
(define (map func list)
  (if (null? list) '()
      (cons (func (car l)) (map func (cdr list)))))

;reverse a list using foldr
(define (foldr-rev func iden l)
  (if (null? l)
      iden
      (func (foldr-rev func iden (cdr l)) (list (car l)))))
(define (reverse-list l)
  (if (null? l) '()
      (append (reverse-list (cdr l)) (list (car l)))))

;Imperative
(define (withdraw bal amt)
  (if (>= bal amt)
      (- bal amt)
      (error "Insufficient balance")))
(define (withdraw-bal bal)
  (lambda (amt)
    (if (>= bal amt) (and (set! bal (- bal amt)) bal)
        (error "Insuffiecient balance" bal))))
; check prime
(define (isPrime n)
  (define (check-prime ctr n)
    (if (>= ctr n) #t
        (if (eq? (modulo n ctr) 0) #f
            (check-prime (+ ctr 1) n))))
  (check-prime 2 n))