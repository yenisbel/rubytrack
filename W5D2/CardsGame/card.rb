class Card
    VALUES = ("A".."Z").to_a
  
    def self.shuffled_pairs(num_pairs)
      values = VALUES
  
      while num_pairs > values.length
        values = values + values
      end
      c = values.sort_by{rand}
      values = c.take(num_pairs) * 2
      values.shuffle!
      values.map { |val| self.new(val) }
    end


  def initialize(value, revealed = false)
    @value = value
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def to_s
    revealed? ? value.to_s : " "
  end

  def reveal
    @revealed = true
  end

  def revealed?
    @revealed
  end

  def ==(object)
    object.is_a?(self.class) && object.value == value
  end
end