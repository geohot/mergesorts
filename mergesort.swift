func merge<T: Comparable> (array: inout [T], startindex: Int, middleindex: Int, endindex: Int) {
    let leftSubarray = Array(array[startindex...middleIndex])
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
    
    while leftindex < leftSubarray.count {
        array[index] = leftSubarray[leftindex]
        index += 1
        leftindex += 1
    }
    
    while rightindex < rightSubarray.count {
        array[index] = rightSubarray[rightindex]
        index += 1
        rightindex += 1
    }
}