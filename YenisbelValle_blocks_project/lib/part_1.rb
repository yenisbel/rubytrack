def select_even_nums(numbers)
    numbers.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arrays)
    arrays.count{|arry| arry.sum > 0}
end

def aba_translate(str)
    translated = ""
    str.each_char.with_index do |char, i|
        if 'aeiou'.include?(char)
            translated += char + "b"+ char
        else
            translated += char
        end
    end
    translated
end

def aba_array(words)
    words.map{|word| aba_translate(word)}
end