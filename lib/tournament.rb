#require 'spec_helper'
class Tournament
  attr_accessor :players, :rounds

  def initialize
    self.players = []
    self.rounds = []
  end

  def load_players
    Dir.glob('./lib/*player.rb').each do |player|
      require player
    end
    Module.constants.select{|c| c =~ /player/i}.each do |player|
      self.players << Module.const_get(player).send(:new)
    end
  end

  def load_rounds
    if players.empty?
      load_players
    end

    players.shuffle.each_slice(2) do |player_one, player_two|
      @rounds << ::Round.new(player_one, player_two)
    end
  end

  def rounds
    @rounds.map{|round| [ round.player_one, round.player_two ]}
  end

  def play
    load_rounds
    @winner = nil
    rounds_played = 0
    while(round = @rounds.shift)
      rounds_played += 1
      exit if rounds_played > 100
      # Play the round and determine winner and loser
      print "round #{rounds_played}: #{round.player_one} versus #{round.player_two}... "
      (winner, loser) = round.play
      puts "#{winner} wins!"
      if !@winner.nil?
        @rounds.push(Round.new(@winner, winner))
        @winner = nil
      else
        @winner = winner
      end
    end
    @winner
  end
end