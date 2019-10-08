require 'pry'
require 'prime'

def no_dupes?(arry)
    hash = Hash.new(0)
    arry.each {|ele| hash[ele] += 1}
    hash.select {|k| hash[k] == 1} 
end


# # Examples
p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arry)
    arry.each_with_index do |ele, i|
        return false if ele == arry[i + 1]
    end
    true
end

# Examples
p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])   

def char_indices(str)
    hash_indices = Hash.new{|hash, k| hash[k] = []}

    str.each_char.with_index do |letter, i|
        hash_indices[letter] << i
    end
    hash_indices
end

# Examples
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    longest = ''
    substr = ''
    (0..str.length-1).each do |i|
        if str[i] == str[i - 1]
            substr += str[i]
        else
            substr = str[i]
        end
        if substr.length >= longest.length
            longest = substr
        end
    end
    longest

    # str.each_char.with_index do |char, i|
    #     substr = char
    #     str.each_char.with_index do |char2, j|    
    #         if i < j
    #             if char == char2
    #                 substr+= char2
    #             end
    #         end
    #     end
    #     if substr.length >= longest.length
    #         longest = substr
    #     end
    # end
    # longest
end

# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    (1..num).each do |value|
        if num % value == 0
            divisor1 = value
            divisor2 = num / divisor1
            if is_prime?(divisor1) && is_prime?(divisor2) 
               return true
            end
        end
    end
    false
end

def is_prime?(number)
    (2...number).each do |value|
        return false if number % value == 0 
    end
    true
end



# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false





# def vowel_rotate(str)
#     my_vowels = vowel_word(str)

#     count_vowel = 0
#     new_chars = str.chars.map do |char|
#         if 'aeiou'.include?(char)
#           count_vowel += 1  
#           new_idx = count_vowel + 1
#           my_vowels[new_idx % my_vowels.length]
#         else
#           char
#         end
#       end
    
#     new_chars.join("")
# end

# def vowel_word(str)
#     word_vowels = ''
#     str.each_char{ |char| word_vowels += char if 'aeiou'.include?(char) }
#     return word_vowels
# end


# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


def vigenere_cipher(message, keys)
    result = ''
    alpha = ('a'..'z').to_a
    message.each_char.with_index do |c, i|
        orig_idx = alpha.index(c)
        key_val = keys[i % keys.length]
        next_idx = orig_idx + key_val
        next_letter = alpha[next_idx % alpha.length]
        result += next_letter
    end
    result
end


# Examples
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"



class String
    def select(&prc)
        if prc.nil? 
            return ''
        end
        result = ''
        self.each_char do |char|
            if prc.call(char)
                result += char
            end
        end
        result
    end

    # def map!(&prc)
    #     self.each_char.with_index do |char, i|
    #         self[i] = prc.call(char, i)
    #     end
    # end
end

# Examples
str = "app academy"
p str.select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

# Examples
# word_1 = "Lovelace"

# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end

# p word_1.map!        # => "Lov3l4c3"





def multiply(num1, num2)
    return 0 if num2 == 0
    if num2 > 0
        sum = num1 + multiply(num1, num2 - 1)
    else
        sum = -(num1 + multiply(num1, -(num2) - 1))
    end
    sum
end

# Examples
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    arry_lucas = []
    (0..100).each do |value|
        arry_lucas << lucas_number(value) if arry_lucas.length < length
    end
    arry_lucas
end
    
def lucas_number(n)   
    return 2 if n == 0
    return 1 if n == 1
    result_lucas = lucas_number(n - 1) + lucas_number(n - 2)
    return result_lucas
end


# Examples
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


# Examples
def prime_factorization(number)
    (2...number).each do |value|
        
        if number % value == 0
            factor = number/value
            return [prime_factorization(value), prime_factorization(factor)].flatten
        end
    end
    [number]

end 

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
# prime_factorization(25)     # => [5, 5]
# prime_factorization(60)     # => [2, 2, 3, 5]
# prime_factorization(7)      # => [7]
# prime_factorization(11)     # => [11]
# prime_factorization(2017)   # => [2017]
