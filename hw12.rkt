;Name: 
;CSE 240 Fall 2018 HW12


;Q1 (3 points)
; Put your code here:
(define OR-GATE (lambda (a b)
       (if(eq? a 1) ;if a = 1, return 1
          1
          (if(eq? b 1) ;else if b = 1, return 1
             1
             0 ;else return 0
          )
       )
))                
                  
(define AND-GATE (lambda (a b)
       (if(eq? a 1)
          (if(eq? b 1)
             1 ;if a and b = 1, return 1
             0 ;otherwise return 0
          )
          0 ;otherwise return 0
       )
))                   

(define NOT-GATE (lambda (a)
       (if (eq? a 1)
           0 ;if a = 1, return 0
           1 ;if a = 0, return 1
       )
))                   

; Q2 (2 points)
; Put your code here:
(define XOR-GATE (lambda (a b)
       (OR-GATE (AND-GATE (NOT-GATE a) b) (AND-GATE a (NOT-GATE b)))
))                   

                   
; Test cases and expected output. Do not edit or remove.
(newline)
(Display "AND-Gate Output\n")
(AND-GATE 0 0)
(AND-GATE 0 1)
(AND-GATE 1 0)
(AND-GATE 1 1)
;0
;0
;0
;1
(newline)
(Display "OR-Gate Output\n")
(OR-GATE 0 0)
(OR-GATE 0 1)
(OR-GATE 1 0)
(OR-GATE 1 1)
;0
;1
;1
;1
(newline)
(newline)
(Display "XOR-Gate Output\n")
(XOR-GATE 0 0)
(XOR-GATE 0 1)
(XOR-GATE 1 0)
(XOR-GATE 1 1)
;0
;1
;1
;0

;Q3.1 (5 points)
(define halfAdder (lambda (x a b)
        (XOR-GATE (XOR-GATE a b) x)
))                    

;Q3.2 (5 points)
(define carry-out (lambda (x a b)
        (OR-GATE (AND-GATE (XOR-GATE a b) x) (AND-GATE a b))
))                   

;Q3.3 (5 points)
(define fullAdder (lambda (x a b)
        (cons (carry-out x a b) (halfAdder x a b))
))                    

; Test cases and expected output. Do not edit or remove.
(newline)
(Display "halfAdder Output\n")
(halfAdder 0 0 0) 	
(halfAdder 0 0 1) 	
(halfAdder 0 1 0) 	
(halfAdder 0 1 1)	
(halfAdder 1 0 0) 	
(halfAdder 1 0 1)	
(halfAdder 1 1 0) 	
(halfAdder 1 1 1)
;halfAdder Output
;0
;1
;1
;0
;1
;0
;0
;1
(newline)
(Display "fullAdder Output\n")
(fullAdder 0 0 0) 	
(fullAdder 0 0 1) 	
(fullAdder 0 1 0) 	
(fullAdder 0 1 1)	
(fullAdder 1 0 0) 	
(fullAdder 1 0 1)	
(fullAdder 1 1 0) 	
(fullAdder 1 1 1) 
;(0 . 0)
;(0 . 1)
;(0 . 1)
;(1 . 0)
;(0 . 1)
;(1 . 0)
;(1 . 0)
;(1 . 1)


;Q4.1 (4 points)
(define tail (lambda (lst)
       (car (reverse lst))
))               

;Q4.2 (4 points)
(define rmtail (lambda (lst)
        (reverse (cdr (reverse lst)))
))                 

;Q4.3 (4 points)
; Write the answers in comments **SEE PROGRAM BELOW FOR ANSWERS**
;1) What is the size-n problem of your procedure?
;2) What are the stopping condition and its return value?
;3) What is the size-(n-1) problem?
;4) What are the steps to construct the size-n problem solution from the size-(n-1) solution?

;Q4.4 (18 points)
(define n-bit-adder (lambda (L1 L2 n)
       (let((RESULT (recursiveAdd (append '(0)L1) (append '(0)L2) 0))) ;an additional bit is appended to the front of the lists
         (begin
            (Display "(")
            (Display (car RESULT)) ;the additional bit represents overflow and is formatted in front of the sum
            (Display " ")
            (Display (cdr RESULT))
            (Display ")")
            (newLine)
         )
       )
))

(define recursiveAdd (lambda(L1 L2 c) ;1) size-n problem
      (if (null? L1) ;2) stopping condition
          '() ;return value
          (let((SUM (cdr (fullAdder c (tail L1) (tail L2))))
               (CARRY (car (fullAdder c (tail L1) (tail L2)))))
                       ;3) the size-(n-1) problem is ---> (recursiveAdd (rmtail L1) (rmtail L2) CARRY)
               (append (recursiveAdd (rmtail L1) (rmtail L2) CARRY) ;4) Constructing the size-n solution from size-(n-1) solution is the append statement
                       (list SUM)                                   ;   here that appends each sum of bits to a list
               )
          )  
      )
))


; Test cases. Do not edit or remove.
(define X1 '(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0) )	
(define X2 '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1) )	
(define X3 '(0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) )	
(define X4 '(1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0) )
(define X5 '(1 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1) )	
(define X6 '(1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0) )

(Display "n-bit-adder Output\n")
(newline)
(Display "n-bit-adder Output\n")
(n-bit-adder  X1 X2 32)
(n-bit-adder  X3 X4 32)
(n-bit-adder  X5 X6 32)
(n-bit-adder  X2 X3 32)
(n-bit-adder  X4 X5 32)
(n-bit-adder  X1 X6 32)

;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(0 (1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1))
;(1 (1 0 1 1 1 0 0 0 1 1 1 0 0 1 0 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 1))
;(1 (0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 0))
;(1 (1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1))
;(0 (1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 1 1 0 0 0 1 0))

