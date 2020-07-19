var mergesort = a => a.length < 2 ? a: merge(mergesort(a.splice(0, a.length/2)),mergesort(a))
var merge = (l,r,a=[]) => {
  while(l.length && r.length) l[0]<r[0] ? a.push(l.shift()) : a.push(r.shift())
  return [...a,...l,...r]
}
console.log(mergesort([5,9,1,3,4,6,6,3,2]))
