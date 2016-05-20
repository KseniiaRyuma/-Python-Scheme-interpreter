(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cddr x) (cdr (cdr x)))
(define (cadar x) (car (cdr (car x))))

; Some utility functions that you may find useful to implement.
(define (map proc items)
        (cond ((null? items) items)
              (else (cons (proc (car items))(map proc (cdr items))))
  )
)

(define (cons-all first rests)
    (map (lambda(rests)(cons first rests)) rests)
)

(cons-all 3 '((6 7) (4 5)))

; expect ((3 6 7) (3 4 5))


(define (zip pairs)
  (cons (map car pairs) (list (map cadr pairs))))

(zip '((1 2) (3 4) (5 6) (7 8)))
; expect ((1 3 5 7) (2 4 6 8))

(zip '())
; expect (() ())

;; Problem 18
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN Question 18
  (define (helper s n)
        (cond ((null? s) s)
              (else (cons (cons n (list (car s))) (helper (cdr s) (+ n 1))))))
  (helper s 0)
  )

(enumerate '(0 4 8 1))
; expect ((0 0) (1 4) (2 8) (3 1))
  ; END Question 18

;; Problem 19
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN Question 19
    (cond
          ((eq? total 0) (cons '() '()))
          ((null?  denoms) (cons denoms '()))
          ((null? (cdr denoms)) (cons-all (car denoms) (list-change (- total (car denoms)) denoms)))
          ((< (- total (car denoms)) 0) (list-change total (cdr denoms)))
          (else  (append  (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
                     (list-change total (cdr denoms))))))

(define (append lst1 lst2)
  (cond ((null? lst1) lst2)
  (else (cons (car lst1) (append (cdr lst1) lst2)))))
  ; END Question 19

;; Problem 20
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (analyze expr)
  (cond ((atom? expr)
         ; BEGIN Question 20
         expr
         ; END Question 20
         )
        ((quoted? expr)
         ; BEGIN Question 20
         expr
         ; END Question 20
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN Question 20
           (append (list form params) (map analyze body))
           ; END Question 20
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN Question 20
          (car (cons-all (cons 'lambda (cons (car (zip (map analyze values)))
                                             (map analyze body)))
                         (cdr (zip (map analyze values)))))

           ; END Question 20
           ))
        (else
         ; BEGIN Question 20
         (map analyze expr)
         ; END Question 20
         )))

(analyze '(quote (let ((a 1) (b 2)) (+ a b))))
; expect (quote (let ((a 1) (b 2)) (+ a b)))

(analyze '(lambda (let a b) (+ let a b)))
; expect (lambda (let a b) (+ let a b))

(analyze '(lambda (x) a (let ((a x)) a)))
; expect (lambda (x) a ((lambda (a) a) x))

(analyze '(let ((a 1))
            (let ((b a))
              b)))
; expect ((lambda (a) ((lambda (b) b) a)) 1)

;; Problem 21 (optional)
;; Draw the hax image using turtle graphics.
(define (hax d k)
  ; BEGIN Question 21
  'REPLACE-THIS-LINE
  )
  ; END Question 21

