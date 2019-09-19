def palindrome?(str)
    return true if (str == reversed(str)) || str.length == 1
    false

end

def reversed(str)
    reverse = ' '
    i = 0
    while i < str.length
        reverse = str[i] + reverse
        i += 1
    end
    reverse.split(' ').join('')
end

def substrings(str)
    arry = []
    
    (0...str.length).each do |idx1|
        (idx1...str.length).each do |idx2|
            substr = str[idx1..idx2]
            arry.push(substr)
        end
    end
    return arry
end

def palindrome_substrings(str)
    #substrings and palidrome?
    substrings(str).select{|substr| palindrome?(substr) && substr.length > 1} 
end
