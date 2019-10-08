def factors_of(num)
    factors = []
  
    i = 1
    while i <= num
      if num % i == 0
        factors << i
      end
  
      i += 1
    end
  
    return factors
end

#bubble_sort!(&prc)
#bubble_sort(&prc)


def substrings(string)
  subs = []
  (0..string.length - 1).each do |idx_1|
    (idx_1..string.length - 1).each do |idx_2|
      subs << string[idx_1..idx_2]
    end
  end
  subs
end

def subwords(word, dictionary)
  result = substrings(word).select{|sub| dictionary.include?(sub)}
  result.uniq
end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
  array.map{|el| el * 2}
end