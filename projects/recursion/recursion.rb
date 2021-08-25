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
