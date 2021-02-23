#lang sicp
;Q1
(define ans1 (/ (+ 5 4 (- 2 (- 3 (+ 6 (/  4 5))))) (* 3 (- 6 2) (- 2 7))))
ans1

;Q2 Sum of two minimum numbers out of three
(define (leastTwo a b c)
          (cond ((and (>= a b) (>= b c)) 
                      (+ b c))
                ((and (>= a b) (>= c b) (>= a c))
                      (+ c b))
                ((and (>= a b) (>= c b) (>= c a))
                      (+ a  b))
                ((and (>= b a) (>= a c))
                 (+ a c))
                ((and (>= b a) (>= c a) (>= b c))
                      (+ c a))
                ((and (>= b a) (>= c a) (>= c b))
                      (+  b a))
                ))

(define (leastTwo-2 a b c)
  (cond ((< a b) (if (< c b) (+ a c) (+ a b)))
        ((>= a b) (if (< a c)(+ a b) (+ c b)))
        ))

(leastTwo-2 1 3 56)
(leastTwo 1 3 67)

;Q3
(define (modexy x y n)
  (define (pow acc count)
    (if (> count y)
        acc
    (pow (modulo (* acc x) n) (+ count 1))))
  (define (pow-itr)
    (pow 1 1))
  (modulo (pow-itr) n))   

(modexy 2 6 31)


; q4

(define (cube_itr guess x)
  (if (good-enough guess x)
      guess
  (cube_itr (improve guess x) x) ))
 
(define (improve y x)
  (/ (+ (* 2 y) (/ x (* y y))) 3) )

(define (good-enough guess x)
  (if (< (abs(- x (cube guess))) t)
      #true
      #false))

(define t .001)

(define (cube guess)
  (* guess guess guess) )

(define (cube_root x)
  (cube_itr 1.0 x) )
(cube_root 1000000)

; Q5 


(define (improving-guess guess x )
          (if (good-enough guess x)
              guess
              (improving-guess (/ (+ (* 2 guess) (/ x (* guess guess))) 3.0) x)))         

(define (iterative-improve  guess x good-enough improving-guess)
         ( if (good-enough guess x)
          guess
          (improving-guess guess x))
               )


(iterative-improve 1 27 good-enough improving-guess)
;Q6 - Using of lambda' s
(define zero (lambda () '()))
(define (succ x) (lambda () x))
(define (pred x) (x))

(define one (succ zero))
(define two (succ one))
(define three (succ two))
(define four (succ three))
(define five (succ four))
(define (is-zero? x) (null? (x)))
(define (is-equal? x y)
  (cond ((is-zero? x) (is-zero? y))
        ((is-zero? y) (is-zero? x))
        (else (is-equal? (pred x) (pred y)))))

;(1)
; Zero is not equal to one, result = false .
(define Q6-Part1/1 (is-equal? zero one))
Q6-Part1/1
; Zero is equal to zero ; result = true
(define Q6-part1/2 (is-equal? zero zero))
Q6-part1/2

;(2)
(is-equal? four (succ(succ( succ(succ zero)))))
(is-equal? one (succ zero))
;(3)
(is-equal? two (succ (pred two)))

; Addition
(define (add-church x y)
  (if (is-zero? y)
      x
      (add-church (succ x) (pred y))))
(is-equal? (add-church two three) five)

; Subtraction
(define (subtract-church x y)
  (if (is-zero? y)
      x  (subtract-church (pred x) (pred y))))
(is-equal? (subtract-church three two) zero)
(is-equal? (subtract-church three three) zero)

; Multiplication
(define (multiply-church x y)
  (define (multiply-withzero)
  (cond ((is-zero? x) zero)
      ( (is-zero? y) zero)))
  (multiply-withzero)
  (define  (multiply ans x y)
  (if (is-zero? y) ans
       (multiply (add-church ans x) x  (pred y))))
  (multiply zero x y))

(is-equal? (multiply-church five one) three)
(is-equal? (multiply-church two two) four)      