#spec/board_spec.rb

require './lib/board'

describe Board do
  describe "#initialize" do
    it "will create a 6 by 7 gameboard" do
      game_board = Board.new
      expect(game_board.board.flatten.length).to eql(6 * 7)
    end
  end

  describe "#display_board" do
    it "will display the game board to the console" do
      game_board = Board.new
      expected_board = <<-GAMEBOARD
1 2 3 4 5 6 7
 | | | | | | 
 | | | | | | 
 | | | | | | 
 | | | | | | 
 | | | | | | 
 | | | | | | 
      GAMEBOARD
      actual_board = game_board.display_board
      expect(actual_board).to eql(expected_board)
    end
  end

  describe "#addpiece" do
    it "will add a piece to the board in specific column" do
      game_board = Board.new
      game_board.add_piece(1, "R")
      expect(game_board.board[5][0]).to eql("R")
    end

    it "will only add piece to lowest row of specific column" do
      game_board = Board.new
      game_board.add_piece(1, "R")
      expect(game_board.board[5][0]).to eql("R")
      expect(game_board.board[4][0]).to_not eql("R")
    end
  end
end