;; Extra Scheme Questions ;;


; Q5
(define lst
    (list (list 1) 2 '(3 . 4) 5)
)

; Q6
(define (composed f g)
        (lambda (x) (f (g x)))
)

; Q7
(define (remove item lst)
    (cond ((= (length lst) 0)         ())
          ((= (car lst) item)         (remove item (cdr lst)))
          (else (cons (car lst) (remove item (cdr lst))))
    )
)


;;; Tests
(remove 3 nil)
; expect ()
(remove 3 '(1 3 5))
; expect (1 5)
(remove 5 '(5 3 5 5 1 4 5 4))
; expect (3 1 4 4)

; Q8
(define (no-repeats s)
    (cond ((= (length s) 0) ())
          ((pair? (car s)) (no-repeats (append (no-repeats (car s)) (cdr s))))
          (else (cons (car s) (no-repeats (remove (car s) (cdr s))))))
)

; Q9
(define (substitute s old new)
    (cond ((= (length s) 0) ())
          ((pair? (car s)) (append (list (substitute (car s) old new)) (substitute (cdr s) old new)))
          ((equal? (car s) old) (cons new (substitute (cdr s) old new)))
          (else (cons (car s) (substitute (cdr s) old new)))
    )
)

; Q10
(define (sub-all s olds news)
    (if (= (length olds) 0)
        s
        (substitute (sub-all s (cdr olds) (cdr news)) (car olds) (car news)))
)
