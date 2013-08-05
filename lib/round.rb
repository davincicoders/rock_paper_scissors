class Round
  attr_accessor :player_one, :player_two, :round_number

  def initialize(round_number, player_one=nil, player_two=nil)
    self.round_number = round_number
    self.player_one   = player_one
    self.player_two   = player_two
  end

  def play(interactive=false)
    if interactive
      player_one_name = sprintf("%25s", player_one.nil? ? 'NoOne' : player_one.class.name)
      player_two_name = sprintf("%25s", player_two.nil? ? 'NoOne' : player_two.class.name)

      print "Round ##{round_number}: #{player_one_name} vs. #{player_two_name}... WINNER: "
    end

    if player_one.nil?
      puts player_two_name if interactive
      [player_two, player_one]
    elsif player_two.nil?
      puts player_one_name if interactive
      [player_one, player_two]
    else
      winners = (1..100).map do
        determine_winner
      end
      results = Hash.new
      results[player_one] = 0
      results[player_two] = 0
      results = winners.inject(results) { |h, v| h[v] += 1; h }
      if results[player_one] == results[player_two]
        # If it's a 50/50 tie, we decided to make player #1 the winner
        puts player_one if interactive
        [player_one, player_two]
      else
        sorted_results = results.sort_by { |player, wins| wins }.reverse.map(&:first)
        if interactive
          if sorted_results.first == player_one
            puts player_one_name
          else
            puts player_two_name
          end
        end
        sorted_results
      end
    end
  end

  def inspect
    to_s
  end

  def to_s
    player_one_name = sprintf("%25s", player_one.nil? ? 'NoOne' : player_one.class.name)
    player_two_name = sprintf("%25s", player_two.nil? ? 'NoOne' : player_two.class.name)

    "Round ##{round_number}: #{player_one_name} vs. #{player_two_name}..."
  end

  private
  def determine_winner
    result = [player_one.play.downcase, player_two.play.downcase]
    case result
      when ['rock', 'paper']
        player_one.lost
        player_two.won
        player_two
      when ['paper', 'rock']
        player_one.won
        player_two.lost
        player_one
      when ['paper', 'scissors']
        player_one.lost
        player_two.won
        player_two
      when ['scissors', 'paper']
        player_one.won
        player_two.lost
        player_one
      when ['rock', 'scissors']
        player_one.won
        player_two.lost
        player_one
      when ['scissors', 'rock']
        player_one.lost
        player_two.won
        player_two
      when ['scissors', 'scissors']
        player_one.tied
        player_two.tied
        player_one
      when ['rock', 'rock']
        player_one.tied
        player_two.tied
        player_one
      when ['paper', 'paper']
        player_one.tied
        player_two.tied
        player_one
      else
        if valid_result?(result.first)
          # Player one gave a valid result
          player_one.won
          player_two.lost
          player_one
        elsif valid_result?(result.last)
          # Player two gave a valid result
          player_one.lost
          player_two.won
          player_two
        end
    end
  end

  def valid_result?(result)
    ['rock', 'paper', 'scissors'].include?(result)
  end
end