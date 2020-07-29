(defn merge-sort
  [coll]
  (if (or (empty? coll) (= 1 (count coll)))
    coll
    (let [[l1 l2] (split-at (/ (count coll) 2) coll)]
      (loop [r [] l1 (merge-sort l1) l2 (merge-sort l2)]
        (cond (empty? l1) (into r l2)
              (empty? l2) (into r l1)
              :else (if (> 0 (compare (first l1) (first l2)))
                      (recur (conj r (first l1)) (rest l1) l2)
                      (recur (conj r (first l2)) l1 (rest l2))))))))

(print (merge-sort [5 9 1 3 4 6 6 3 2]))
