class LukePlayer

  attr_accessor :win_count, :lost_count, :tied_count

  def initialize
    self.win_count = 0
    self.lost_count = 0
    self.tied_count = 0
    @possible_plays = ['rock', 'paper', 'scissors']
    @play = @possible_plays[rand(2)]
  end

  def play
    @play
  end

  def won
    self.win_count += 1
    @play
  end

  def lost
    self.lost_count += 1
    if @possible_plays.index(@play) == 0
      @play = [@possible_plays.index(@play) + rand(3)]
    elsif @possible_plays.index(@play) == 1
      @play = [@possible_plays.index(@play) + rand(2)]
    elsif @possible_plays.index(@play) == 2
      @play = [@possible_plays.index(@play) - rand(3)]
    end
  end

  def tied
    self.tied_count += 1
    @play = @possible_plays.shuffle[0]
  end
end