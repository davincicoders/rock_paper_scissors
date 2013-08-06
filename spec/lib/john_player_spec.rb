require 'spec_helper'

describe JohnPlayer do
  # subject = JohnPlayer.new
  it "should be a JohnPlayer" do
    expect(subject).to be_a(JohnPlayer)
  end

  describe ".play" do
    it "returns paper, rock, or scissors randomly for the first move" do
      expect(%Q[rock paper scissors]).to include(subject.play)
    end

    it "returns the most likely winner" do
      subject.play
      subject.won
      puts subject.my_moves.inspect
      puts subject.their_moves.inspect
      expect(subject.play).to eq(subject.calculate_their_move("won"))
    end

    it "returns 'rock' the first 100 times it's called" do
      100.times do
        expect(subject.play).to eq('rock')
      end
    end

    it "keeps track of what the JohnPlayer has played" do
      expect{ 100.times{ subject.play } }.to change(subject.my_moves, :length).from(0).to(100)
    end
  end

  describe ".my_moves" do
    it "is empty by default" do
      expect(subject.my_moves).to eq([])
    end
  end

  describe ".their_moves" do
    it "is empty by default" do
      expect(subject.their_moves).to eq([])
    end
  end

  describe ".won" do
    it "populates their moves base on our move" do
      subject.play
      expected_their_play = subject.calculate_their_play("won")

      expect{ subject.won }.to change(subject.their_moves, :last).to(expected_their_play)
    end
  end

  describe ".lost" do
    it "populates their moves" do
      subject.play
      expect{ subject.lost }.to change(subject.their_moves, :last).to("paper")
    end
  end

  describe ".tied" do
    it "populates their moves" do
      subject.play
      expect{ subject.tied }.to change(subject.their_moves, :last).to("rock")
    end
  end

  describe "#calculate_their_play(won_lost_tied)" do
    let(:last_played_rock) { ["rock"] }
    let(:last_played_paper) { ["paper"] }
    let(:last_played_scissors) { ["scissors"] }

    context "when we won" do
      let(:outcome) { "won" }

      it "returns scissors if we played rock" do
        subject.stub(:my_moves).and_return(last_played_rock)
        expect(subject.calculate_their_play(outcome)).to eq("scissors")
      end

      it "returns paper if we played scissors" do
        subject.stub(:my_moves).and_return(last_played_scissors)
        expect(subject.calculate_their_play(outcome)).to eq("paper")
      end

      it "returns rock if we played paper" do
        subject.stub(:my_moves).and_return(last_played_paper)
        expect(subject.calculate_their_play(outcome)).to eq("rock")
      end
    end

    context "when we lost" do
      let(:outcome) { "lost" }

      it "returns paper if we played rock" do
        subject.stub(:my_moves).and_return(last_played_rock)
        expect(subject.calculate_their_play(outcome)).to eq("paper")
      end

      it "returns rock if we played scissors" do
        subject.stub(:my_moves).and_return(last_played_scissors)
        expect(subject.calculate_their_play(outcome)).to eq("rock")
      end

      it "returns scissors if we played paper" do
        subject.stub(:my_moves).and_return(last_played_paper)
        expect(subject.calculate_their_play(outcome)).to eq("scissors")
      end
    end

    context "when we tied" do
      let(:outcome) { "tied" }

      it "returns scissors if we played scissors" do
        subject.stub(:my_moves).and_return(last_played_scissors)
        expect(subject.calculate_their_play(outcome)).to eq("scissors")
      end

      it "returns paper if we played paper" do
        subject.stub(:my_moves).and_return(last_played_paper)
        expect(subject.calculate_their_play(outcome)).to eq("paper")
      end

      it "returns rock if we played rock" do
        subject.stub(:my_moves).and_return(last_played_rock)
        expect(subject.calculate_their_play(outcome)).to eq("rock")
      end
    end
  end
end
