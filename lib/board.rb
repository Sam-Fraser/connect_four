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
    column -= 1
    empty_row = -1
    @board.each_with_index do |a, i|
      empty_row += 1 if a[column] == ' '
    end
    @board[empty_row][column] = token
  end

end