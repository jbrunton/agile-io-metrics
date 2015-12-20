class Organization < ActiveRecord::Base
  resourcify
  validates :name, presence: true
end
