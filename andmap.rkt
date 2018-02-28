#lang racket

(define (andmap predicate xs)
  (cond
    [(empty? xs) #t]
    [else
      (and  (predicate (first xs))
            (andmap predicate (rest xs)))]))

(define (even? x)
  ( = (modulo x 2) 0))

(define list '(2 4 6))
(define ans (andmap even? list))
ans

(define list2 '(1 3))
(define ans2 (andmap even? list2))
ans2
