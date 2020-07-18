(define (merge-sort xs)
  (cond ((or (null? xs) (null? (cdr xs)))
	 xs)
	((null? (cddr xs))
	 `(,(apply min xs) ,(apply max xs)))
	(else
	 (let ((n (fx/ (length xs) 2)))
	   (merge <
		  (merge-sort (list-head xs n))
		  (merge-sort (list-tail xs n)))))))

(display (merge-sort '(5 9 1 3 4 6 6 3 2))) (newline)
