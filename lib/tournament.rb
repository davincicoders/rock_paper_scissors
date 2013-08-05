require 'round'
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

    players.shuffle.each_slice(2).with_index do |(player_one, player_two), round_number|
      self.rounds << Round.new(round_number, player_one, player_two)
    end
  end

  def play(interactive=false)
    load_rounds
    @previous_winner = nil
    rounds_played = 0
    while(round = @rounds.shift)
      rounds_played += 1

      # We should not have more than 100 rounds
      exit if rounds_played > 100

      # Play the round and determine winner and loser
      (winner, loser) = round.play(interactive)

      if @previous_winner.nil?
        @previous_winner = winner
      else
        next_round_number = [@rounds.map(&:round_number).max || 0, round.round_number].max + 1
        @rounds.push(Round.new(next_round_number, @previous_winner, winner))
        @previous_winner = nil
      end
    end
    @previous_winner
  end
end
