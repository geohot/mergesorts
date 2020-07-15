
proc mergesort(a: seq[int]): seq[int] =
  if len(a) == 1:
    a
  elif len(a) == 2:
    if a[0] > a[1]:
      @[a[1], a[0]]
    else:
      a
  else:
    let p = len(a) div 2
    let m1 = mergesort(a[0..p-1])
    let m2 = mergesort(a[p..len(a)-1])
    var ret = newSeq[int](len(a))
    var p1 = 0
    var p2 = 0
    var f = 0
    while true:
      if p1 < p and p2 < len(a)-p:
        if m1[p1] <= m2[p2]:
          ret[f] = m1[p1]
          p1 += 1
        else:
          ret[f] = m2[p2]
          p2 += 1
      elif p1 < p:
        ret[f] = m1[p1]
        p1 += 1
      elif p2 < len(a)-p:
        ret[f] = m2[p2]
        p2 += 1
      else:
        break
      f += 1
    ret

let a = @[5,9,1,3,4,6,6,3,2]
echo mergesort(a)

