require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'when user insert all post values' do
    it 'create a valid post' do
      post=build(:post)
      expect(post).to be_valid
    end
  end
  context 'when user does not insert valid data'do
  it 'does not create a post with no title' do
  post=build(:post,title:nil)
  expect(post).not_to be_valid
  end
  
  it'does not create a post with a body shorter than 20 characters'do
    post=build(:post,body:'nulla')
    expect(post).not_to be_valid
  end
end
it 'does associate a post to the user' do
  user=build(:user)
  post=build(:post,user:user)
  expect(post.user_id).to eq(user.id) 
end
end
