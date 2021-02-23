#lang sicp
;Question3:-
(define (make-account balance secret-password)
  (define (withdraw amount )
    (if  (>= balance amount)
         (begin (set! balance (- balance amount)) balance)
         "Insufficient Funds!"))
  (define (helper default-value)
    "Incorrect password")
  (define (deposit amount)
    (set! balance (+ balance amount)) balance)
  (define (dispatch m1 m2)
    (cond ((eq? m2 'withdraw) (if (eq? m1 secret-password) withdraw helper)) 
          ((eq? m2 'deposit) deposit)
          (else (error "Unknown request: MAKE ACCOUNT" m2  
                       ))))  
  dispatch)

