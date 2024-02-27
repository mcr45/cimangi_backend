require 'rails_helper'

RSpec.describe Comment, type: :model do
  context"when the user enter a comment"do
    it'validate a comment with a body'do
    comment=build(:comment)
    expect(comment).to be_valid
    end
  end
  context 'when the user does not enter a body'do
    it 'does not validate the comment'do
      comment=build(:comment,body:nil)
      expect(comment).not_to be_valid
    end
  end
end
