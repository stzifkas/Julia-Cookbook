import Base.Threads.@spawn

function quickSort(arr)
    if length(arr) <= 1
        return arr
    end
    pivot = arr[convert(Int64,floor(length(arr)/2))]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    l = @spawn quickSort(left)
    r = quickSort(right)
    a = vcat(middle, r)
    result  = vcat(fetch(l), a)
    return result 
end 

A = rand(1000)*100
A = floor.(A)
B = quickSort(A)
println(B)