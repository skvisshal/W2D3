class HumanPlayer

    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts "Enter a position"
        response = gets.chomp
        array = response.split.map! {|ele| ele.to_i}
        if array.length != 2
            raise "incorrecty format"
        end
        array 
    end

end