class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all? {|ele| POSSIBLE_PEGS.include?(ele.upcase)}
  end

  attr_reader :pegs
  def initialize(array)
    if !Code.valid_pegs?(array)
      raise "not valid pegs"
    else
      @pegs = array.map {|ele| ele.upcase}
    end
  end

  def self.random(length)
    keyArray = POSSIBLE_PEGS.keys
    randomArray = []
    length.times {randomArray.push(keyArray.sample)}
    Code.new(randomArray)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    count = 0;
    code.pegs.each.with_index {|ele, i| count +=1 if ele == @pegs[i]}
    count
  end

  def num_near_matches(code)
    incorrectA = @pegs.select.with_index {|ele, i| ele != code.pegs[i]}
    incorrectB = code.pegs.select.with_index {|ele, i| ele != @pegs[i]}
    (incorrectA & incorrectB).length
  end

  def ==(code)
    code.pegs == @pegs
  end
end
