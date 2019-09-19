def proper_factors(number)
    factors = []
    (1...number).each do |num|
        if number % num == 0
            factors.push(num)
        end
    end
    factors
end

def aliquot_sum(number)
    proper_factors(number).sum
end

def perfect_number?(number)
    number == aliquot_sum(number)
end

def ideal_numbers(n)
    arry = []
    (1...1000).each do |num|
        if perfect_number?(num)
            arry.push(num)
        end
        return arry if arry.length == n
    end
end