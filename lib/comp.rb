#lib/comp.rb
require_relative 'player'

#computer subclass of player class
class Comp < Player
  #method to get move from player
  def get_move
    column = ''
    loop do
      column = rand(1..7)
      break unless board.column_full?(column)
    end
    column
  end
end