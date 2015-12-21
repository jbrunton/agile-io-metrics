class Team < ActiveRecord::Base
  resourcify
  belongs_to :organization
end
