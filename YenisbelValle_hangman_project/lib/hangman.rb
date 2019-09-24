class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word()
    DICTIONARY.sample
  end
  

  def initialize()
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5

  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def secret_word
    @secret_word
  end

  def already_attempted?(char)
    return attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    result = []
    secret_word.each_char.with_index do |letter, i|
      if letter == char
        result << i
      end
    end
    return result  
  end

  def fill_indices(char, indices)
    guess_word.map.with_index do |ele, i|
      if indices.include?(i)
        guess_word[i] = char
      end
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    indxs = self.get_matching_indices(char)
    self.fill_indices(char, indxs)
    if indxs.empty? 
      @remaining_incorrect_guesses -= 1
    end
    return true
  end

  def ask_user_for_guess
    p 'Enter a char'
    response = gets.chomp
    self.try_guess(response) 
  end

  def win?
    if guess_word.join('') == secret_word
      p 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if self.remaining_incorrect_guesses == 0
      p 'LOSE' 
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p self.secret_word
      return true
    else
      return false
    end
  end


end
