class JohnPlayer
  attr_accessor :my_moves, :their_moves
  # def my_moves
  #   @my_moves
  # end
  #
  # def my_moves=(move)
  #   @my_moves = move
  # end

  def initialize
    self.my_moves = []
    self.their_moves = ["rock", "paper", "scissors"]
  end

  def play
    their_most_frequent_move = their_moves.uniq.map{|play| [play, their_moves.count(play)]}.sort_by{|a| a.last}.last.first
    self.my_moves.push(calculate_their_move("lost", their_most_frequent_move))
    my_moves.last
  end

  def won
    self.their_moves.push(calculate_their_move("won"))
  end

  def lost
    self.their_moves.push(calculate_their_move("lost"))
  end

  def tied
    self.their_moves.push(calculate_their_move("tied"))
  end

  def calculate_their_move(outcome, our_move = self.my_moves.last)

    case [outcome, our_move]
      when ["won", "rock"]
        "scissors"
      when ["won", "paper"]
        "rock"
      when ["won", "scissors"]
        "paper"
      when ["lost", "rock"]
        "paper"
      when ["lost", "paper"]
        "scissors"
      when ["lost", "scissors"]
        "rock"
      when ["tied", "rock"]
        "rock"
      when ["tied", "paper"]
        "paper"
      when ["tied", "scissors"]
        "scissors"
    end
  end
end
