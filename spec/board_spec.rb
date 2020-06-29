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

  describe "#column_full?" do
    it "will return true if a column is full" do
      game_board = Board.new
      6.times { game_board.add_piece(1, "R") }
      expect(game_board.column_full?(1)).to eql(true)
    end
  end

  describe "#get_row" do
    it "will return the row of the top piece in a column" do
      game_board = Board.new
      4.times { game_board.add_piece(1, "R") }
      expect(game_board.get_row(1)).to eql(2)
    end
  end

  describe "#board_full?" do
    it "will return true if the board is full" do
      game_board = Board.new
      7.times do |column|
        6.times { game_board.add_piece(column, "R") }
      end
      expect(game_board.board_full?).to be true
    end

    it "will return false if the board is not full" do
      game_board = Board.new
      expect(game_board.board_full?).to be false
    end
  end
end