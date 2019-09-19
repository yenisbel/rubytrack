def is_prime?(number)
    if number <= 1 
        return false
    end    
    (2...number).each do |num|
        if number % num == 0
            return false
        end
    end
    true
end

def nth_prime(number)
    count = 0
    (1...2000).each do |num|
        if is_prime?(num)
            count += 1
            if count == number
                return num
            end
        end
    end
end
p nth_prime(300)
#     i = 0 
#     ans = []
#     while i < 2000
#         if is_prime?(i)
#             ans << i 
#         end 
#     i = i + 1 
#     end 
#    p ans[number - 1]    




