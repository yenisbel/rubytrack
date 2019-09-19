def hipsterfy(str) 
    i = str.length - 1
    while i >= 0
        if 'aeiou'.include?(str[i])
            return str[0...i] + str[i+1..-1]
        end
        i -= 1
    end
    return str
end

def vowel_counts(str)
    hashword = Hash.new(0)
    str.each_char do |char|
        if 'aeiou'.include?(char)
            hashword.include?(char)? hashword[char]+= 1 : hashword[char] = 1
        end
    end
    return hashword
end

p vowel_counts("williamsburg bridge")

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ""
  
    str.each_char do |char|
        if alphabet.include?(char)
            old_idx = alphabet.index(char)
            new_idx = old_idx + num
            new_char = alphabet[new_idx % 26]
            new_str += new_char
        else
            new_str += char
        end
    end
  
    return new_str
end

