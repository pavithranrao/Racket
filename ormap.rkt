#lang racket

(define (ormap predicate xs)
  (cond
    [(empty? xs) #f]
    [else
      (or  (predicate (first xs))
            (ormap predicate (rest xs)))]))

(define (even? x)
  ( = (modulo x 2) 0))

(define list '(1 2 3 4 5 6))
(define ans (ormap even? list))
ans

(define list2 '(1 3))
(define ans2 (ormap even? list2))
ans2
