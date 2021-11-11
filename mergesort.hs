merge :: (a -> a -> Bool) -> [a] -> [a] -> [a]
merge _      x     [] = x
merge _     []      y = y
merge f (x:xs) (y:ys)
                    | f x y     = y:(merge (x:xs) ys)
                    | otherwise = x:(merge xs (y:ys))

mergesort :: (a -> a -> Bool) -> [a] -> [a] 
mergesort _     [] = []
mergesort _    [x] = [x] 
mergesort f [x, y]
                 | f x y     = [y, x]
                 | otherwise = [x, y]
mergesort f x = merge f (mergesort f (take p x)) (mergesort f (drop p x))
                where
                    p = div (length x) 2

main :: IO()
main = print $ mergesort (>) [5,9,1,3,4,6,6,3,2]
