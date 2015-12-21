class Team < ActiveRecord::Base
  resourcify
  belongs_to :organization
  validates :name, presence: true

  def members
    User.with_role(:member, self)
  end

  def admins
    User.with_role(:admin, self)
  end
end
