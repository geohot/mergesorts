function sort(L, n, s)
  if n < s then
    local m = math.floor((s + n)/2)
    sort(L, n, m)
    sort(L, m+1, s)
    merge(L, n, m, s)
  end
end

function merge(L, n, m, s)
  l, r  = {}, {}
  a, b = m-n+1, s-m

  for i=1, math.max(a,b) do
    l[i] = L[n+i-1]
    r[i] = L[m+i]
  end
  
  x, y = 1, 1
  l[a+1], r[b+1] = 1e309, 1e309
  for j=n, s do
    if l[x] <=r [y] then
      L[j] = l[x]
      x=x+1
    else
      L[j] = r[y]
      y=y+1
    end
  end
end

L = {5,9,1,3,4,6,6,3,2}
sort(L, 1, #L)
print(table.concat(L," "))
