merge :: [Int] -> [Int] -> [Int]
merge x [] = x
merge [] y = y
merge (x:xs) (y:ys) =
  if x > y
  then y:(merge (x:xs) ys)
  else x:(merge xs (y:ys))

mergesort :: [Int] -> [Int]
mergesort [] = [] 
mergesort [x] = [x] 
mergesort [x,y] = if x > y then [y,x] else [x,y]
mergesort x = 
  let p = div (length x) 2 in
  merge (mergesort $ take p x) (mergesort $ drop p x)

main :: IO()
main = putStrLn $ show $ mergesort [5,9,1,3,4,6,6,3,2]

