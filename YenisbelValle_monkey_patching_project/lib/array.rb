# Monkey-Patch Ruby's existing Array class to add your own custom methods

class Array
    def span
        if self.empty?
            return nil
        end
        return self.sort[length - 1] - self.sort[0]
    end

    def average
        if self.empty?
            return nil
        end
        return self.sum / (self.length * 1.0)
    end

    def median
        if self.empty?
            return nil
        end
        if self.length.odd?
            return self.sort[length/2]
        else
            first_mid = self.sort[(length/2) - 1]
            sec_mid = self.sort[length/2]
            return [first_mid,sec_mid].average
        end
    end

    def counts
        has_new = Hash.new(0)
        self.each {|ele| has_new[ele] += 1}
        return has_new
    end

    def my_count(value)
        self.counts.has_key?(value)
        return self.counts[value]
    end

    def my_index(value)
        
        if self.my_count(value) == 1 || self.my_count(value) > 1
            self.each_with_index do |item, i|
                return i if item == value
            end
        else 
            return nil
        end
    end

    def my_uniq
        self.counts.keys
    end

    def my_transpose
        rows = self.length
        cols = self.first.length
        new_transpose = Array.new(cols){ Array.new(rows) }
        # trougth the rows 
        self.each_with_index do |row, idx|
            # troug colum by row
            row.each_with_index do |item, idx1|
                # swap, first colum then row
                new_transpose[idx1][idx] = item
            end
        end
        return new_transpose
    end
    
end
