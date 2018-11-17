;Brandon Hang
;CSE240

(define encrypt (lambda (str)
                  (let ((key (read))) ;take key input
                    (if (or (< key 1) (> key 4)) ;check validity
                     (begin
                       (display "Not a valid key value")
                       (newline)
                     )
                       (list->string (map (lambda (str) (character-encryption ;calling an unnamed procedure to get the key and apply it to every character
                                          str key)) (string->list str))
                       )
                     )
                  )
))

(define decrypt (lambda (str)
                  (let ((key (read))) ;take key input
                    (if (or (< key 1) (> key 4)) ;check validity
                     (begin
                       (display "Not a valid key value")
                       (newline)
                     )
                       (list->string (map (lambda (str) (character-encryption ;calling an unnamed procedure to get the key and apply it to every character
                                          str (* -1 key))) (string->list str))
                       )
                     )
                  )
))

(define character-encryption (lambda (ch key)
                               (if (or (char-alphabetic? ch) (char-numeric? ch))
                                   (character-rotation ch key)
                                   ch ;only letters and numbers will be encrypted
)))

(define character-rotation (lambda (ch key)
                                  (integer->char (+ (char->integer ch) key)
)))

;Test Cases
(encrypt "Hello CSE240!")
(decrypt "Khoor FVH573!")