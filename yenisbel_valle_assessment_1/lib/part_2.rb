def element_count(arry)
    hash_words = Hash.new(0)
    arry.each do |word|
        hash_words.include?(word) ? hash_words[word]+=1 : hash_words[word] = 1
    end
    return hash_words
end

def char_replace!(str, hash_letter)
    str.each_char.with_index do |char, i|
        if hash_letter[char]
            str[i] = hash_letter[char]
        end
    end
    return str
end

def product_inject(numbers)
    return numbers.inject{|multiply, number| multiply * number}
end

