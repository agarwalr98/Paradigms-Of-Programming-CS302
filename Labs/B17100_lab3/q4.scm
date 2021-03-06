#lang sicp
; Q4  :
(define (make-account balance secret-password)
  (define counter 0)
  (define (Check-malicious-activity counter)
    (if (> counter 5) (call-the-cops)
                      "Incorrect password" ))
  (define (call-the-cops)
    "Malicious activity is found at ATM..")
  (define (reset-counter)
    (set! counter 0))
  (define (withdraw amount )
    (reset-counter)
    (if  (>= balance amount)
         (begin (set! balance (- balance amount)) balance)
         "Insufficient Funds!"))
  (define (Helper value)
    (begin (set! counter (+ counter 1)) (Check-malicious-activity counter)))
  (define (deposit amount)
    (set! balance (+ balance amount)) balance)
  (define (dispatch m1 m2)
    (cond ((eq? m2 'withdraw) (if (eq? m1 secret-password) withdraw Helper))
          ((eq? m2 'deposit) deposit)
          (else (error "Unknown request: MAKE ACCOUNT" m2  
                       ))))  
  dispatch)