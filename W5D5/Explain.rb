# My_each
# that takes a block, calls the block on every element of the array, and returns the original array. 

# Write a method that calls a passed block for each element of the array
# calls my_each twice on the array, printing all the numbers twice.
#  #Extend the Array class to include a method named my_each that takes a block, 
#  #calls the block on every element of the array, and returns the original array. 

### Solution


class Array
  def my_each(&blk)
    i = 0
    while i < length
      blk.call(self[i])
      i += 1
    end
    self
  end


# my_select that takes a block and returns a new array containing only elements that satisfy the block.

### my_reduce

Write an array method that calls the given block on each element and
combines each result one-by-one with a given accumulator. If no accumulator is given, 
the first element is used.

### Solution

```rb
class Array
  def my_reduce(accumulator = nil, &block)
    i = 0
    if accumulator.nil?
      accumulator = self.first
      i += 1
    end

    while i < length
      accumulator = block.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

### my_flatten

Write a method that flattens an array to the specified level. If no level
is specified, it should entirely flatten nested arrays.

Examples:

```ruby
# Without an argument:
[["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

# When given 1 as an argument:
# (Flattens the first level of nested arrays but no deeper)
[["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]


### Solution
class Array
  def my_flatten(level = nil)
    duped = self.dup
    return duped if level == 0
    next_level = level ? level - 1 : nil

    each_with_index do |el, i|
      duped[i..i] = el.my_flatten(next_level) if el.is_a?(Array)
    end

    duped
  end
end


### Shuffled Sentences
# This method returns true if the words in the string can be rearranged to form the
# sentence passed as an argument. Words are separated by spaces.

Example:

```ruby
"cats are cool".shuffled_sentence_detector("dogs are cool") => false
"cool cats are".shuffled_sentence_detector("cats are cool") => true
```
### Solution
class String
  def shuffled_sentence_detector(other)
    self.split.sort == other.split.sort
  end
end

### dups

array method that returns a hash where the keys are any element
that appears in the array more than once, and the values are sorted arrays
of indices for those elements.

### Solution

class Array
  def dups
    positions = Hash.new { |h, k| h[k] = [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end

###Recursion
Write a method that finds the first `n` Fibonacci numbers recursively.

def fibs_rec(count)
  return [0, 1].take(count) if count <= 2

  first_fibs = fibs_rec(count - 1)
  next_fib = first_fibs[-1] + first_fibs[-2]
  first_fibs << next_fib

  first_fibs
end

Write a method that recursively finds the first `n` factorial numbers
and returns them. N! is the product of the numbers 1 to N.
Be aware that the first factorial number is 0!, which is defined
to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.

<!-- The first equation is the base case: 0! is, trivially, 1. 
For any n > 1, we can use the second equation to break the problem into a smaller one. -->

def factorial(n)
  if n == 0 # the base case
    1
  else # the recursive case
    n * factorial(n - 1)
  end
end

def factorials_rec(num)
    if num == 1
      [1]
    else
      facs = factorials_rec(num - 1)
      facs << facs.last * (num - 1)
      facs
    end
end


### Digital Root

Write a method, `digital_root(num)`. It should Sum the digits of a positive
integer. If it is greater than 10, sum the digits of the resulting number.
Keep repeating until there is only one digit in the result, called the
"digital root". **Do not use string conversion within your method.**

You may wish to use a helper function, `digital_root_step(num)` which performs one step of the process.

### Solution
def digital_root(num)
  while num > 10
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)

    num /= 10
  end

  root
end

## Largest Prime Factor

Write a method that returns the largest prime factor of a number. 
 writing a `is_prime?` helper method.

### Solution
def prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def largest_prime_factor(num)
  num.downto(2) do |factor|
    if (num % factor).zero?
      return factor if prime?(factor)
    end
  end

  nil
end


## Merge and Sorts
### Merge Sort

Write a new `Array#merge_sort` method that takes in a proc; it should not modify the array it is called on, but create a new sorted array.
# 1. Find the middle point to divide the array into two halves:  
# middle m = (l+r)/2
# 2. Call mergeSort for first half:   
# Call mergeSort(arr, l, m)
# 3. Call mergeSort for second half:
# Call mergeSort(arr, m+1, r)
# 4. Merge the two halves sorted in step 2 and 3:
# Call merge(arr, l, m, r)

### Solution

class Array
  def merge_sort(&prc)
    return self if count <= 1

    # I create a Proc if no block was given; this eliminates having to
    # later have two branches of logic, one for a block and one for no
    # block.
    prc ||= proc { |x, y| x <=> y }

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    self.class.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left).concat(right)
  end
end

#Sorts
### Binary Search

Write a method that binary searches an array for a target and returns its
index if found. Assume a sorted array.

NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).

For example, given the array [1, 2, 3, 4], you should NOT be checking
1 first, then 2, then 3, then 4.

### Solution

def binary_search(arr, target)
  return nil if arr.empty?

  midpoint = arr.length / 2
  case target <=> arr[midpoint]
  when -1
    binary_search(arr[0...midpoint], target)
  when 0
    midpoint
  when 1
    subproblem_answer = binary_search(arr[(midpoint + 1)..-1], target)
    (subproblem_answer.nil?) ? nil : (midpoint + 1) + subproblem_answer
  end
end


### Jumble Sort

Jumble sort takes a string and an alphabet. It returns a copy of the string
with the letters re-ordered according to their positions in the alphabet. If
no alphabet is passed in, it defaults to normal alphabetical order (a-z).

Example:

```rb
jumble_sort("hello") => "ehllo"
jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'
```

### Solution

```rb
def jumble_sort(str, alphabet = nil)
  alphabet ||= ('a'..'z').to_a

  sorted = false
  until sorted
    sorted = true

    str.length.times do |i|
      break if i == (str.length - 1)
      if alphabet.index(str[i]) > alphabet.index(str[i + 1])
        str[i], str[i + 1] = str[i + 1], str[i]
        sorted = false
      end
    end
  end

  str
end

# Alternately:
#
# def jumble_sort(str, alphabet = nil)
#   alphabet ||= ('a'..'z').to_a
#
#   sorted_chars = str.chars.sort do |chr1, chr2|
#     alphabet.index(chr1) <=> alphabet.index(chr2)
#   end
#
#   sorted_chars.join
# end
```
