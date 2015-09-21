require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:auth_membership_hash) do
    {
      slack_uid: 'U9999999',
      slack_access_token: 'some-access-token',
      role: 'admin'
    }.with_indifferent_access
  end
  let(:create_user) do
    FactoryGirl.create(
      :user,
      email: 'some@email.com',
      name: 'some name of some dude'
    )
  end
  let(:create_team) do
    FactoryGirl.create(
      :team,
      slack_team_id: 'T9380938',
      name: 'Some Slack Team'
    )
  end

  describe '::auth_find_or_create' do
    it 'return a Membership with the correct info' do
      user = create_user
      team = create_team
      membership = Membership.auth_find_or_create(
        user,
        team,
        auth_membership_hash
      )
      expect(membership).to be_a Membership
      expect(membership.user).to eq user
      expect(membership.joinable).to eq team
      expect(membership.slack_uid).to eq auth_membership_hash['slack_uid']
      expect(membership.slack_uid).to eq auth_membership_hash['slack_uid']
      expect(membership.slack_uid).to eq auth_membership_hash['slack_uid']
      expect(membership.slack_access_token).to eq(
        auth_membership_hash['slack_access_token']
      )
      expect(membership.role).to eq auth_membership_hash['role']
    end

    context 'membership already exists' do
      before do
        @team = create_team
        @user = create_user
        FactoryGirl.create(
          :membership,
          user: @user,
          joinable: @team,
          slack_uid: auth_membership_hash['slack_uid'],
          slack_access_token: auth_membership_hash['slack_access_token'],
          role: 'member'
        )
      end

      it 'does not duplicate an existing membership' do
        expect do
          Membership.auth_find_or_create(
            @user,
            @team,
            auth_membership_hash
          )
        end.to_not change(Membership, :count)
      end

      it 'updates the memberships info' do
        membership = Membership.auth_find_or_create(
          @user,
          @team,
          auth_membership_hash
        )
        expect(membership.role).to eq auth_membership_hash['role']
      end
    end
  end
end
