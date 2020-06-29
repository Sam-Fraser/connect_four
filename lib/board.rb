#lib/board.rb

#class for the gameboard and all methods for interacting with the board
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6).map { |x| Array.new(7, " ") }
  end

  #displays board with column headers and pieces
  def display_board
    display = "1 2 3 4 5 6 7\n"
    @board.each_with_index do |a, i|
      line = ""
      a.each_with_index do |b, j|
        line += "#{board[i][j]}|"
      end
      display += "#{line[0...-1]}\n"
    end
    display
  end

  #adds a specific piece to a specific column
  def add_piece(column, token)
    empty_row = get_row(column) - 1
    @board[empty_row][column - 1] = token
  end

  #checks if a column is full
  def column_full?(column)
    column -= 1
    @board.none? { |a| a[column] == ' '}
  end

  #gets row of top piece in column
  def get_row(column)
    column -= 1
    row = 0
    @board.each do |a|
      row += 1 if a[column] == " "
    end
    row
  end

  #returns true if board is full
  def board_full?
    full_columns = 0
    7.times do |column|
      full_columns += 1 if column_full?(column)
    end
    full_columns == 7 ? true : false
  end
end