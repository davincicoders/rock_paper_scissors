class DBPlayer

  attr_accessor :win_count, :lost_count, :tied_count

  def initialize
    self.win_count = 0
    self.lost_count = 0
    self.tied_count = 0
    @valid_gambits = []
  end

  def play
    gambit
  end

  def load_gambits
    [
      # keep old gambits for reference
      #['rock', 'rock', 'rock'], #avalanche
      #['paper', 'paper', 'paper'], #bureaucrat
      #['paper', 'scissors', 'rock'], #the crescendo
      #['rock', 'scissors', 'paper'], #the denouement
      #['rock', 'paper', 'paper'], #fistful of dollars
      #['paper','scissors','scissors'], #paper dolls
      #['paper', 'scissors', 'paper'], #scissor sandwich
      #['scissors', 'scissors', 'scissors'] #the toolbox

      %w(rock rock rock scissors paper scissors scissors),
      %w(paper paper paper scissors scissors scissors scissors),
      %w(paper scissors rock paper paper scissors scissors),
      %w(rock scissors paper paper scissors paper paper),
      %w(rock paper paper scissors scissors scissors rock),
      %w(paper scissors scissors scissors scissors rock paper),
      %w(paper scissors paper scissors rock scissors rock),
      %w(scissors scissors scissors paper paper paper rock)
    ]
  end

  def gambit
    gambit_result = valid_gambits.shift
    current_play = gambit_result.shift
    @valid_gambits.unshift(gambit_result) unless gambit_result.empty?
    current_play
  end

  def valid_gambits
    if @valid_gambits.empty?
      @valid_gambits = load_gambits.shuffle
    end
    @valid_gambits
  end

  def won
    self.win_count += 1
  end

  def lost
    self.lost_count += 1
  end

  def tied
   self.tied_count += 1
  end

end
