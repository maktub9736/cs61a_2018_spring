(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)

(define (sign x)
  (cond
      ((> x 0) 1)
      ((< x 0) -1)
      (else 0))
)

(define (square x) (* x x))

(define (pow b n)
  (cond
      ((= n 0) 1)
      ((= n 1) b)
      ((even? n) (square (pow b (/ n 2))))
      (else (* b (square (pow b (/ (- n 1) 2)))))
  )
)

(define (ordered? s)
  (if (null? (cdr s))
      (display "True")
      (if (> (car s) (cadr s))
          (display "False")
          (ordered? (cdr s)))
  )
)

(define (empty? s) (null? s))

(define (add s v)
  (cond ((empty? s) (list v))
        ((> (car s) v) (cons v s))
        ((< (car s) v) (cons (car s) (add (cdr s) v)))
        (else s)
  )
    )

; Sets as sorted lists
(define (contains? s v)
    (cond ((empty? s) (display "False"))
          ((> (car s) v) (display "False"))
          ((= (car s) v) (display "True"))
          (else (contains? (cdr s) v))
    )
)

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (intersect s t)
    (if (or (empty? s) (empty? t))
        '()
        ((define e1 (car s))
         (define e2 (car t))
         (cond (= e1 e2) (cons e1 (intersect (cdr s) (cdr t)))
               (< e1 e2) (intersect (cdr s) t)
               (> e1 e2) (intersect s (cdr t))
         )
        )
    )
)

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond (empty? s) t
          (empty? t) s
          (else (define e1 (car s))
                (define e2 (car t))
                (cond (= e1 e2) (cons e1 (union (cdr s) (cdr t)))
                      (< e1 e2) (cons e1 (union (cdr s) t))
                      (> e1 e2) (cons e2 (union s (cdr t)))
                )
          )
    )
)
