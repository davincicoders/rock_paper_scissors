require 'spec_helper'

describe DBPlayer do
  it 'should be a DBPlayer' do
    expect(subject).to be_a(DBPlayer)
  end

  describe "play" do

    it "plays things in order" do
      my_plays = []
      8.times do
        my_plays << (1..7).map{ subject.play }
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
      expect{2.times {subject.won}}.to change(subject, :win_count).from(0).to(2)
    end
  end


  describe '.lost' do

    it "increases 'lost_count' by 1" do
      expect{subject.lost}.to change(subject, :lost_count).from(0).to(1)
    end

    it "increases 'lost_count' by 1 on second loss" do
      expect{2.times {subject.lost}}.to change(subject, :lost_count).from(0).to(2)
    end
  end

  describe '.tied' do

    it "increases 'tied_count' by 1" do
      expect{subject.tied}.to change(subject, :tied_count).from(0).to(1)
    end

    it "increases 'tied_count' by 1 on second tie" do
      expect{2.times {subject.tied}}.to change(subject, :tied_count).from(0).to(2)
    end
  end

end

