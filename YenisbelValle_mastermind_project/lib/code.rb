class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    chars.all? do |char| 
      POSSIBLE_PEGS.has_key?(char) || POSSIBLE_PEGS.has_key?(char.upcase)
    end
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "An error has ocurred"
    end
  end

  def pegs
    @pegs
  end

  def self.random(number)
    ele = POSSIBLE_PEGS.keys.sample
    Code.new(Array.new(number, ele))
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](indx)
    self.pegs[indx]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(guess)
    counter = 0
    self.pegs.each_with_index do |ele, i|
      if guess[i] == ele
        counter += 1
      end
    end
    counter

  end

  def num_near_matches(guess)
    counter = 0
    (0..guess.length).each do |idx|
      if guess[idx] != self.pegs[idx] && self.pegs.include?(guess[idx])
        counter += 1
      end
    end
    counter
  end

  def ==(another)
    self.pegs == another.pegs
  end

end
