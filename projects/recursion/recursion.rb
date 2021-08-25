require "byebug"

def range(start, last)
   return [] if last < start
   return [start] if last - start == 1

   return range(start, last - 1) + [last - 1]
end

def int_range(arr)
    sum = 0

    arr.each do |ele|
        sum += ele
    end
    sum
end

# p int_range((1..5).to_a)
# p int_range((23..30).to_a)
# p int_range(7, 5)
# p int_range(2, 21)


def rec_range(arr)
    #base
    return arr.first if arr.length <= 1
    #inductive
    arr.last + rec_range(arr[0..-2])
end

# p rec_range((1..5).to_a)
# p rec_range((23..30).to_a)

def exp1(b , n)
    return 1 if n == 0
    b * exp1(b, n-1)
end

# p exp1(1, 0) # 1
# p exp1(3,3) #27

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1
    return exp2(b, n/2) * exp2(b, n/2) if n % 2== 0
    return b * (exp2(b, (n-1)/2) * exp2(b, (n-1)/2) )
end

# p exp2(1, 0) # 1
# p exp2(3,3) #27

def deep_dup(arr)
    result = []
    arr.each do |ele|
        if ele.is_a?(Array)
            result << deep_dup(ele)
        else
            result <<  ele
        end
    end
    result
end

a = [1,[1,2], 3, [4, 5, [6, 7]]]
b = deep_dup(a)
b [1] << 3
# p a
# p b

def fib(n)
    # base case
    return [] if n <= 0
    return [1] if n == 1 
    return [1, 1] if n == 2 

    prev_fib = fib(n - 1)

    prev_fib << prev_fib[-2] + prev_fib[-1]
end

# p fib(5)
# p fib(1)
# p fib(7)

# def bsearch(arr, target)
#     return nil if target < arr.first
#     return nil if arr.last < target
#     # return nil if arr.length == 1 
    
#     mid_val = arr.length / 2
#     return mid_val if arr[mid_val] == target
#     if arr[mid_val] < target 
#         idx = mid_val + bsearch(arr[mid_val..-1], target)
#         if arr[idx] == target  
#             return idx  
#         else    
#             return nil
#         end
#     end
#     return bsearch(arr[0...mid_val], target) 
# end

def bsearch(arr, target)
    return nil if arr.length < 1 

    mid_val = arr.length / 2

    if arr[mid_val] == target
        return mid_val
    elsif arr[mid_val] < target 
        # mid_val + bsearch(arr[mid_val..-1], target)
        idx = bsearch(arr[mid_val+1..-1], target)
        if idx != nil
            mid_val + idx + 1
        else
            nil
        end
    else
        bsearch(arr[0...mid_val], target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length <= 1
    mid_val = arr.length / 2
    lower = arr[0...mid_val]
    upper = arr[mid_val..-1]
    arr1 = merge_sort(upper)
    arr2 = merge_sort(lower)
    merge(arr1, arr2)
end

def merge(arr1, arr2)
    result = []
    idx1 = 0
    idx2 = 0
    while idx1 < arr1.length && idx2 < arr2.length
        if arr1[idx1] < arr2[idx2]
            result.push(arr1[idx1])
            idx1 += 1
        else
            result.push(arr2[idx2])
            idx2 += 1
        end
    end
    result.concat(arr1[idx1..-1])
    result.concat(arr2[idx2..-1])
    result
end

# p merge_sort([7, 4, 3, 9, 6, 2, 1])
# [7 4 3] [9 6 2 1]
# [7] [4 3] [9 6] [2 1]
# [ ] [7] [4] [3]
# [7] [3, 4]
# [3 , 4 , 7]
require "byebug"

def subsets(arr)
    results = []
    
    return [[]] if arr.length == 0
    
    prev_subs = subsets(arr[0...-1])
    new_arr = prev_subs
    
    new_arr = prev_subs.map do |ele|

        (ele + [arr[-1]])
    end
    prev_subs + new_arr

end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(arr)
    if arr.length == 1
        return [arr]
    end
    result = [] 
    ele = arr[-1]
    puts arr[0...-1]
    first = permutations(arr[0...-1])
    new_array = first.each do |el|
        i = 0
        while i < el.length
            result << (el[0...i] + [ele] + el[i...-1])
            i += 1
        end
    end
    result

    
end

p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]