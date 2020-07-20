merge = (l, r, a=[]) -> 
  while l.length and r.length 
    if l[0] < r[0] then a.push(l.shift()) else a.push(r.shift())
  return [a..., l..., r...]
mergesort = (a) -> 
  if a.length < 2 then a else merge(mergesort(a.splice(0, a.length/2)), mergesort(a))
console.log mergesort([5, 9, 1, 3, 4, 6, 6, 3, 2])
