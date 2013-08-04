require 'spec_helper'
require 'DB_player'

describe DBPlayer do
  subject = DBPlayer.new
  it 'should be a DBplayer' do
    expect(subject).to be_a(DBPlayer)
  end

  describe "play" do
    let(:valid_gambits2) {
      [
          %w(a b c d e f h),
          %w(i j k l m n o),
          %w(p q r s t u v),
          %w(w x y z a1 b1 c1),
          %w(d1 e1 f1 h1 i1 j1 k1),
          %w(l1 m1 n1 o1 p1 q1 r1),
          %w(s1 t1 u1 v1 w1 x1 y1)
      ]
    }
    it "plays things in order" do
      my_plays = []
      8.times do
        my_plays << [subject.play, subject.play, subject.play, subject.play,
                     subject.play, subject.play, subject.play]
      end

      expect(my_plays).to include(['rock', 'rock', 'rock', 'scissors',
                                   'paper', 'scissors', 'scissors'] )
      expect(my_plays).to include(['paper', 'paper', 'paper', 'scissors',
                                   'scissors', 'scissors', 'scissors'] )
      expect(my_plays).to include(['paper', 'scissors', 'rock', 'paper',
                                   'paper', 'scissors', 'scissors'] )
      expect(my_plays).to include(['rock', 'scissors', 'paper', 'paper',
                                   'scissors', 'paper', 'paper'] )
      expect(my_plays).to include(['rock', 'paper', 'paper', 'scissors',
                                   'scissors', 'scissors', 'rock'] )
      expect(my_plays).to include(['paper','scissors','scissors', 'scissors',
                                   'scissors', 'rock', 'paper'] )
      expect(my_plays).to include(['paper', 'scissors', 'paper', 'scissors',
                                   'rock', 'scissors', 'rock'] )
      expect(my_plays).to include(['scissors', 'scissors', 'scissors',
                                   'paper','paper', 'paper', 'rock'] )
    end
  end


  describe '.won' do

    it "increases 'win_count' by 1" do
      expect{subject.won}.to change(subject, :win_count).from(0).to(1)
    end

    it "increases 'win_count' by 1 on second win" do
      expect{subject.won}.to change(subject, :win_count).from(1).to(2)
    end

  end


  describe '.lost' do

    it "increases 'lost_count' by 1" do
      expect{subject.lost}.to change(subject, :lost_count).from(0).to(1)
    end

    it "increases 'lost_count' by 1 on second loss" do
      expect{subject.lost}.to change(subject, :lost_count).from(1).to(2)
    end
  end

  describe '.tied' do

    it "increases 'tied_count' by 1" do
      expect{subject.tied}.to change(subject, :tied_count).from(0).to(1)
    end

    it "increases 'tied_count' by 1 on second tie" do
      expect{subject.tied}.to change(subject, :tied_count).from(1).to(2)
    end
  end


end

