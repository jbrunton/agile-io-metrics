require 'rails_helper'

RSpec.describe Mood, type: :model do
  describe ".GOOD, .MEH, .BAD" do
    it "defines constants for each mood" do
      expect(Mood.GOOD.weight).to eq(1.0)
      expect(Mood.MEH.weight).to eq(0.5)
      expect(Mood.BAD.weight).to eq(0.0)
    end
  end

  describe "#classify" do
    it "classifies ratings > 0.66 as good" do
      expect(Mood.classify(1.0)).to eq(Mood.GOOD)
      expect(Mood.classify(0.67)).to eq(Mood.GOOD)
    end

    it "classifies ratings <= 0.33 as bad" do
      expect(Mood.classify(0.33)).to eq(Mood.BAD)
      expect(Mood.classify(0.0)).to eq(Mood.BAD)
    end

    it "classifies other ratings as meh" do
      expect(Mood.classify(0.34)).to eq(Mood.MEH)
      expect(Mood.classify(0.66)).to eq(Mood.MEH)
    end
  end
end
