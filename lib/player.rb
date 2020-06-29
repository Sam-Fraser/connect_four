#lib/player.rb

#base class for players
class Player
  attr_accessor :token, :board, :name

  def initialize(token, board)
    @token = token
    @board = board
    @name = 'Player'
  end
end