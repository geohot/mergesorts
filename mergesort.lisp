(defun mergesort (arr)
    (if (or (null arr) (or (not(cdr arr)) (= (length arr) 1)))
        arr
        (let ((mid (truncate (/ (length arr) 2))))
        (merge (type-of arr)
        (mergesort (subseq arr 0 mid))
        (mergesort (subseq arr mid)) #'<))))

(print (mergesort'(5 9 1 3 4 6 6 3 2)))
