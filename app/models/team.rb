class Team < ActiveRecord::Base
  resourcify
  belongs_to :organization
  validates :name, presence: true
end
