
#lang sicp
; DO not add extra comments like (x) etc.
; (-x) does not work
(define default 1)
(define (square x)
  (* x x))
(define (sum-squares x y)
  (+ (square x) (square y)))
(define (g a)
  (sum-squares (+ a 2)(+ a 1)))
(define (f x)
  (x))
(define (division-error x y)
      (+ x 10))
(define (abs x)
        (cond ((> x 0) x)
              ((< x 0) (* x -1))
              ((= x 0) 0) )) 
(define (abs1 x)
  (if (< x 0)(* x -1) x))
(define (fact x)
  (if (= x 0)
      1
      (* x (fact (- x 1)))))
(define (fibn x)
  (if (or (= x 0) (= x 1)) 1
      (+ (fibn (- x 1)) (fibn (- x 2)))))
(define (fact1 x ans)
   (if (= x 0) ans (fact1 (- x 1) (* ans x))) )
(define (fib x)
  (cond ((= x 0) 0)
        ((= x 1) 1)(else (+ (fib (- x 1)) (fib (- x 2))))) )
(define (fibn2 x ans)
  (if (or (= x 0) (= x 1)) ans
      (fibn2 (- x 1) (+ ans x))))
                 
(define pi 3.14)
; Recursion: Sum of numbers between a and b.
(define (sum-iter a b)
  (if (> a b)
     0
     (+ a (sum-iter (+ a 1) b))))

; Iterative Process: SUm of numbers between a && b. 
(define (sum-Iter a b ans)
  (if (> a b)
      ans
      (sum-Iter (+ a 1) b (+ ans a))))
(define (concat-lists l1 l2)
  (if (null? l1)
  l2
  (cons (car l1) (concat-lists (cdr l1) l2))))
