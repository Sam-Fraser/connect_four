#spec/game_spec.rb
require './lib/game'

describe Game do
  describe "#choose_player_type" do
    it "will ask if the player is a computer or human" do
      game = Game.new
      expect { game.choose_player_type(1, "R") }.to output("Is player 1 a human or computer? Enter 1 for human and 2 for computer: ").to_stdout
    end

    it "will return true if user inputs anything into the console" do
      game = Game.new
      expect(game.choose_player_type(1, "R")).to_not be_nil
    end

    it "will return true if user inputs 1 into the console" do
      game = Game.new
      human = game.choose_player_type(1, "R").instance_of?(Human)
      expect(human).to be true
    end

    it "will return true if user inputs 2 into the console" do
      game = Game.new
      comp = game.choose_player_type(1, "R").instance_of?(Comp)
      expect(comp).to be true
    end
  end

  describe "#winning_column?" do
    it "will check if last move was a winning move in the column" do
      game = Game.new
      game.game_board.add_piece(1, "B")
      4.times { game.game_board.add_piece(1, "R") }
      expect(game.winning_column?(1, "R")).to be true
    end
  end

  describe "#winning_row?" do
    it "will check if last move was a winning move in the row" do
      game = Game.new
      game.game_board.add_piece(1, "B")
      game.game_board.add_piece(2, "R")
      game.game_board.add_piece(3, "B")
      game.game_board.add_piece(4, "B")
      game.game_board.add_piece(5, "B")
      game.game_board.add_piece(6, "B")
      expect(game.winning_row?(5, "B")).to be true
    end
  end

  describe "#winning_left_diagonal?" do
    it "will check if last move was a winning move in the left diagonal" do
      game = Game.new
      4.times { game.game_board.add_piece(1, "B") }
      3.times { game.game_board.add_piece(2, "B") }
      2.times { game.game_board.add_piece(3, "B") }
      game.game_board.add_piece(4, "B")
      expect(game.winning_left_diagonal?(4, "B")).to be true
    end
  end

  describe "#winning_right_diagonal?" do
    it "will check if last move was a winning move in the right diagonal" do
      game = Game.new
      4.times { game.game_board.add_piece(4, "B") }
      3.times { game.game_board.add_piece(3, "B") }
      2.times { game.game_board.add_piece(2, "B") }
      game.game_board.add_piece(1, "B")
      expect(game.winning_right_diagonal?(4, "B")).to be true
    end
  end

  describe "#win?" do
    it "will check if last move was a winning move in the column" do
      game = Game.new
      game.game_board.add_piece(1, "B")
      4.times { game.game_board.add_piece(1, "R") }
      expect(game.winning_column?(1, "R")).to be true
    end

    it "will check if last move was a winning move in the row" do
      game = Game.new
      game.game_board.add_piece(1, "B")
      game.game_board.add_piece(2, "R")
      game.game_board.add_piece(3, "B")
      game.game_board.add_piece(4, "B")
      game.game_board.add_piece(5, "B")
      game.game_board.add_piece(6, "B")
      expect(game.winning_row?(5, "B")).to be true
    end

    it "will check if last move was a winning move in the left diagonal" do
      game = Game.new
      4.times { game.game_board.add_piece(1, "B") }
      3.times { game.game_board.add_piece(2, "B") }
      2.times { game.game_board.add_piece(3, "B") }
      game.game_board.add_piece(4, "B")
      expect(game.winning_left_diagonal?(4, "B")).to be true
    end

    it "will check if last move was a winning move in the right diagonal" do
      game = Game.new
      4.times { game.game_board.add_piece(4, "B") }
      3.times { game.game_board.add_piece(3, "B") }
      2.times { game.game_board.add_piece(2, "B") }
      game.game_board.add_piece(1, "B")
      expect(game.winning_right_diagonal?(4, "B")).to be true
    end
  end

  describe "#play" do
    it "will create 2 new players" do
      game = Game.new
      game.play
      player1 = game.player1.is_a?(Player)
      player2 = game.player2.is_a?(Player)
      expect(player1 && player2).to be true
    end

    it "will play the game" do
      game = Game.new
      expect(game.play).to eql(game.current_player)
    end
  end

  describe "#switch_players" do
    it "will switch current player from player 1 to player 2" do
      game = Game.new
      game.switch_players
      expect(game.current_player).to eql(game.player2)
    end

    it "will switch current player from player 1 to player 2 and back" do
      game = Game.new
      2.times { game.switch_players }
      expect(game.current_player).to eql(game.player1)
    end
  end
end