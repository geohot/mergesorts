package main

import "fmt"

func mergesort(arr []int) []int {
	if len(arr) <= 1 {
		return arr
	}

	left := []int(arr[0 : len(arr)/2])
	right := []int(arr[len(arr)/2:])

	left = mergesort(left)
	right = mergesort(right)

	arr = make([]int, len(left)+len(right))
	j, k := 0, 0
	for i := 0; i < len(arr); i++ {
		if j >= len(left) {
			arr[i] = right[k]
			k++
			continue
		} else if k >= len(right) {
			arr[i] = left[j]
			j++
			continue
		} else if left[j] > right[k] {
			arr[i] = right[k]
			k++
		} else {
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
