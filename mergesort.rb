def mergesort(a)
  if a.length == 1
    return a
  elsif a.length == 2
    if a[0] > a[1]
      return [a[1], a[0]]
    else
      return a
    end
  end

  p = a.length/2
  m1 = mergesort(a.take(p))
  m2 = mergesort(a.drop(p))

  ret = []
  while 1
    if m1.length > 0 and m2.length > 0
      if m1[0] <= m2[0]
        ret << m1[0]
        m1 = m1.drop(1)
      else
        ret << m2[0]
        m2 = m2.drop(1)
      end
    elsif m1.length > 0
      ret += m1
      m1 = []
    elsif m2.length > 0
      ret += m2
      m2 = []
    else
      break
    end
  end
  return ret
end


a = [5,9,1,3,4,6,6,3,2]
print(mergesort(a))