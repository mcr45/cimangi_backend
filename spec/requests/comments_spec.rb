require 'rails_helper'

RSpec.describe "Comments", type: :request do

  describe "GET /comments" do
    before do
      post=create(:post)
      user=create(:user)
      10.times do |i|
        post.comments.create(body:'hey there')
      end
      @body=response.body
    end
    context 'it return al resource related comments' do
      it'load all the comments' do
      get '/posts/comments'
      expect(body.size).to eq(post.comments.size)
      expect(response).to have_http-status_status(:success)
      end
    end

  end
  describe "POST/comments"do
    context "the user comment a resource"do
      it"add the comment to the resource"do
        user=create(:user)
        post=create(:post)
        post "/posts/comments", params: attributes_for(:comment,user:user)
        expect(response).to have_http_status(:succes)
      end
    end
  end
end
