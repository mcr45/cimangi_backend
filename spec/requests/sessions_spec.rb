require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe'POST/sessions'do
    let(:user){create(:user)}

    it'validates a user with valid username and password'do
      post'/login', params: attributes_for(:user,username:user.username,password:'password')
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include('token')
    end
    
    it'not allow a session to not authenticated user'do
      
      post'/login',params: attributes_for(:user,username:user.username,password:'notthepassword')
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
