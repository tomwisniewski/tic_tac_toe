class TicTacToe

  CROSS = "X"
  NOUGHT = "0"

  attr_accessor :board

  def initialize(input)
    raise "The input must have 9 values" if input.length != 9
    @board = input.split("")
    @winning_combinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8],
                              [0, 3, 6], [1, 4, 7], [2, 5, 8],
                              [2, 4, 6], [0, 4, 8] ]
  end  

  def valid?
    return false if @board.count("X") - @board.count("0") > 1 || @board.count("0") - @board.count("X") > 1
    true
  end 

  def empty?
    @board.count("X") + @board.count("0") == 0
  end    

  def won?
    current_player_indexes = @board.each_index.select { |i| @board[i] == current_player }
    @winning_combinations.each do |combo|
      return true if (combo - current_player_indexes).size == 0
    end
    false
  end  

  def next_move
    next_player_indexes = @board.each_index.select { |i| @board[i] == next_player }
    blank_indexes = @board.each_index.select { |i| @board[i] == " "}
    @winning_combinations.each do |combo|
      return (combo - next_player_indexes).join.to_i if (combo - next_player_indexes).size == 1 && (combo - blank_indexes).count == 2
    end
  end

  def current_player
    @board.count("X") > @board.count("0") ? CROSS : NOUGHT
  end

  def next_player
    @board.count("X") == @board.count("0") ? CROSS : NOUGHT
  end   
end