#lang sicp
;Q1: Solutions
(define (make-accumulator sum)
  (lambda (value)
    (set! sum  (+ sum value)) sum))


