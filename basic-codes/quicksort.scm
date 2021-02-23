#lang sicp


 ; Select the first element as the pivot
(define (quicksort input_list)
  ;list with elements less than pivot elem
  (define (partition-l list pivot)
    (if (null? list) '()
         (if (<=   (car list) pivot)
             (cons (car list) (partition-l (cdr list) pivot))
             (partition-l (cdr list)  pivot))))
  
   ;list with elements > than pivot elem.
  (define (partition-r list pivot)
    (if (null? list) '()
         (if (> (car list) pivot)
             (cons (car list) (partition-r (cdr list) pivot))
             (partition-r (cdr list)  pivot))))

  (define (func)
  (cond ((null? input_list )
        input_list)
  (else
      (let ((pivot (car input_list)))
        (append
          (quicksort 
            (partition-l (cdr input_list) pivot )) 
          (list pivot) ; Add the pivot in the middle
          (quicksort
            (partition-r (cdr input_list) pivot)))))))
  (func))