class Mood < ActiveRecord::Base
  def self.GOOD
    Mood.where(name: 'good').first_or_create! do |mood|
      mood.weight = 1.0;
    end
  end

  def self.MEH
    Mood.where(name: 'meh').first_or_create do |mood|
      mood.weight = 0.5;
    end
  end

  def self.BAD
    Mood.where(name: 'bad').first_or_create! do |mood|
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
