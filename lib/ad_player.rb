class AdPlayer

  def initialize
    @win_count = 0
    @lost_count = 0
    @tied_count = 0
    @throws = []
    @valid_gambits = []
  end

  def play
    gambit
  end

  def load_gambits
    [
        ['rock', 'rock', 'rock'], #avalanche
        ['paper', 'paper', 'paper'], #bureaucrat
        ['paper', 'scissors', 'rock'], #the crescendo
        ['rock', 'scissors', 'paper'], #the denouement
        ['rock', 'paper', 'paper'], #fistful o'dollars
        ['paper', 'scissors', 'scissors'], #paper dolls
        ['paper', 'scissors', 'paper'], #scissor sandwich
        ['scissors', 'scissors', 'scissors'] #the toolbox
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
      @valid_gambits = self.load_gambits.shuffle
    end
    @valid_gambits
  end

  def won
    @win_count += 1
  end

  def lost
    @lost_count += 1

  end

  def tied
    @tied_count += 1
  end

  def win_count
    @win_count
  end

  def lost_count
    @lost_count
  end

  def tied_count
    @tied_count
  end

  #def throws
  #  @throws
  #end

end