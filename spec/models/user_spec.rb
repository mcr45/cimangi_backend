require 'rails_helper'

RSpec.describe User, type: :model do
  context 'given the right attributes' do
    it 'create a valid new user' do
      user=build(:user)
      expect(user).to be_valid
    end
  end

  context 'with wrong attributes number or type' do
    it 'does not create a user without a username' do
      user=build(:user,username:nil)
      expect(user).not_to be_valid
    end
    it'does not create a user without an email' do
      user=build(:user,email:nil)
      expect(user).not_to be_valid
    end
    it 'does not create a user with no name'do
      user=build(:user,first_name:nil)
      expect(user).not_to be_valid
    end
  end

  context 'when given' do
    it 'hashes the password' do
      user=create(:user,password:'password')
      expect(user.password_digest).not_to eq('password')
    end
  end



end
