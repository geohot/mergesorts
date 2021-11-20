#lang racket

;; https://learningtogetolder.wordpress.com/2013/06/14/merge-sort-in-racket/

(define (merge-lists xs ys)
  (cond
    [(null? xs) ys]
    ;if xs is empty, return ys
    [(null? ys) xs]
    ;if ys is empty, return xs
    [(< (car xs) (car ys))
    ;if the head of list "xs" is bigger than head of list "ys"
     (cons (car xs) (merge-lists (cdr xs) ys))]
     ;cons head xs to (recurse)
    [#t ;I use true as an else cond here - possibly bad style?
     (cons (car ys) (merge-lists xs (cdr ys)))]))
     ;cons head ys to (recurse)

(define (merge-sort xs)
  (cond
    [(or (null? xs) (null? (cdr xs))) xs]
    [(null? (cddr xs))
     (merge-lists (list (car xs)) (cdr xs))]
    [#t
     (let ([x (ceiling (/ (length xs) 2))])
       (merge-lists (merge-sort (take xs x))
                    (merge-sort (drop xs x))))]))

(merge-sort (list 5 9 1 3 4 6 6 3 2))
