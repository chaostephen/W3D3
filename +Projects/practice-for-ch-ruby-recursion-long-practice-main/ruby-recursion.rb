require "byebug"
# Warmup Range - Recursive
# def range(start, finish)
#     # base case
#     return [] if finish <= start
#     range(start, finish-1) << finish - 1
# end

# # Handles any order of start/finish
# def range(start, finish)
#     # base case
#     max = [start,finish].max
#     min = [start,finish].min
#     return [] if max <= min
#     range(min, max-1) << max - 1
# end

def range(start,finish)
    ranges=[]
    (start...finish).each do |num|
        ranges<<num
    end
    ranges
end

# def sum(array) #recursive
#     return 0 if array.length==0
#     return array[0] if array.length==1
#     array[0] + sum(array[1..-1])
# end

# def sum(array) #iterative
#     sum=0
#     array.each do |ele|
#         sum+=ele
#     end
#     sum
# end


# First Recursion
def exponentiation_1(base,power)
    return 1 if power==0
    return base if power==1
    base*exponentiation_1(base,power-1)
end

# Second Recursion
def exponentiation_2(base, power)
    return 1 if power == 0
    return base if power == 1

    if power % 2 == 0
        exponentiation_2(base, power / 2) ** 2 # if n is even
    else
        base * (exponentiation_2(base, (power - 1)/2) ** 2)
    end

end


# p exponentiation_1(0, 1)
# p exponentiation_2(0, 1)

# p exponentiation_1(1, 1)
# p exponentiation_2(1, 1)

# p exponentiation_1(1, 2)
# p exponentiation_2(1, 2)

# p exponentiation_1(2, 0)
# p exponentiation_2(2, 0)

# p exponentiation_1(2, 1)
# p exponentiation_2(2, 1)

# p exponentiation_1(2, 2)
# p exponentiation_2(2, 2)


def dupe(array)
    result = []
    return [] if array.length==0
    array.each.with_index do |ele, idx|
        if ele.is_a?(Array)
          result[idx]=dupe(ele)
        else
            result[idx]=ele
        end
    end
    result
end
# random=[1,2,3]
# p dupe([[1,2,3],2])
# p random.object_id
# p dupe([random])
# p dupe([random]).object_id

def fib(n)
    
    return [0] if n==0
    return [0,1] if n==1
    return [0,1,1] if n==2

    sequence = fib(n-1)

    sequence << sequence[-1] + sequence[-2] 
end

# p fib(0)#[0]
# p fib(1)#[0,1]
# p fib(2)#[0,1,1]
# p fib(3)#[0,1,1,2]
# p fib(4)#[0,1,1,2,3]
# p fib(5)#[0,1,1,2,3,5]


## Binary Search
def bsearch(array, number)
    if array.length == 1 && array[0]!=number
        return nil 
    end
    if array[0] == number
        return 0
    end 

    middle = (array.length / 2)
    # debugger
    
    if array[middle]==number
        return middle
    end
    if array[middle] < number && array.include?(number)
            middle+1 + bsearch(array[(middle + 1)..-1], number)
    elsif array[middle] > number
        # if bsearch(array[(middle+1)..-1],number)==nil
            bsearch(array[0...middle], number)
        # end
    else
        return nil
    end

    # if array[middle] == number
    #     bsearch(array[middle], number)
    # elsif array[middle] <= number
    #     # array[0], array[middle] = array[middle], array[0]


    #     left = array.slice(0..middle)
    #     p left
    #     bsearch(left, number)
    # else
    #     right = array.slice(middle...-1)
    #     p right
    #     bsearch(right,number)
    # end


    # array.each.with_index do |ele,idx|
    #     if array[middle]<number
    #         left << array[middle]
    #         bsearch(left,number)
    #     else
    #         right << array[middle]
    #         # bsearch(right,number)
    #     end
    # end
    # p left
    # p right


end

#base cases
# p bsearch([1], 1) #=> 0
# p bsearch([3], 2) #=> nil

# # debugger
# p bsearch([1, 2, 3], 1) # => 0 :check:
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
def bubble_sort(array)
    n = array.length
  
    loop do
      swapped = false
  
      (n - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i] # Swap elements
          swapped = true
        end
      end
  
      break unless swapped # If no swaps were made, the array is sorted
    end
  
    array
end

def merge_sort(array)    
    if array.length <= 1
        return array
    end

    middle = array.length / 2
    left = array[0...middle]
    right = array[middle..-1]
    temp = left

    

    # if left[0] > right[0] 
    #     left = right
    #     right = temp
    # #     return right[0] + left[0]
    # end

    sorted_left = bubble_sort(left)
    sorted_right = bubble_sort(right)
    
    merge(sorted_left, sorted_right)
end

def merge(arr1, arr2)
    result = []

    while arr1.length > 0 || arr2.length > 0
        if arr1[0]==nil
            result<<arr2.shift
        elsif arr2[0]==nil
            result<<arr1.shift
        else
            # debugger
            if arr1[0]<arr2[0]
                result<<arr1.shift
            else
                result<<arr2.shift
            end
        end
    end 
    result
end

# base case 1 - length 0
# p merge_sort([]) # => []
# # # # base case 2 - length 1
# p merge_sort([1]) #=> [1]

# p merge_sort([1, 2]) #=> [1, 2] -- doesn't do anything - returns what you give it
# p merge_sort([2, 1]) #=> [1, 2] but erroneously returns 3
# p merge_sort([1, 2, 3, 4]) #=> [1, 2, 3, 4] -- doesn't do anything - returns what you give it
p merge_sort([3, 7, 2, 9]) #=> [2, 3, 7, 9]
# p merge_sort([183, 27])


# def subsets(arr)
#     # base case
#     result=[]
#     return [[]] if arr.length <= 0
#     return subsets([]) + [arr] if arr.length == 1
#     (0...arr.length).each do |ele|
#         (ele...arr.length).each do |ele1|
#             result<<arr[ele...ele1]
#         end
#     end      
#         # subsets(arr[0...arr.length-ele])

#     result
# end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[],[1],[2],[1,2],[3],[2,3],[1,3],[1,2,3]]