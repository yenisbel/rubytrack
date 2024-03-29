# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

def all_vowel_pairs(words)
    result = []
    words.each_with_index do |word1, j|
        words.each_with_index do |word2, i|
            if i > j
                pairs = word1 + word2
                if vowels_in_pairs(pairs) == true
                    result.push("#{word1} #{word2}")
                end
            end
        end
    end
    return result 
end

def vowels_in_pairs(words)
    vowels = 'aeiou'
    word_vowels = []
    words.each_char do |char|
        if vowels.include?(char)
            word_vowels << char
        end
    end
    word_vowels.uniq.length == vowels.length
end

# def all_vowel_pairs(words)
#     vowels = %w[a e i o u]
#     pairs = []
#     (0...words.length).each do |i|
#         ((i + 1)...words.length).each do |j|
#             pair = [words[i],words[j]].join(' ')
#             pairs << pair if vowels.all? {|v| pair.include?(v)}    
#         end
#     end
#     pairs
# end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    # (2...num).any?{|value| num % value == 0}
    (2...num).each do |value|
        return true if num % value == 0
    end
    false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    bigram_exist = []
    # bigrams.select{|ele| str.include?(ele)}
    bigrams.each do |ele|
        if str.include?(ele)
            bigram_exist << ele
        end
    end
    bigram_exist
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||= Proc.new {|k,v| k == v}
        hash_result = {}
        self.each do |k, v|
            hash_result[k] = v if prc.call(k,v)
        end
        hash_result
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        great_i = []
        self.each_char.with_index do |letter, i|
          start = i
          substr = ''
          self[start, self.length].each_char do |char|
            substr += char
            great_i << substr
          end
        end
        if length
            return great_i.select {|sub| sub.length == length}
        else 
            return great_i
        end
    end

    

    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alpha = ("a".."z").to_a.join('')
        cipher_str = ''
        self.each_char do |letter|
            idx = alpha.index(letter)
            new_idx = idx + num
            new_letter = alpha[new_idx % 26]
            cipher_str += new_letter
        end
        cipher_str
    end

end
