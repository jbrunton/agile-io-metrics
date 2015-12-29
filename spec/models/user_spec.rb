require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "#member_of" do
    context "when given a team" do
      let(:team) { create(:team) }

      it "returns false if the user isn't a member of the team" do
        expect(user.member_of?(team)).to eq(false)
      end

      it "returns true if the user has :member role on the team" do
        user.add_role(:member, team)
        expect(user.member_of?(team)).to eq(true)
      end
    end

    context "when given an organization" do
      let(:organization) { create(:organization) }

      it "returns false if the user doesn't belong to the organization" do
        expect(user.member_of?(organization)).to eq(false)
      end

      it "returns true if the user is a member of any teams in the organization" do
        team = create(:team, organization: organization)
        user.add_role(:member, team)
        expect(user.member_of?(organization)).to eq(true)
      end

      it "returns true if the user an adminn of any teams in the organization" do
        team = create(:team, organization: organization)
        user.add_role :admin, team
        expect(user.member_of?(organization)).to eq(true)
      end
    end
  end

  describe "#admin_of?" do
    let(:team) { create(:team) }

    it "returns false if the user isn't an admin of the record" do
      expect(user.admin_of?(team)).to eq(false)
    end

    it "returns true if the user is an admin of the record" do
      user.add_role :admin, team
      expect(user.admin_of?(team)).to eq(true)
    end
  end

  describe "#roles_on" do
    let(:team) { create(:team) }

    it "returns an empty list if the user has no roles on the record" do
      expect(user.roles_on team).to eq([])
    end

    it "returns a list of the roles the user has on the record" do
      user.add_role :admin, team
      user.add_role :member, team

      expect(user.roles_on team).to eq([:admin, :member])
    end
  end

  describe "#teams" do
    let(:team_one) { create(:team) }
    let(:team_two) { create(:team) }
    let(:team_three) { create(:team) }

    before(:each) do
      user.add_role :member, team_one
    end

    context "when given no arguments" do
      it "returns all teams the user belongs to" do
        user.add_role :admin, team_two

        expect(user.teams).to include(team_one, team_two)
        expect(user.teams).not_to include(team_three)
      end
    end

    context "when given a specific role" do
      it "returns all teams for which the user has that role" do
        user.add_role :admin, team_two
        expect(user.teams(:member)).to include(team_one)
      end
    end

    it "removes duplicates from the list" do
      user.add_role :admin, team_one
      expect(user.teams).to eq([team_one])
    end
  end

  describe "#organization" do
    let(:org_one) { create(:organization) }
    let(:org_two) { create(:organization) }
    let(:team) { create(:team, organization: org_one) }

    before(:each) do
      user.add_role :member, team
    end

    it "returns all organizations the user belongs to" do
      user.add_role :admin, org_two

      expect(user.organizations).to include(org_one, org_two)
    end

    it "removes duplicates from the list" do
      user.add_role :admin, org_one
      expect(user.organizations).to eq([org_one])
    end
  end

  describe "#find_or_invite" do
    let(:email) { 'user@example.com' }

    context "if a user with the given email exists" do
      let!(:user) { create(:user, email: email) }

      it "returns that user" do
        expect(User.find_or_invite(email)).to eq(user)
      end
    end

    context "if no such user exists" do
      it "invites that user" do
        expect(User).to receive(:invite!).with(email: email).and_call_original
        user = User.find_or_invite(email)
        expect(user.email).to eq(email)
      end
    end
  end
end
