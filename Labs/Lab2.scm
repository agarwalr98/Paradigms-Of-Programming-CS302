#lang racket
(require 2htdp/image)

;mak-point(x y): Make a point by passing two values x, y.
(define (make-point x y)
  (lambda (bit) (if (= bit 0) x y)))

;Get-x(point): Get x coordinate of a point
(define (get-x point) (point 0))

;Get-y(point): Get y coordinate of a point
(define (get-y point) (point 1))

(get-x (make-point 2 3))
;Ans - 2

; Q1
;make-line(point-1 point-2): Make a line by passing two points .
(define (make-line point-1 point-2)
  (lambda (bit) (if (= bit 0) point-1 point-2)))

; Q2
(define (get-first-point line)
(get-x line))
(define (get-second-point line)
  (get-y line))

; Q3
;Get x coordinate of first point of line.
(define (get-x1 line)
  (get-x (get-x line)))

;Get x coordinate of last point of line
(define (get-x2 line)
  (get-x (get-y line)))

;Get y coordinate of first point of line
(define (get-y1 line)
  (get-y (get-x line)))

;Get y coordinate of last point of line
(define (get-y2 line)
  (get-y (get-y line)))

(make-line (make-point 1 1) (make-point 3 3))
;For example - A line represented by two points (x1,y1) and (x2,y2)
;then, x-coordinate of first point = x1
;      y-coordinate of first point = y1
;      x-coordinate of second point = x2
;      y-coordinate of second point = y2

; Q4
; Mid- point of line - ( (x1+x2)/2, (y1+y2)/2)
(define (mid-point line)
  (make-point (/ (+ (get-x1 line) (get-x2 line)) 2)  (/ (+ (get-y1 line) (get-y2 line)) 2))
  )
(mid-point (make-line (make-point 1 1) (make-point 3 3)))
(get-x (mid-point (make-line (make-point 1 1) (make-point 3 3))))
(get-y (mid-point (make-line (make-point 1 1) (make-point 3 3))))

; Q-5
;Length of line = Distance between two points
(define (length line)
  (sqrt (+ (* (- (get-x1 line) (get-x2 line)) (- (get-x1 line) (get-x2 line))) (* (- (get-y1 line) (get-y2 line))  (- (get-y1 line) (get-y2 line)) ))) )
  
(length (make-line (make-point 1 1) (make-point 3 3)))

; Q6:
;rotated-line-using-let: To rotate a line (denoted by two points) by 90 Degree clockwise.
;'let' keyword is used for local variables
(define (rotated-line-using-let line)
  (let ((x1 (get-x1 line)) (x2 (get-x2 line)) (y1 (get-y1 line)) (y2 (get-y2 line)) )
  (make-line  (get-second-point line) (make-point (if (> x1 x2) (+ x1 (length line)) (- x1 (length line) )) (if (>  y1 y2) (+ y1 (length line)) (- y1 (length line) ))))))

;rotated-line: To rotate a line (denoted by two points) by 90 Degree clockwise.
(define (rotated-line line)
     (make-line  (get-second-point line) (make-point (get-x2 line) (- (+ (get-y2 line) (get-x2 line) ) (get-x1 line)) )))

(get-x2 (rotated-line (make-line (make-point 8 0) (make-point 0 0))))
(get-y2 (rotated-line (make-line (make-point 8 0) (make-point 0 0))))

; Q7
; Q8(define (draw-p lnV lnH pMid length)
(define (draw-p lnV lnH pMid length)
(let ((vx2 (get-x2 lnV))
(vy2 (get-y2 lnV))
(hx2 (get-x2 lnH))
(hy2 (get-y2 lnH)))
(let ((i1 (line vx2 vy2 "black")))
(let ((i2 (add-line i1 0 0 hx2 hy2 "black")))
(let ((i3 (add-line i2 hx2 hy2 hx2 (- vy2 (/ length 2)) "black")))
(add-line i3 hx2 (- vy2 (/ length 2)) (get-x pMid) (get-y pMid) "black"))))))

(define p1 (make-point 0 0))
(define p2 (make-point 3 4) )
(define ln (make-line p1 p2))
(define pmid (mid-point ln))
(draw-p ln (rotated-line ln) pmid (length ln))


