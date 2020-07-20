export {}
const mergesort = (arr: number[]): number[] => {
  const length = arr.length
  if (length === 1 || length === 0 || arr === null) {
    return arr
  }

  const result = []
  const mid: number = length / 2
  let left: number[] = arr.slice(0, mid)
  let right: number[] = arr.slice(mid)
  
  left = mergesort(left)
  right = mergesort(right)

  while (left.length && right.length) {
    if (left[0] < right[0]) {
      result.push(left.shift())
    } else {
      result.push(right.shift())
    }
  }

  return [...result, ...left, ...right]
}

const array = [5, 9, 1, 3, 4, 6, 6, 3, 2]
console.log(mergesort(array))
