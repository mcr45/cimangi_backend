require 'rails_helper'

RSpec.describe "Users", type: :request do


  describe "POST/users" do
    
    it 'create a user when right input is given' do
      post'/users', params: attributes_for(:user)
      
      expect(response).to have_http_status(:created)
      expect(User.count).to eq(1)
    end

    context "with invalid attributes" do
      it'does not create a user without username,email,first or last name' do
        post'/users', params: attributes_for(:user,username:nil,first_name:nil)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(User.count).to eq(0)
      end
    end
  end
end
