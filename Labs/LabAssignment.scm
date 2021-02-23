#lang sicp

;Q1: Solutions
(define (make-accumulator sum)
  (lambda (value)
    (set! sum  (+ sum value)) sum))
(define A (make-accumulator 5))
(define B (make-accumulator 10))
(A 10)
(B 10)
(A 10) 

;Q2: Solutions
(define (make-monitored f)
  (define counter 0)
  (lambda (symbol)  
    (cond ((eq? symbol 'how-many-calls?) counter)
          ((eq? symbol 'reset-count) (set! counter 0))
          (else (begin (set! counter (+ 1 counter)) (f symbol))))))

(define s (make-monitored sqrt))
(s 100)    
(s 'how-many-calls?)


;Question3:-
(define (make-account-Q3 balance secret-password)
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
(define acc (make-account-Q3 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'secret-passwor1 'withdraw) 50)  

; Q4  :
(define (make-account balance secret-password)
  (define counter 0)
  (define (Check-malicious-activity counter)
    (if (> counter 5) (call-the-cops)
                      "Incorrect password" ))
  (define (call-the-cops)
    "Hands Up! You are caught")
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
(define my-acc (make-account 100 'MyPasswd))
((my-acc 'MyPasswd 'withdraw) 30)
((my-acc 'MyPasswd 'withdraw) 50)
((my-acc 'Mypasw1 'withdraw) 1)
((my-acc 'Mypasw2 'withdraw) 1)
((my-acc 'Mypasw3 'withdraw) 1)
((my-acc 'Mypasw4 'withdraw) 1)
((my-acc 'Mypassw5  'withdraw) 50)
((my-acc 'Mypasw6 'withdraw) 1)
((my-acc 'Mypasw7 'withdraw) 1)   






