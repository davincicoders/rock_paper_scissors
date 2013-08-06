require 'spec_helper'

describe AdPlayer do
  subject = AdPlayer.new
  it 'should be a ADplayer' do
    expect(subject).to be_a(AdPlayer)
  end

  describe "play" do
    let(:valid_gambits2) {
      [
          %w(a b c),
          %w(d e f),
          %w(g h i),
          %w(j k l),
          %w(m n o),
          %w(p q r),
          %w(s t u)
      ]
    }
    it "plays things in order" do
      my_plays = []
      8.times do
        my_plays << [subject.play, subject.play, subject.play]
      end
      expect(my_plays).to include(['rock', 'rock', 'rock'])
      expect(my_plays).to include(['paper', 'paper', 'paper'])
      expect(my_plays).to include(['paper', 'scissors', 'rock'])
      expect(my_plays).to include(['rock', 'scissors', 'paper'])
      expect(my_plays).to include(['rock', 'paper', 'paper'])
      expect(my_plays).to include(['paper', 'scissors', 'scissors'])
      expect(my_plays).to include(['paper', 'scissors', 'paper'])
      expect(my_plays).to include(['scissors', 'scissors', 'scissors'])
    end
  end

  describe '.won' do

    it "increases 'win_count' by 1" do
      expect { subject.won }.to change(subject, :win_count).from(0).to(1)
    end

    it "increases 'win_count' by 1 on second win" do
      expect { subject.won }.to change(subject, :win_count).from(1).to(2)
    end

  end


  describe '.lost' do

    it "increases 'lost_count' by 1" do
      expect { subject.lost }.to change(subject, :lost_count).from(0).to(1)
    end

    it "increases 'lost_count' by 1 on second loss" do
      expect { subject.lost }.to change(subject, :lost_count).from(1).to(2)
    end
  end

  describe '.tied' do

    it "increases 'tied_count' by 1" do
      expect { subject.tied }.to change(subject, :tied_count).from(0).to(1)
    end

    it "increases 'tied_count' by 1 on second tie" do
      expect { subject.tied }.to change(subject, :tied_count).from(1).to(2)
    end
  end


end
