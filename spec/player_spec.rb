#spec/player_spec.rb
require './lib/player'
require './lib/board'

describe Player do
  describe "#initialize" do
    it "will create a new player instance with a specific token" do
      board = Board.new
      player = Player.new('R', board)
      expect(player.token).to eql('R')
    end

    it "will create a new player instance tied to a specific game board" do
      board = Board.new
      player = Player.new('R', board)
      expect(player.board).to eql(board)
    end
  end
end
