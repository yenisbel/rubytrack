def reverser(str, &block)
    new_str = str.reverse
    block.call(new_str)
end

def word_changer(str, &prc)
    new_sentence = []
    str.split(' ').each do |word|
        new_sentence << prc.call(word)
    end
    new_sentence.join(' ')
end

def greater_proc_value(number, prc1, prc2)
    return prc1.call(number) > prc2.call(number)? prc1.call(number): prc2.call(number)
end

def and_selector(arry, prc1, prc2)
    new_arry = []
    arry.each do |num|
        if prc1.call(num) && prc2.call(num)
            new_arry << num
        end
    end
    return new_arry
end

def alternating_mapper(arry, prc1, prc2)
    new_arry = []
    arry.each_with_index do |ele, i|
        if i % 2 == 0
           new_arry << prc1.call(ele)
        else
            new_arry << prc2.call(ele)
        end  
    end
    return new_arry
end