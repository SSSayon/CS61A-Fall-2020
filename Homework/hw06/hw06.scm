(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)


(define (sign num)
  (cond 
    ((< num 0) -1)
    ((= num 0) 0)
    (else 1)
  )
)


(define (square x) (* x x))

(define (pow x y)
  (define (helper res x y)
    (cond
      ((= y 0) res)
      ((even? y) (helper res (square x) (/ y 2)))
      (else (helper (* res x) x (- y 1)))
    )
  )
  (helper 1 x y)
)