require 'rails_helper'

RSpec.describe "Comments", type: :request do

  describe "GET /comments" do
    before do
      @post=build(:post)
      #debugger
      @user=create(:user)
      @post.user_id=@user.id
      @post.save
      10.times do |i|
        @post.comments.create(body:'hey there',user:@user)
        #debugger
      end
      #debugger
      #get "/posts/#{@post.id}/comments"
      #debugger
      #@body=JSON.parse(response.body)
    end
    context 'it return al resource related comments' do
      it'load all the comments' do
      get "/posts/#{@post.id}/comments"
      #debugger
      @body=JSON.parse(response.body)
      expect(@body.size).to eq(@post.comments.size)
      expect(response).to have_http_status(:success)
      end
    end

  end
  describe "POST/comments"do
    context "the user comment a resource"do
      it"add the comment to the resource"do
        user=create(:user)
        post=create(:post)
        post.user_id=user.id
        post "/posts/#{post.id}/comments", params: attributes_for(:comment,body:'hey there')
        #debugger
        expect(response).to have_http_status(:success)
      end
    end
  end
end
