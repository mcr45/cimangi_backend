require 'rails_helper'

RSpec.describe Recipe, type: :model do
 context 'when all the attribbutes are given'do
    it'create a new recipe'do
      recipe=build(:recipe)
      expect(recipe).to be_valid
    end
 end
 context 'when wrong values are being given'do
    it'does not validate a recipe with no title'do
      recipe=build(:recipe,title:nil)
      expect(recipe).not_to be_valid
    end
    it'does not validate a recipe with no body'do
      recipe=build(:recipe,body:"domino's pizza"*300)
      expect(recipe).not_to be_valid
    end
 end
 it'associate a recipe to a user if given a reference'do
  user=build(:user)
  recipe=build(:recipe,user:user)
  expect(recipe.user_id).to eq(user.id)
 end
end
