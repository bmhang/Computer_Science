; Brandon Hang
; CSE240 hw11

; Q1 (5 points)
;1.1
(display "1.1: ")
(- (+ 25 (* 19 12)) 33)
(newline)
(display "1.2: ")
(- (* 15 (+ 16 (/ 5 3))) (* 12 7))
(newline)
(display "1.3: ")
(* 14 ( * 121 ( + (- 15 (* 4 3)) (/ 19 4))))
(newline)
(display "1.4: ")
( * (+ 22 33) (+ 21 (/ (+ (/ 15 6) (* 3 4)) (- 5 7))))
(newline)
(display "1.5: ")
(+ (/ (- (/ (/ (* (- 6 9) (+ (* 11 5) 7)) 2) 2) 5) 3) (+ (/ (+ (* 7 5) (* (/ 8 2) 4)) 2) (* 9 5)))

; Q2 (5 points)
(define three 3)
(define six 6)
(define nine 9)
(define eleven 11)
(define five 5)
(define seven 7)
(define two 2)
(define eight 8)
(define four 4)
(+ (/ (- (/ (/ (* (- six nine) (+ (* eleven five) seven)) two) two) five) three) (+ (/ (+ (* seven five)(* (/ eight two) four)) two) (* nine five)))

; Q3 (5 points)
(define Subtract (lambda (x y)
                   (- x y)
))

(Subtract 5 2) ; test case

; Q4 (10 points)
(define IntDivide (lambda (x y)
     (if(> (abs(Subtract x y)) (abs x)) ;are either of the inputs negative?
        (if (< (abs x) (abs y)) ;if true, make output negative
            0 ;base case
            (if(< x 0) ;if x is negative, make sure it stays negative on next recursion
              (- (IntDivide  (+ x (abs y)) (abs y)) 1)
              (if(< y 0) ;if y is negative, make sure if stays negative on next recursion
                 (- (IntDivide (Subtract (abs x) (abs y)) y) 1)
              )
            )
        )
        (if (< (abs x) (abs y)) ;if false, leave output positive
            0 ;base case
            (+ (IntDivide (Subtract (abs x) (abs y)) (abs y)) 1)
        )
     )
))



(IntDivide 8 -3); test case

; Q5 (5 points)
(define ReadForIntDivide (lambda()
         (IntDivide (read) (read))
))

(ReadForIntDivide); test case

; Q6 (5 points)
(define Multiply (lambda (x y)
   (if(< y 0) ;is the divisor negative?
     (if(= y 0) ;if so, calculate a negative value
        0 ;base case
        (- (Multiply x (+ y 1)) x)
     )
     (if(= y 0) ;otherwise simply add the numbers positively (or negatively if dividend is negative)
        0 ;base case
        (+ x (Multiply x (- y 1)))
     )
   )
))
      

(Multiply 8 3); test case

; Q7 (10 points)
(define DiffDivide (lambda (x y)
      (Subtract x (Multiply (IntDivide x y) y))
))


(DiffDivide 8 3); test case

; Q8 (5 points)
(define DiffDivideLet (lambda (x y)
   (let((D (IntDivide x y)))
     (let((M (Multiply D y)))
       (let((S (Subtract x M)))
         S
       )
     )
   )
))
                        
(DiffDivideLet 8 3); test case
                 
