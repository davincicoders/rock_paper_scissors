require 'spec_helper'

describe LukePlayer do
  it 'should be a Lukeplayer' do
    expect(subject).to be_a(LukePlayer)
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