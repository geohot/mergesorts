func merge<T: Comparable>(_ leftArray: [T], _ rightArray: [T]) ->[T] {
    var sortedArray: [T] = []

    var rightIdx = 0
    var leftIdx = 0 

    while leftIdx < leftArray.count && rightIdx < rightArray.count {
        let left = leftArray[leftIdx]
        let right = rightArray[rightIdx]

        if left > right {
            sortedArray.append(right)
            rightIdx += 1
        }
        else if left < right {
            sortedArray.append(left)
            leftIdx += 1
        }
        else {
            sortedArray.append(left)
            leftIdx += 1 
            sortedArray.append(right)
            rightIdx += 1 
        }
    }
    while leftIdx < leftArray.count {
        sortedArray.append(leftArray[leftIdx])
        leftIdx += 1
    } 
    while rightIdx < rightArray.count {
        sortedArray.append(rightArray[rightIdx])
        rightIdx += 1
    }
    return sortedArray
}

func mergeSort<T: Comparable>(_ array: [T]) ->[T] {
    if array.count <= 1 {return array}
    let middleIdx = array.count/2

    let leftArray = mergeSort(Array(array[0..<middleIdx]))
    let rightArray = mergeSort(Array(array[middleIdx..<array.count]))
    return merge(leftArray, rightArray)
}

let test_1 = [5,9,1,3,4,6,6,3,2]
print(mergeSort(test_1))


