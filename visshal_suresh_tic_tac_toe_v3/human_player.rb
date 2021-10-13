class HumanPlayer

    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts "Enter a position"
        response = gets.chomp
        array = response.split.map! {|ele| ele.to_i}
        if array.length != 2
            raise "incorrect format"
        end

        while !legal_positions.include?(array)
            puts "Not Valid, Enter a position"
            response = gets.chomp
            array = response.split.map! {|ele| ele.to_i}
            if array.length != 2
                raise "incorrect format"
            end
        end
        array 
    end

end