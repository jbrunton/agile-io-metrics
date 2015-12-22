class Organization < ActiveRecord::Base
  resourcify
  validates :name, presence: true
  has_many :teams
  has_many :surveys
end
