def average(num1, num2)
    return (num1 + num2)/2.0
end

def average_array(arry)
    return arry.sum/(arry.length * 1.0)
end

def repeat(str, num)
    result = ''
    num.times do
        result += str
    end
    result
end

def yell(str)
    return "#{str.upcase}!"
end



def alternating_case(str)
    new_sentence = []
    str.split(' ').each_with_index do |word, i|
        if i.odd?
            new_sentence.push(word.downcase)
        else
            new_sentence.push(word.upcase)
        end
    end
    new_sentence.join(' ')
end
