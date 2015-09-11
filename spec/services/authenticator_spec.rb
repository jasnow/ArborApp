require 'rails_helper'

RSpec.describe Authenticator do
  describe '#authenticate' do
    it 'returns user from auth hash' do
      authenticator = Authenticator.new(auth_hash)

      authenticated_user = authenticator.authenticate

      expect(authenticated_user).to be_a User
      expect(authenticated_user.uid).to eq auth_hash['uid']
      expect(authenticated_user.email).to eq auth_hash['info']['email']
      expect(authenticated_user.name).to eq auth_hash['info']['name']
      expect(authenticated_user.slack_access_token)
        .to eq auth_hash['credentials']['token']
    end
  end

  def auth_hash
    File.read('spec/fixtures/slack_hash.json')
  end
end