#  # calls my_each twice on the array, printing all the numbers twice.
#  #Extend the Array class to include a method named my_each that takes a block, 
#  #calls the block on every element of the array, and returns the original array. 

 require 'byebug'

 class Array
    
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        arry = self.my_each(&prc)
        result = []
        i = 0
        while i < arry.length
            if prc.call(arry[i])
                result << arry[i]
            end
            i += 1
        end
        result
    end

    def my_any?(&prc)
        return self.my_select(&prc).length == 0
    end

    def my_all?(&prc)
        return self.my_select(&prc).length == self.length
    end

    def my_flatten
        result = []
        self.each do |ele|
            if ele.class == Array
                result += ele.my_flatten
            else
                result << ele
            end
        end
        result     
    end

    def my_zip(a, b)
        c = self.map.with_index { |_, idx| [self[idx], a[idx], b[idx]] }
        return c
    end

    def my_rotate(num = 1)
        split = num % self.length
        self.drop(split) + self.take(split)
    end

    def my_join(separator = '')
        str = '' 
        self.each.with_index do |value, i|
            if i == self.length - 1
                str += value
            else
                str += value + separator
            end
        end
        str

    end

    def my_reverse
        reversed = []
        self.each {|el| reversed.unshift(el)}
        reversed  
    end
 end






