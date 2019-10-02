# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    greatest = num_1 * num_2
    common_multiple = (2..greatest).select {|multiplo| multiplo % num_1 == 0 && multiplo % num_2 == 0}
    return common_multiple.first

end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)

    str.each_char.with_index do |char, i|
        if i != str.length - 1
            bigram = char + str[i + 1]
        end
        hash[bigram] += 1
    end
    most_frequent = hash.values.max
    hash.each { |k, v| return k if v == most_frequent}

end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverse = {}
        self.each {|k, v| inverse[v] = k}
        return inverse
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0
        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                if i > j
                    pair_sum = ele1 + ele2
                    if pair_sum == num
                        counter += 1
                    end
                end
            end
        end
        return counter
    end



    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new{|n1, n2| n1 <=> n2}

        (0...self.length - 1).each do |i|
            (i + 1...self.length).each do |j|
                if prc.call(self[i], self[j]) == 1
                    self[i], self[j] = self[j], self[i]
                end
            end
        end
        self
    end
end
