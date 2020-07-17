function mergesort(arr)
    function merge(m1, m2)
        j = 1
        k = 1
        result = Int64[]
        while true
            if m1[j] > m2[k]
                append!(result, [m2[k]])
                k += 1
            else
                append!(result, [m1[j]])
                j += 1
            end
            if j == length(m1) + 1
                append!(result, m2[k:end])
                break
            end
            if k == length(m2) + 1
                append!(result, m1[j:end])
                break
            end
        end
        return result
    end

    n = length(arr)
    if n < 2
        return arr
    elseif n == 2
        if arr[1] > arr[2]
            temp = arr[1]
            arr[1] = arr[2]
            arr[2] = temp
        end
        return arr
    else
        lhs = mergesort(arr[1 : div(n, 2)])
        rhs = mergesort(arr[div(n, 2) + 1 : end])
        return merge(lhs, rhs)
    end
end
 
v = [5,9,1,3,4,6,6,3,2]
println(mergesort(v))