def my_map(arry, &block)
    new_arry = []
    arry.each do |ele|
        new_ele = block.call(ele)
        new_arry.push(new_ele)
    end
    new_arry
end

def my_select(arry, &prc)
    new_arry = []
    arry.each do |ele|
        if prc.call(ele)
            new_arry.push(ele)
        end
    end
    new_arry
end


def my_count(arry, &prc)
    counter = 0
    arry.each do |item|
        if prc.call(item)
            counter += 1
        end
    end
    counter
end

def my_any?(arry, &block)
    arry.each do |ele|
        if block.call(ele)
            return true
        end
    end
    return false
end

def my_all?(arry, &prc)
    arry.each do |ele|
        if !(prc.call(ele))
            return false
        end
    end
    return true

end

def my_none?(arry, &prc)
    arry.each do |ele|
        if prc.call(ele)
            return false
        end
    end
    return true
end