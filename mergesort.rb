def mergesort(a)
  if a.length == 1
    return a
  elsif a.length == 2
    return a[0] > a[1] ? [a[1], a[0]] : a
  end

  p = a.length/2
  m1 = mergesort(a.take(p))
  m2 = mergesort(a.drop(p))

  ret = []
  while m1.length > 0 or m2.length > 0
     if m2.first.nil? or (!m1.first.nil? and m1.first <= m2.first)
        ret << m1.first
        m1 = m1.drop(1)
     elsif m1.first.nil? or (!m2.first.nil? and m2.first <= m1.first)
        ret << m2.first
        m2 = m2.drop(1)
      end
    end
  ret
end


a = [5,9,1,3,4,6,6,3,2]
print(mergesort(a))