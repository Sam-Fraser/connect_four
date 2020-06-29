#lib/human.rb
require_relative 'player'

#human subclass of player class
class Human < Player
  #method to get move from player
  def get_move
    column = ''
    loop do
      print "Select a column between 1 and 7 to place your token: "
      column = gets.chomp.to_i
      break unless column < 1 || column > 7 || board.column_full?(column)
    end
    column
  end
end