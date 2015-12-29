class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def member_of?(record)
    if record.class == Organization
      record.teams.any?{ |team| member_of?(team) || admin_of?(team) }
    else
      has_role?(:member, record)
    end
  end

  def admin_of?(record)
    has_role?(:admin, record)
  end

  def roles_on(record)
    roles = []
    roles << :admin if admin_of?(record)
    roles << :member if member_of?(record)
    roles
  end

  def teams(role = nil)
    return Team.with_role(role, self) unless role.nil?
    Team.with_roles([:admin, :member], self).uniq
  end

  def organizations
    (Organization.with_roles([:admin], self) +
      teams.map{ |team| team.organization }).uniq
  end
end
