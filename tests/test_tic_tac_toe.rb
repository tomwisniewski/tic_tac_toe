require 'minitest/autorun'
require '../lib/tic_tac_toe'
 
class TicTacToeTest < Minitest::Test
 
  # the board is represented as a string of rows, e.g.
  # X |   | X
  # ---------
  # 0 | 0 | X
  # ---------
  #   |   | 0
  #
  # is represented as "X X00X  0"
  #
  # A blank board is represented as an array with 9 spaces
  #
  # The board is valid if the difference between the number of Xs and 0s is 1 or less
  #
  # The first move is always a cross, so if, for example, a board is initialised with two crosses
  # and two noughts, you know the next move is a cross.
 
  def test_a_board_with_fewer_or_more_than_9_values_cannot_be_created
    assert_raises(RuntimeError) do
      TicTacToe.new("")   
    end
  end
 
  def test_a_board_with_two_Xs_and_one_0_is_valid?
    game = TicTacToe.new("X X   0  ")
    assert game.valid?
  end
 
  def test_a_board_with_three_0_and_one_X_is_invalid?
    game = TicTacToe.new(" 0 0 0X  ")
    refute game.valid?
  end
 
  def test_the_board_with_nine_blank_spaces_is_valid
    game = TicTacToe.new('         ')
    assert game.valid?
    assert game.empty?
  end
 
  def test_the_game_with_a_horizontal_line_is_finished
    game = TicTacToe.new("XXX 0 0  ")
    assert game.valid?
    assert game.won?
  end
 
  def test_the_game_with_a_vertical_line_is_finished
    game = TicTacToe.new('X 0X 0X  ')
    assert game.valid?
    assert game.won?
  end
 
  def test_the_game_with_a_diagonal_line_is_finished
    game = TicTacToe.new("X  0X0  X")
    assert game.valid?
    assert game.won?
  end
 
  def test_the_game_with_a_diagonal_line_is_finished
    game = TicTacToe.new("X 0 0 0XX")
    assert game.valid?
    assert game.won?
  end
 
  def test_the_game_without_a_winner_is_not_finished
    game = TicTacToe.new("XX00XXX00")
    assert game.valid?
    assert !game.won?
  end
 
  def test_the_game_that_is_one_step_from_winning_can_calculate_the_best_move
    game = TicTacToe.new("X 0X0    ")    
    assert_equal 6, game.next_move              # 6 is the index in the grid, 0 to 8
  end
 
  def test_the_game_knows_the_next_player
    game = TicTacToe.new("X0 X  0  ")
    assert_equal TicTacToe::CROSS, game.next_player # X is the first because we assume X started the game    
  end
end