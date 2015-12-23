class Mood < ActiveRecord::Base
  HAPPY = Mood.find_or_create_by(name: 'happy') do |mood|
    mood.weight = 1.0;
  end

  MEH = Mood.find_or_create_by(name: 'meh') do |mood|
    mood.weight = 0.5;
  end

  SAD = Mood.find_or_create_by(name: 'sad') do |mood|
    mood.weight = 0.0;
  end
end
