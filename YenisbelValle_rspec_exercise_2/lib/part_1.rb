def partition(arry, number)
    parts = []
    parts_less = []
    parts_greater = []
    arry.each do |ele|
        if ele < number
            parts_less.push(ele)
        else
            parts_greater.push(ele)
        end
    end
    parts.push(parts_less)
    parts.push(parts_greater)
    return parts
end

def merge(hash1, hash2)
    hash3 = {}
    hash1.each {|k,v| hash3[k] = v}
    hash2.each {|k,v| hash3[k] = v}
    return hash3
end


def censor(str, arry)
    arry_words = str.split(' ')

    curse = arry_words.map do |word|
        if arry.include?(word.downcase)
            change_vowel(word)
        else
            word
        end
    end
    return curse.join(' ')           
end

def change_vowel(str)
    new_word = ''
    str.each_char do |char|
        if 'aeiou'.include?(char.downcase)
            new_word += '*'
        else
            new_word += char
        end
    end
    return new_word
end

def power_of_two?(number)
    multiply = 1
    while multiply < number
        multiply *=2
    end
    multiply == number
end

