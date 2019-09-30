require_relative "code"

class Mastermind
    def initialize(number)
        @number = number
        @secret_code = Code::random(number)
    end

    def print_matches(code)
        p @secret_code.num_exact_matches(code)
        p @secret_code.num_near_matches(code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        response = gets.chomp
        code = Code.from_string(response)
        self.print_matches(code)
        @secret_code == code
    end


end
