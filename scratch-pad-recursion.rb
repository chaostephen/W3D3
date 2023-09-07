# require 'byebug'
def factorial(num)
    # base case
    # debugger
    return 1 if num == 1

    # debugger
    # recursive step
    num * factorial(num - 1)
end

# p factorial(5)


def iterative_upcase(str)
    str.chars.inject("") do |upcased_str, char|
        upcased_str << char.upcase
    end
end

# debugger
# p iterative_upcase('hello')

def rec_sum(n)
    return n if n == 1

    n + rec_sum(n-1)
end

# p rec_sum(5)
# p rec_sum(2)
# p rec_sum(3)
# p rec_sum(4)
# p rec_sum(5)

def fibs(n)
    return 0 if n == 1
    return 1 if n == 2
    fibs(n - 1) + fibs(n - 2)
end

# p fibs(1) #=> 0
# p fibs(2) #=> 1
# p fibs(3) #=> 1
# p fibs(4) #=> 2
# p fibs(5) #=> 3
# p fibs(6) #=> 5


def all_fibs(n)
    return [0,1] if n == 2
    return [0] if n == 1
    return [] if n == 0

    # left hand will always return an array since we have 3 base cases
    # right hand side is essentially all_fibs(3) base case [0, 1, 1] and the bracket [-2] and [-1]
    # allows us to use the last two eles for summation and push into the left hand array
    all_fibs(n-1) << (all_fibs(n-1)[-2] + all_fibs(n-1)[-1]) 

end

# p all_fibs(0) #=> []
# p all_fibs(1) #=> [0]
# p all_fibs(2) #=> [0, 1]
# p all_fibs(3) #=> [0, 1, 1]
# p all_fibs(4) #=> [0, 1, 1, 2]
# p all_fibs(5) #=> [0, 1, 1, 2, 3]


# requires 14 calls to calculate fast_all_fibs(15)
# vs
# all_fibs(15) requiring 2.4m calls to all_fibs to calculate
def fast_all_fibs(n)
    return [0, 1].take(n) if n <= 2

    previous_fibs = fast_all_fibs(n - 1)
    previous_fibs << (previous_fibs[-2] + previous_fibs[-1])
end

p fast_all_fibs(0) #=> []
p fast_all_fibs(1) #=> [0]
p fast_all_fibs(2) #=> [0, 1]
p fast_all_fibs(3) #=> [0, 1, 1]
p fast_all_fibs(4) #=> [0, 1, 1, 2]
p fast_all_fibs(5) #=> [0, 1, 1, 2, 3]


def pascal_row(n)
    return [1] if n == 0
    prev_row = pascal_row(n - 1)

    new_row = []

    (0...prev_row.length - 1).each do |i|
        new_row << prev_row[i] + prev_row[i + 1]
    end

    [1] + new_row + [1]
end

p pascal_row(0) #=> [1]
p pascal_row(1) #=> [1, 1]
p pascal_row(2) #=> [1, 2, 1]
p pascal_row(3) #=> [1, 3, 3, 1]
p pascal_row(4) #=> [1, 4, 6, 4, 1]
p pascal_row(5) #=> [1, 5, 10, 10, 5, 1]