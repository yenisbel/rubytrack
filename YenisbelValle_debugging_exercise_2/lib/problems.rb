# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
    arry = []
    (1..number).each do |ele|
        if (number % ele == 0 && is_prime?(ele))
            arry.push(ele)
        end
    end
    arry[arry.length - 1]
end

def is_prime?(num)
    (2...num).each do |i|
        return false if num % i == 0
    end
    num > 1
end

def unique_chars?(str)
    hash_letter = Hash.new(0)
    str.each_char do |letter|
        if hash_letter.include?(letter)
            return false
        else
            hash_letter[letter] = 1
        end
    end
    true
end

def dupe_indices(arry)
    hash_du = Hash.new()
    arry.each.with_index do |letter, i|
       hash_du.include?(letter)? hash_du[letter].push(i):hash_du[letter] = [i]
    end
    hash_du.select{|k,v| v.length > 1}
end

def ana_array(arry1,arry2)
    counter(arry1) == counter(arry2)
end

def counter(arry)
    hash = Hash.new(0)
    arry.each{|word| hash[word] += 1}
    return hash
end
