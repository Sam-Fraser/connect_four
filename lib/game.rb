#lib/game.rb
require_relative 'board'
require_relative 'human'
require_relative 'comp'

#game class for playing the game
class Game
  attr_reader :player1, :player2, :current_player
  attr_accessor :game_board
  #initialize with 2 players and gameboard
  def initialize
    @game_board = Board.new
    @current_player = nil
  end

  #starts game
  def play
    @player1 = choose_player_type(1, "R")
    @player1.name = "Player 1"
    @player2 = choose_player_type(2, "B")
    @player2.name = "Player 2"
    puts @game_board.display_board
    @current_player = @player1
    loop do
      column = @current_player.get_move
      token = @current_player.token
      @game_board.add_piece(column, token)
      puts @game_board.display_board
      if win?(column, token)
        puts "#{@current_player.name} is the winner"
        break
      elsif draw?
        puts "That's a draw"
        break
      end
      switch_players
    end
    @current_player
  end

  #lets you choose if player is human or computer
  def choose_player_type(num, token)
    loop do
      print "Is player #{num} a human or computer? Enter 1 for human and 2 for computer: "
      player = gets.chomp.to_i
      case player
      when 1
        return Human.new(token, @game_board)
      when 2
        return Comp.new(token, @game_board)
      else
        next
      end
    end
  end

  #switches players
  def switch_players
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  #checks if piece creates a winning column
  def winning_column?(column, token)
    column -= 1
    row = -1
    column_pieces = []
    @game_board.board.each do |a|
      row += 1
      column_pieces.push(a[column]) unless a[column] == ' '
    end
    return true if column_pieces.length >= 4 && column_pieces[0..3].all? { |t| t == token }
    false
  end

  #checks if piece creates a winning row
  def winning_row?(column, token)
    row = @game_board.get_row(column)
    if (@game_board.board[row][0..3].all?(token) || 
        @game_board.board[row][1..4].all?(token) || 
        @game_board.board[row][2..5].all?(token) || 
        @game_board.board[row][3..6].all?(token))
      return true
    else
      return false
    end
  end

  #checks if piece creates a winning diagonal up and to the left or down and to the right
  def winning_left_diagonal?(column, token)
    row = @game_board.get_row(column)
    column -= 1
    left_diagonal_pieces = []
    @game_board.board.each_with_index do |a, i|
      row - column > i ? next : left_diagonal_pieces.push(a[i - (row - column)])
    end
    case left_diagonal_pieces.length
    when 4
      return left_diagonal_pieces.all?(token)
    when 5
      return left_diagonal_pieces[0..3].all?(token) || left_diagonal_pieces[1..4].all?(token)
    when 6
      return left_diagonal_pieces[0..3].all?(token) || left_diagonal_pieces[1..4].all?(token) || left_diagonal_pieces[2..5].all?(token)
    else
      return false
    end
  end

  #checks if piece creates a winning diagonal up and to the right or down and to the left
  def winning_right_diagonal?(column, token)
    row = @game_board.get_row(column)
    column -= 1
    right_diagonal_pieces = []
    @game_board.board.each_with_index do |a, i|
      row + column > i + 6 ? next : right_diagonal_pieces.push(a[(row + column) - i])
    end
    case right_diagonal_pieces.length
    when 4
      return right_diagonal_pieces.all?(token)
    when 5
      return right_diagonal_pieces[0..3].all?(token) || right_diagonal_pieces[1..4].all?(token)
    when 6
      return right_diagonal_pieces[0..3].all?(token) || right_diagonal_pieces[1..4].all?(token) || right_diagonal_pieces[2..5].all?(token)
    else
      return false
    end
  end

  #checks if the last move was a win
  def win?(column, token)
    if (winning_column?(column, token) ||
        winning_row?(column, token) ||
        winning_left_diagonal?(column, token) ||
        winning_right_diagonal?(column, token))
      return true
    else
      return false
    end
  end

  #checks if last move resulted in a draw
  def draw?
    @game_board.board_full?
  end
end