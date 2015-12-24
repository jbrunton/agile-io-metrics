class Mood < ActiveRecord::Base
  GOOD = Mood.find_or_create_by(name: 'good') do |mood|
    mood.weight = 1.0;
  end

  MEH = Mood.find_or_create_by(name: 'meh') do |mood|
    mood.weight = 0.5;
  end

  BAD = Mood.find_or_create_by(name: 'bad') do |mood|
    mood.weight = 0.0;
  end
end
