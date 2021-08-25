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

p int_range((1..5).to_a)
p int_range((23..30).to_a)
# p int_range(7, 5)
# p int_range(2, 21)


def rec_range(arr)
    #base
    return arr.first if arr.length <= 1
    #inductive
    arr.last + rec_range(arr[0..-2])
end

p rec_range((1..5).to_a)
p rec_range((23..30).to_a)

def exp1(b , n)
    return 1 if n == 0
    b * exp1(b, n-1)
end

p exp1(1, 0) # 1
p exp1(3,3) #27

def exp2(b, n)
    return 1 if n == 0
    return b if n == 1
    return exp2(b, n/2) * exp2(b, n/2) if n % 2== 0
    return b * (exp2(b, (n-1)/2) * exp2(b, (n-1)/2) )
end

p exp2(1, 0) # 1
p exp2(3,3) #27

def deep_dup (arr)
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
p a
p b