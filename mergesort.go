package main

import "fmt"

func mergesort(arr []int) []int {
	arrLen := len(arr)
	if arrLen <= 1 {
		return arr
	}

	mid := arrLen / 2
	left := []int(arr[0:mid])
	right := []int(arr[mid:])

	left = mergesort(left)
	right = mergesort(right)

	arr = make([]int, len(left)+len(right))
	var j, k int
	for i := 0; i < len(arr); i++ {
		switch {
		case j >= len(left):
			arr[i] = right[k]
			k++
		case k >= len(right):
			arr[i] = left[j]
			j++
		case left[j] > right[k]:
			arr[i] = right[k]
			k++
		default:
			arr[i] = left[j]
			j++
		}
	}
	return arr
}

func main() {
	a := []int{5, 9, 1, 3, 4, 6, 6, 3, 2}
	fmt.Printf("%v\n", mergesort(a))
}
