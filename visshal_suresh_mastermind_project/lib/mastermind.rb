require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code)
        puts code.num_exact_matches(@secret_code)
        puts code.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        response = gets.chomp
        guess = Code.from_string(response)
        self.print_matches(guess)
        guess == @secret_code ? true : false
    end

end
