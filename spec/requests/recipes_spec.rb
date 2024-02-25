require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  let(:expected_recipe)do{
    "title"=>String,
    "body"=>String,
    "category"=>String,
"user_id"=>Integer
  }
end
  describe "GET /recipes" do
    before do
      create_list(:recipe,20)
      
      get '/recipes'
      
      @body=JSON.parse(response.body)
    end
    it'cretae a recipe with valid attributes'do 
      @body.each do |rec|
        expect(rec.keys).to include(*expected_recipe.keys)
      end
    end
    it "return all recipes" do
      expect(Recipe.count).to eq(20)
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET/show" do
    let(:recipe_id){create(:recipe).id}
    before do
      get "/recipes/#{recipe_id}"
      @body=JSON.parse(response.body)
    end
    it'show the right recipe'do
      expect(response).to have_http_status(:success)
    end
    it 'return recipe with right keys'do
      expect(@body.keys).to include(*expected_recipe.keys)
    end
  end
end
