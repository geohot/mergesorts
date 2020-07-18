func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
    let leftSubarray = Array(array[startIndex...middleIndex])
    let rightSubarray = Array(array[middleIndex+1...endIndex])
    
    var index = startIndex
    var leftIndex = 0
    var rightIndex = 0
    
    while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
        if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
            array[index] = leftSubarray[leftIndex]
            leftIndex += 1
        }
        else {
            array[index] = rightSubarray[rightIndex]
            rightIndex += 1
        }
        index += 1
    }
    
    while leftIndex < leftSubarray.count {
        array[index] = leftSubarray[leftIndex]
        index += 1
        leftIndex += 1
    }
    
    while rightIndex < rightSubarray.count {
        array[index] = rightSubarray[rightIndex]
        index += 1
        rightIndex += 1
    }
}