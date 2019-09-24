class GuessingGame
    def initialize(min, max)
        @min = min
        @max = max
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def min
        @min
    end

    def max
        @max
    end

    def secret_num
        @secret_num
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if @secret_num == num
            puts "you win"
            @game_over = true
        elsif num > self.secret_num
            puts 'too big'
        else
            puts 'too small'
        end
    end

    def ask_user
        p "enter a number"
        response = gets.chomp.to_i
        self.check_num(response)
    end

end
