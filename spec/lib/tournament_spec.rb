require 'spec_helper'

describe Tournament do
  let(:rock_player) { RockPlayer.new }
  let(:paper_player) { PaperPlayer.new }
  let(:scissors_player) { ScissorsPlayer.new }
  it 'should be a tournament' do
    expect(subject).to be_a(Tournament)
  end

  describe ".load_players" do
    it "loads the list of players" do
      expect{ subject.load_players }.to change(subject.players, :count).from(0).to(3)
    end
  end

  describe ".load_rounds" do
    let(:players) { double('Players', :shuffle => [rock_player, paper_player, scissors_player], :empty? => false) }
    it "loads the rounds randomly" do
      subject.stub(:players).and_return(players)
      subject.load_rounds
      rounds_text = subject.rounds.map { |r| r.to_s.gsub(/\s+/, ' ') }
      expect(rounds_text).to include("Round #0: RockPlayer vs. PaperPlayer...")
      expect(rounds_text).to include("Round #1: ScissorsPlayer vs. NoOne...")
    end
  end

  describe ".play" do
    let(:players) { double('Players', :shuffle => [rock_player, paper_player, scissors_player], :empty? => false) }
    it "determines a winner" do
      subject.stub(:players).and_return(players)
      expect(subject.play).to eq(scissors_player)
    end
  end
end