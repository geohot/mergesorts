mergeSort = (array) ->
  if array.length <= 1
    return (elem for elem in array)

  middle = Math.floor(array.length / 2)
  left = mergeSort(array.slice 0, middle)
  right = mergeSort(array.slice middle)

  result = []
  i = j = 0
  while true
    if i >= left.length
      if j >= right.length
        return result
      result.push right[j]
      j += 1
    else if j >= right.length or left[i] < right[j]
      result.push left[i]
      i += 1
    else
      result.push right[j]
      j += 1
 
do ->
  console.log mergeSort [5,9,1,3,4,6,6,3,2]