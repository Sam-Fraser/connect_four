#spec/human_spec.rb
require './lib/board'
require './lib/human'

describe Human do
  describe '#get_move' do
    it "will ask for a move from the player" do
      board = Board.new
      player = Human.new("R", board)
      expect{ player.get_move }.to output("Select a column between 1 and 7 to place your token: ").to_stdout
    end

    it "will return true if user inputs anything to console" do
      board = Board.new
      player = Human.new("R", board)
      expect(player.get_move).to_not be_nil
    end

    it "will return a number between 1 and 7" do
      board = Board.new
      player = Human.new("R", board)
      expect(player.get_move).to be_between(1, 7)
    end

    it "will not return a column number if the column is full" do
      board = Board.new
      player = Human.new("R", board)
      6.times { board.add_piece(1, "B") }
      expect(player.get_move).to_not eql(1)
    end
  end
end