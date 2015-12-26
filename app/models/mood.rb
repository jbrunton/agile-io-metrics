class Mood < ActiveRecord::Base
  def self.GOOD
    Mood.find_or_create_by(name: 'good') do |mood|
      mood.weight = 1.0;
    end
  end

  def self.MEH
    Mood.find_or_create_by(name: 'meh') do |mood|
      mood.weight = 0.5;
    end
  end

  def self.BAD
    Mood.find_or_create_by(name: 'bad') do |mood|
      mood.weight = 0.0;
    end
  end

  def self.classify(rating)
    if rating > 0.66
      Mood.GOOD
    elsif rating > 0.33
      Mood.MEH
    else
      Mood.BAD
    end
  end
end
