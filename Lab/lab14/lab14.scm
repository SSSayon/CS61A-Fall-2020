(define (cadr lst)
  (car (cdr lst))
)

(define (take lst n)
  (if (or (null? lst) (= n 0))
      '()
      (cons (car lst) (take (cdr lst) (- n 1)))
  )
)

(define (drop lst n)
  (if (or (null? lst) (= n 0))
      lst
      (drop (cdr lst) (- n 1))
  )
)

(define (split-at lst n)
  (cons (take lst n) (drop lst n))
)


(define (compose-all funcs)
  (lambda (x)
    (if (null? funcs)
        x
        (if (null? (cdr funcs))
            ((car funcs) x)
            ((compose-all (cdr funcs)) ((car funcs) x))
        )
    )
  )
)

