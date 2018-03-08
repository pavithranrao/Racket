#lang racket

;; A generic sort function in Racket
;; that accepts any object as input and
;; a list of predicates instead of one

;; if a collision happens,
;; the items are not sorted to preserve the
;; stability of the sort.



(define (generic-sort input-list predicate-list)
  (sort
   input-list
   (λ (present next)
     (let ([predicate (findf-predicate predicate-list present next)])
     (cond
       [(empty? predicate) #f]
       [else ((predicate-comparator (first predicate))
                ((predicate-extractor (first predicate)) present)
                ((predicate-extractor (first predicate)) next))])))))

(define (findf-predicate predicate-list present next)
  (foldl
          (λ (current-predicate accumulator)
            (if (check-predicate
                 current-predicate present next accumulator)
                (cons current-predicate accumulator)
                accumulator))
          empty predicate-list))

(define (check-predicate
         current-predicate present next accumulator)
  (and (empty? accumulator)
       (not (equal?
             ((predicate-extractor current-predicate) present)
             ((predicate-extractor current-predicate) next)))))


(define-struct predicate (comparator extractor))
(define list-predicate
  (list
    (predicate > first)
    (predicate < second)))

(generic-sort (list
                (list 1 2)
          			(list 2 3)
                (list 2 3)
          			(list 1 1))
          		list-predicate)
