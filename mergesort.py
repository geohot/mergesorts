
def mergesort(a):
  if len(a) == 1:
    return a
  elif len(a) == 2:
    if a[0] > a[1]:
      return [a[1], a[0]]
    else:
      return a

  p = len(a)//2
  m1 = mergesort(a[:p])
  m2 = mergesort(a[p:])

  ret = []
  while 1:
    if len(m1) > 0 and len(m2) > 0:
      if m1[0] <= m2[0]:
        ret.append(m1[0])
        m1 = m1[1:]
      else:
        ret.append(m2[0])
        m2 = m2[1:]
    elif len(m1) > 0:
      ret += m1
      m1 = []
    elif len(m2) > 0:
      ret += m2
      m2 = []
    else:
      break
  return ret

a = [5,9,1,3,4,6,6,3,2]
print(mergesort(a))

