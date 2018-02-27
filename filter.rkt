#lang racket

(define (filter predicate xs)
  (cond
    [(empty? xs) null]
    [else (if (predicate (first xs))
            (cons (first xs) (filter predicate (rest xs)))
            (filter predicate (rest xs)))]))

(define (even? x)
  ( = (modulo x 2) 0))

(define list '(1 2 3 4 5))

(define ans (filter even? list))
ans
