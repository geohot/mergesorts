merge :: [Int] -> [Int] -> [Int]
merge   x [] = x
merge   [] y = y
merge (x:xs) (y:ys)
                  | x > y     = y:(merge (x:xs) ys)
                  | otherwise = x:(merge xs (y:ys))

mergesort :: [Int] -> [Int] 
mergesort     [] = []
mergesort    [x] = [x] 
mergesort [x, y]
               | x > y     = [y, x]
               | otherwise = [x, y]
mergesort x = merge (mergesort $ take p x) (mergesort $ drop p x)
              where p = div (length x) 2

main :: IO()
main = print $ mergesort [5,9,1,3,4,6,6,3,2]
