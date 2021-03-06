
#lang sicp 
; Assignment 1 based on  List Data structures
; --> Rohit Agarwal  (B17100)

(define (sublist l1 l2)
        (define (get-n list n)
                (if (= n 0) (car list)
                (get-n (cdr list) (- n 1))))
  
        (define (length list)
                (if (null? list)  0
                (+ 1 (length (cdr list)))))
  
        (define (list-func l1 l2 i ctr)
                (cond ((= (length l1) ctr ) #t)
                      ( (not (eq? (get-n l1 ctr) (get-n l2 (+ i ctr)))) #f)
                      ((eq? (get-n l1 ctr) (get-n l2 (+ i ctr))) (list-func l1 l2 i (+ ctr 1)))))

        (define (list-func2 l1 l2 ctr)
                (if (<= ctr (- (length l2) (length l1)))
                            (if (eq? (list-func l1 l2 ctr 0) #t) #t                  
                                (list-func2 l1 l2 (+ ctr 1) ))
                    #f))
        (list-func2 l1 l2 0))


(define (lgrep l1 l2)
        (if (null? l2) '()
            (if (eq? (sublist l1 ( car l2)) #t)
                (cons (car l2) (lgrep l1 (cdr l2)))
                (lgrep l1 (cdr l2)))))



(define (lcs l1 l2)
  (define (get-n list n)
                (if (= n 0) (car list)
                (get-n (cdr list) (- n 1))))
  
  (define (unique-list l)
  (cond ((null? l) '())
        ((member (car l) (cdr l)) (unique-list (cdr l)))
        (else (cons (car l) (unique-list (cdr l))))))
  
  (define (all-subsequences l1 b index)
       (if (eq? index (length l1))  (list b      )     
           ( if (eq? '() (all-subsequences l1 b (+ index 1)) ) (all-subsequences  l1 (append b (list (get-n l1 index))) (+ index 1))  (append (all-subsequences  l1 (append b (list (get-n l1 index))) (+ index 1)) (all-subsequences l1 b (+ index 1)) )
 
           )))
  
  (define (subsequences l1)
         (all-subsequences l1 '() 0))

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
             (cons (car l1) (maximal-longest-subsequences (cdr l1) len))) (else (maximal-longest-subsequences (cdr l1) len))))
  
  (define (call-func l1 l2)
          (let ((x ( longest-subsequences (unique-list (subsequences l1 ))  (unique-list (subsequences l2 ) ) )))
          (maximal-longest-subsequences x  (max-length x))) )
  
  (define (ans l1 l2)
          (let ((returned-list (call-func l1 l2)))
               (if (eq? (car returned-list) '()) '()  
                   returned-list) ))
  (ans l1 l2) )
;LCS TestCase
;(lcs '(t g h s t y s) '(s f u j h k))
;(lcs '(a b a c x) '(a b a x a a a c c))
;(lcs '(a x r w x e y u t z) '(x y z c t u r e w b)  )
;(lcs '(a b c d e) '(y h u i o l))
;(lcs '(t a a) '(a a t t t a))
;(lcs '(a b d e) '(j))
;(lcs '(j) '(a b d e))
;(lcs '(l i u o p) '(p o u i l) )
;(lcs '(e r e i r i) '(i r e p e i e))
;(lcs '( a b a b a b ) '( a b a b c d) )
     ;(lcs '( a b  c d ) '( a d c b a))
     ;(lcs '( a ) '( b ) )
     ;(lcs '( a a ) '( a ))
     ;(lcs '( a b ) '( a b a b))

;(lgrep '(a) '((a) (a b) (a a) ( b b )))
 ;(lgrep '(a) '((a) (a b) (a a) ( b b )))
;(lgrep '(a b) '((a b c d) (a c b d) (a c d b) (c b b d) ( a b a b ) ( a b a a )))
;(lgrep '(a b c) '((d e f) (c b a) (c b a c) ( a b c d ) ( a c b d ) ( a c b c )))
;(lgrep '(a a a) '((a a a) (a a) ( a a a a ) ( a a b a a )))
;(lgrep '(a b c d) '((a b c d e) ( e a b c ) ( a b c ) ))
;(lgrep '(d v f) '((d v f a j o) (d v v f a j o) (d v v a f j o)))
;(lgrep '(a a a) '((a a a a a) (a a a a a) (a a a a a) (a a) (a a a a a a) (a a a a a a) (a a a a a a a)))
;(lgrep '(t t t t t) '((t) (t t) (t t t) (t t t t) (t t t t t t)))
;(lgrep '(a b c d) '((a b c d x) (a b c d y) (a b c d z) (a b c d) (a b c d) (a b c d)))
;(lgrep '(x) '((y)))
;(lgrep '(t k i x h i) '((f t p n s i d g) (d g v s t k i x h i a b w v f h o f a) (b l z q m p m p y d x z o) (s x d d e a g h j f j o) (w v b t k i x h i p j h) (i t k i x h i g) (i m l y) (o g l z g w x d z v z) (t j j n q l c i x a d d q)))
;(lgrep '(s d v g x h p p t f e t x) '((c k q p w p m b) (k g) (j s d v g x h p p t f e t x s l k t d o x o o b j n n x) (j q p k y u h) (g c s d v g x h p p t f e t x d f) (m p q) (u i w s d v g x h p p t f e t x w u i d i x s d y j c) (g s d v g x h p p t f e t x n s w c t m c e) (g z g t i h u f i b w y v d d)))
;(lgrep '(k z b q g j) '((w k z b q g j k) (f w o h b o h s k z b q g j) (j a i o m x t n p k q c t z r)))
;(lgrep '(b) '((i m n) (k l i n g i w o i u q h c n l) (v b b a b) (j b r) (i d s e d l j b x d u m d l b d) (o h z t b k k j x n b d b p e u f)))
;(lgrep '(v q f d p r r s) '((s p l u z l s k j z) (j x b q y t p m c z d r w r g) (t a t d d i c g k w d e s) (h s b z o) (b m v q f d p r z r s w m f x a k a)))
;(lgrep '(i j p n m k m i a) '((t i v i j p n m k m i a l k a y f) (o y a p x e i j p n m k m i a l w y y u i c) (a y u u m i j p n m k m i a l d i p) (x a t p u h x m g n u e r p t) (l m) (b)))
;(lgrep '(i a s) '((v t a q n e j z d a o u) (d j f r y z n y v v g h m n) (e i i a t s f) (n p k a x) (r r m y n b v i y y y b i a t s u) (z n y t m k b v w z)))
;(lgrep '(z h h p i u k m s e n p) '((z a t p a v) (t v f l v v k) (a u h n m i n f v j m g s m o) (b q) (i w h p r q r w n a) (h g q v f b w k y a e q) (v e z h h p i u k m s e n p j p) (p k y v z h h p i u k m s e n p v k)))
;(lgrep '(l j r) '((v q k z a u g) (n z c w t) (n h n a j w t)))
;(lgrep '(d a g p c v x c g z) '((d a g p c v x c g z f b x a o i y j p x o d) (e d a g p c v x c g z e t z y h) (d l d a d a g p c v x c g z t i a n)))
;(lgrep '(q k v x o f) '((m h x)))
;(lgrep '(a m f e m c x g) '((j l y w k o m j x z) (v a o k o a m f e m c x g o w v k a s a h m n) (q i y a m f e m c x g n r o q l)))
;(lgrep '(l z o a) '((y l z o a o g x z a c o) (j) (k i z l p y x l) (e o u b l x h n s)))
;(lgrep '(d f p p g t o s l g l o u p u l) '((y d b t s a k m x u f y w) (m d f p p g t o l g l o u p u l b m y k z)))
;(lgrep '(c k q k w r h o l u t p v) '((h z a e m r v m) (j v t m x d u) (e h p d b g c k q k w r h o l u t p v z t v a w) (w g c k q k w r h o l u t p v w) (z k s a o l x) (v i o l w d) (v n z w a h c u y c g t c m) (y f q u c k q k w r h o l u t p v f y)))

