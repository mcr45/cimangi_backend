require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:expected_post)do
    {"title"=>String,
    "body"=>"String",
    "likes"=>Integer,
    "user_id"=>Integer}
  end

 
  describe "GET /posts" do
    before do
      create_list(:post,10)
      #debugger
      get "/posts"
      @body=JSON.parse(response.body) 
    end
    it'return valid post structure' do
      @body.each do |post|
        expect(post.keys).to include(*expected_post.keys)
      end
    end
    it'receive a correct response' do
      expect(response).to have_http_status(:success)
    end

    it "return all post" do
      expect(@body.size).to eq(10)
    end
    
  end
  describe 'GET/show'do
    let(:post_id){create(:post).id}
    before do
      get"/posts/#{post_id}"
      @body=JSON.parse(response.body)
    end
    it'show te post' do
      expect(response).to have_http_status(:success)
    end
    it'return post with the right structure' do
      #debugger
      expect(@body.keys).to include(*expected_post.keys)
    end
  end
  describe 'POST/posts'do

    it 'does not create a post with no title'do
      post'/posts', params: attributes_for(:post,title:nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'does not create a post with no body'do
      post'/posts', params: attributes_for(:post,body:nil)
      expect(response).to have_http_status(:unprocessable_entity)
    end




  end




end
