#lang sicp

;Q2: Solutions
(define (make-monitored f)
  (define counter 0)
  (lambda (symbol)  
    (cond ((eq? symbol 'how-many-calls?) counter)
          ((eq? symbol 'reset-count) (set! counter 0))
          (else (begin (set! counter (+ 1 counter)) (f symbol))))))