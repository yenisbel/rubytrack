# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    result = ''
    hash = Hash.new(0)
    str.each_char do |char|
        hash.include?(char) ? hash[char]+= 1 : hash[char] = 1
    end
    
    hash.each do |k,v|
        if v == 1
            result += k
        else
            result += v.to_s
            result += k
        end
    end
    return result

end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
