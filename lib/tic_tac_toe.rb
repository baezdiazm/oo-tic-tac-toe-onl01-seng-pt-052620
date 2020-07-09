class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  attr_reader :board

  def initialize
    @board = []
    i = 0
    while i < 9
      @board[i] = " "
      i += 1
    end
    @board = Array.new(9," ")
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
    puts ("-----------")
    puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
    puts ("-----------")
    puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index, token)
    board[index] = token
  end

  def position_taken?(index)
    board[index] == "X" || board[index] == "O"
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    board.count { |space| space == "X" || space == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    # ask for input
    puts "Please make a move by entering a number between 1-9"
    # get input
    input = gets.strip
    # translate input into index
    index = input_to_index(input)
    # if index is valid
    #   make the move for index
    #   show the board
    # else
    #   ask for input again
    # end
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
    # index = -1
    # until valid_move?(index)
    #   puts "Please make a move by entering a number between 1-9"
    #   input = gets.strip
    #   index = input_to_index(input)
    #   if valid_move?(index)
    #     move(index, current_player)
    #     display_board
    #   else
    #     puts "whoops!"
    #   end
    # end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return win_combo
      else
        false
      end

    end
  end

  def full?
    if (@board.any? {|space| space != " "}) true : false

  end
end
